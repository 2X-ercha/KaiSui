/*
 * Physical Register Status Table Entry
 *
 * PST (物理寄存器状态表) 用于维护物理寄存器的使用情况（free or busy），表项信息如下：
 *     stats             : 此寄存器的分配状态
 *     iid               : inst id, 表示对应指令在 ROB 中的表项 id，用于监控指令的退休
 *     gpr_index         : 此寄存器对应的逻辑寄存器 GPR 索引
 *     gpr_pre_preg_index: 此寄存器对应的逻辑寄存器 GPR 之前对应的物理寄存器索引，用于给出释放信号
 *     iwb               : 对应指令结果是否回写
 * 功能点:
 *     [*] 在系统开始时，所有物理寄存器应处于 DEALLOC 状态
 *     [*] 提供给 rtu_pst_preg 用于分配寄存器的 x_preg_cur_stats_dealloc
 *     [*] 修改 stats 的各项信号和状态转换逻辑
 *     [*] 自身状态维护 IDLE or WB
 *     [*] 创建时给出 GPR index, GPR pre preg index，当该寄存器 retire 时，rename table 中对应 GPR 更新，其指向的旧的 Preg 被释放
 *     [*] flush时 rename table 恢复（只有处于 retire 状态的 preg 才可以 recover）
 *     [ ] （暂时不加，不知道这里的 flush 冲刷会不会引起时序问题）同步复位（c910 中的 ifu_xx_sync_reset）
 *     [ ]  (暂时不加) 快速退休逻辑所需的信号
 * 控制信号等由 PST 给出
 */

module rtu_pst_preg_entry(
    clk,
    rst_clk,
    create_iid,                 // 由idu ir级传入，创建表项的指令 id
    create_gpr_index,           // inst 对应的 gpr 索引
    create_gpr_pre_preg_index,  // gpr 索引目前对应的 preg 索引，用于 retire 时释放
    rtu_global_flush,
    x_pre_alloc_vld,            // PST 告诉该寄存器被选中
    x_alloc_vld,                // inst -> IS 时给出创建信号，RTU 创建 ROB 表项同时由 PST 给出信号
    x_release_vld,              // 由其他 PST entry 给出
    x_inst_retire_iid,          // 退休指令的iid，用于匹配产生自身退休信号
    x_retire_vld,               // 由 ROB 给出
    x_wb_vld,                   // 由 ROB 给出
    x_reset_mapped,             // reset 初始状态分配
    x_reset_gpr_mapped,         // reset 初始 gpr 分配
    x_pre_preg_release_expand,  // retire 时释放其他 preg 的 release_vld 旁路
    x_recover_table_preg_to_gpr,// recover table 展开表项
    x_preg_cur_stats_dealloc
);
    // &Ports;
    input         clk;
    input         rst_clk;

    input  [3 :0] create_iid;
    input  [4 :0] create_gpr_index;
    input  [5 :0] create_gpr_pre_preg_index;

    input         rtu_global_flush;
    input         x_pre_alloc_vld;
    input         x_alloc_vld;
    input         x_release_vld;
    input  [3 :0] x_inst_retire_iid;
    input         x_retire_vld;
    input         x_wb_vld;

    input         x_reset_mapped;
    input  [4 :0] x_reset_gpr_mapped;

    output [63:0] x_pre_preg_release_expand;
    output [31:0] x_recover_table_preg_to_gpr;
    output        x_preg_cur_stats_dealloc;

    // &Regs;
    reg [4 :0] preg_cur_stats;
    reg [4 :0] preg_next_stats;
    reg        preg_wb_cur_stats;
    reg        preg_wb_next_stats;
    reg [3 :0] iid;
    reg [4 :0] gpr_index;
    reg [5 :0] gpr_pre_preg_index;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire [3 :0] create_iid;
    wire [4 :0] create_gpr_index;
    wire [5 :0] create_gpr_pre_preg_index;
    wire        rtu_global_flush;
    wire        x_pre_alloc_vld;
    wire        x_alloc_vld;
    wire        x_release_vld;
    wire [3 :0] x_inst_retire_iid;
    wire        x_retire_vld;
    wire        x_wb_vld;
    wire        x_reset_mapped;
    wire [4 :0] x_reset_gpr_mapped;
    wire [63:0] x_pre_preg_release_expand;
    wire [31:0] x_recover_table_preg_to_gpr;
    wire [4 :0] preg_reset_stats;
    wire        x_preg_cur_stats_dealloc;
    wire        preg_cur_stats_dealloc;
    // wire        preg_cur_stats_wfalloc;
    wire        preg_cur_stats_alloc;
    wire        preg_cur_stats_retire;
    // wire        preg_cur_stats_release;
    wire        preg_wb_reset_stats;
    wire        preg_wb_cur_stats_wb;
    wire        retire_vld;
    wire [63:0] pre_preg_release_expand;
    wire        pre_preg_retire_vld;
    wire [31:0] recover_table_preg_to_gpr;

    // &Parameters;
    parameter DEALLOC    = 5'b00001;
    parameter WF_ALLOC   = 5'b00010;
    parameter ALLOC      = 5'b00100;
    parameter RETIRE     = 5'b01000;
    parameter RELEASE    = 5'b10000;

    parameter IDLE = 1'b0;
    parameter WB   = 1'b1;

    /*
     * FSM of PST
     *
     * stats:
     *     DEALLOC: 表示此寄存器已经被写回和释放，已具备被重新分配的条件，但还需要经过优先级的判定来变为 WF_ALLOC
     *     WFALLOC: 表示此寄存器等待被分配，一旦IDU派遣指令，此物理寄存器就会被分配，并转换到 ALLOC 状态
     *     ALLOC  : 表示此寄存器已经被分配，若其对应的指令退休则会转换到 RETIRE，若物理寄存器被释放则会转换到 RELEASE，若指令退休且已写回则会转换到 DEALLOC
     *     RETIRE : 表示此寄存器对应的指令已经退休，若物理寄存器被释放则会转换到 RELEASE，若指令已写回则会转换到 DEALLOC。
     *     RELEASE: 表示此寄存器对应的 GPR 已经被分配新的表项，可以被释放
     * 功能点:
     *     当 RTU 产生 flush 信号时，所有被分配但未 retire 的表项将被清除为 DEALLOC 状态，对应的 WB 状态也将被清除
     *     对于用于控制的信号中，WB 的信号应当是个状态量而不是立即信号，所以不能直接用 x_wb_vld，需要先修改 WB 状态，然后再借由 WB 状态量控制
     */

    assign preg_reset_stats = (x_reset_mapped) ? RETIRE : DEALLOC;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            preg_cur_stats <= preg_reset_stats;
        else
            preg_cur_stats <= preg_next_stats;
    end

    always @(rtu_global_flush
           or x_pre_alloc_vld
           or x_alloc_vld
           or x_release_vld
           or retire_vld
           or preg_wb_cur_stats_wb
           or preg_cur_stats)
    begin
        case (preg_cur_stats)
            DEALLOC:
                if (x_pre_alloc_vld && !rtu_global_flush)
                    preg_next_stats = WF_ALLOC;
                else
                    preg_next_stats = DEALLOC;
            WF_ALLOC:
                if (rtu_global_flush)
                    preg_next_stats = DEALLOC;
                else if (x_alloc_vld)
                    preg_next_stats = ALLOC;
                else
                    preg_next_stats = WF_ALLOC;
            ALLOC:
                if (rtu_global_flush)
                    preg_next_stats = DEALLOC;
                else if (x_release_vld && preg_wb_cur_stats_wb)
                    preg_next_stats = DEALLOC;
                else if (x_release_vld)
                    preg_next_stats = RELEASE;
                else if (retire_vld)
                    preg_next_stats = RETIRE;
                else
                    preg_next_stats = ALLOC;
            RETIRE:
                if (x_release_vld && preg_wb_cur_stats_wb)
                    preg_next_stats = DEALLOC;
                else if (x_release_vld && !preg_wb_cur_stats_wb)   // 适用于快速退休
                    preg_next_stats = RELEASE;
                else
                    preg_next_stats = RETIRE;
            RELEASE:
                if (preg_wb_cur_stats_wb)
                    preg_next_stats = DEALLOC;
                else
                    preg_next_stats = RELEASE;
            default:
                preg_next_stats = DEALLOC;
        endcase
    end

    // ctrl sign
    assign preg_cur_stats_dealloc = preg_cur_stats[0];
    // assign preg_cur_stats_wfalloc = preg_cur_stats[1];
    assign preg_cur_stats_alloc   = preg_cur_stats[2];
    assign preg_cur_stats_retire  = preg_cur_stats[3];
    // assign preg_cur_stats_release = preg_cur_stats[4];

    assign x_preg_cur_stats_dealloc = preg_cur_stats_dealloc;

    /*
     * FSM of Preg write back
     *
     * stats:
     *     IDLE: 该寄存器未被回写，值处于无效状态
     *     WB  : 该寄存器已回写，值有效
     * 功能点:
     *     当发生 flush 信号时，在 WB 态的寄存器需要检查其对应的 GPR 是否指向该寄存器，若指向则仍然保持 WB 态
     *     x_wb_vld 作为即时信号，无法令寄存器从 RELEASE/RETIRE 态回到 DEALLOC 态。需要借由 WB 状态寄存器来将其转化为持续信号量
     */

    assign preg_wb_reset_stats = (x_reset_mapped) ? WB : IDLE;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            preg_wb_cur_stats <= preg_wb_reset_stats;
        else if (x_alloc_vld)
            preg_wb_cur_stats <= IDLE;
        else
            preg_wb_cur_stats <= preg_wb_next_stats;
    end

    always @(x_wb_vld
           or preg_cur_stats_dealloc
           or rtu_global_flush
           or preg_cur_stats_retire
           or preg_wb_cur_stats)
    begin
        case (preg_wb_cur_stats)
            IDLE:
                if (x_wb_vld)
                    preg_wb_next_stats = WB;
                else
                    preg_wb_next_stats = IDLE;
            WB:
                if (preg_cur_stats_dealloc)
                    preg_wb_next_stats = IDLE;
                else if (rtu_global_flush & !preg_cur_stats_retire)
                    preg_wb_next_stats = IDLE;
                else
                    preg_wb_next_stats = WB;
            default:
                preg_wb_next_stats = IDLE;
        endcase
    end

    // ctrl sign
    assign preg_wb_cur_stats_wb = (preg_wb_cur_stats == WB);

    /*
     * Information Register
     *
     * 包含 iid, gpr_index, gpr_pre_preg_index
     * 功能点:
     *     当该寄存器 retire 时，rename table 中对应 GPR 更新，其指向的旧的 Preg 被释放
     */

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            iid                <= 4'b0;
            gpr_index          <= x_reset_gpr_mapped;
            gpr_pre_preg_index <= 6'b0;
        end
        else if (x_alloc_vld) begin
            iid                <= create_iid;
            gpr_index          <= create_gpr_index;
            gpr_pre_preg_index <= create_gpr_pre_preg_index;
        end
        else begin
            iid                <= iid;
            gpr_index          <= gpr_index;
            gpr_pre_preg_index <= gpr_pre_preg_index;
        end
    end

    // retire sign
    // 匹配退休指令的 iid，给出自身 retire 信号
    assign retire_vld = (x_inst_retire_iid == iid) && x_retire_vld;

    // release sign
    // 通过旁路回传 release 信号
    for (genvar i = 0; i < 64; i++)
    begin: release_sign
        assign pre_preg_release_expand[i] = (gpr_pre_preg_index == i);
    end

    assign pre_preg_retire_vld            = preg_cur_stats_alloc && retire_vld;
    assign x_pre_preg_release_expand      = {64{pre_preg_retire_vld}} & pre_preg_release_expand;

    // rename table recovery sign
    for (genvar i = 0; i < 32; i++)
    begin: rename_table_recovery_sign
        assign recover_table_preg_to_gpr[i] = (gpr_index == i);
    end

    assign x_recover_table_preg_to_gpr      = {32{preg_cur_stats_retire}} & recover_table_preg_to_gpr;
endmodule
