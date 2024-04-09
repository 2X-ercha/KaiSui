module rtu_rob_entry (
    clk,
    rst_clk,

    create_vld,
    create_opcode,
    create_funct3,
    create_pc,
    create_src1,
    create_src1_vld,
    create_psrc1,
    create_src2,
    create_src2_vld,
    create_psrc2,
    create_dst,
    create_dst_vld,
    create_pdst,
    create_imm,
    create_imm_vld,
    create_type,
    create_pipe,
    create_ras,

    issue_vld,
    complete_vld,
    bju_vld,
    rtu_global_flush,

    head_iid_ptr_cur_vld,
    ebreak_gpr10,

    retire_vld,
    jump_vld,
    flush_vld,

    inst_message
);
    // &Ports;
    input         clk;
    input         rst_clk;

    input         create_vld;
    input  [6 :0] create_opcode;
    input  [2 :0] create_funct3;
    input  [63:0] create_pc;
    input  [4 :0] create_src1;
    input         create_src1_vld;
    input  [5 :0] create_psrc1;
    input  [4 :0] create_src2;
    input         create_src2_vld;
    input  [5 :0] create_psrc2;
    input  [4 :0] create_dst;
    input         create_dst_vld;
    input  [5 :0] create_pdst;
    input  [63:0] create_imm;
    input         create_imm_vld;
    input  [5 :0] create_type;
    input  [4 :0] create_pipe;
    input         create_ras;

    input         issue_vld;
    input         complete_vld;
    input         bju_vld;
    input         rtu_global_flush;

    input         head_iid_ptr_cur_vld;
    input  [63:0] ebreak_gpr10;             // 专用寄存器，ebreak指令被译码为 mv ebreak_gpr10, x10

    output        retire_vld;
    output        jump_vld;
    output        flush_vld;

    output [190:0] inst_message;

    // &Regs;
    reg        vld;
    reg [6 :0] opcode;
    reg [2 :0] funct3;
    reg [63:0] pc;
    reg [4 :0] src1;
    reg        src1_vld;
    reg [5 :0] psrc1;
    reg [4 :0] src2;
    reg        src2_vld;
    reg [5 :0] psrc2;
    reg [4 :0] dst;
    reg        dst_vld;
    reg [5 :0] pdst;
    reg [63:0] imm;
    reg        imm_vld;
    reg [5 :0] inst_type;
    reg [4 :0] pipe;
    reg        issue;
    reg        complete;
    reg        bju;
    reg        ras;

    reg        flush_vld;
    reg        jump_vld;

    // &Wires;
    wire        clk;
    wire        rst_clk;

    wire        create_vld;
    wire [6 :0] create_opcode;
    wire [2 :0] create_funct3;
    wire [63:0] create_pc;
    wire [4 :0] create_src1;
    wire        create_src1_vld;
    wire [5 :0] create_psrc1;
    wire [4 :0] create_src2;
    wire        create_src2_vld;
    wire [5 :0] create_psrc2;
    wire [4 :0] create_dst;
    wire        create_dst_vld;
    wire [5 :0] create_pdst;
    wire [63:0] create_imm;
    wire        create_imm_vld;
    wire [5 :0] create_type;
    wire [4 :0] create_pipe;
    wire        create_ras;

    wire        issue_vld;
    wire        complete_vld;
    wire        bju_vld;
    wire        rtu_global_flush;

    wire        head_iid_ptr_cur_vld;
    wire [63:0] ebreak_gpr10;

    wire        retire_vld;

    wire [190:0] inst_message;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            vld       <= 1'b0;
            opcode    <= 7'b0;
            funct3    <= 3'b0;
            pc        <= 64'b0;
            src1      <= 5'b0;
            src1_vld  <= 1'b0;
            psrc1     <= 6'b0;
            src2      <= 5'b0;
            src2_vld  <= 1'b0;
            psrc2     <= 6'b0;
            dst       <= 5'b0;
            dst_vld   <= 1'b0;
            pdst      <= 6'b0;
            imm       <= 64'b0;
            imm_vld   <= 1'b0;
            inst_type <= 6'b0;
            pipe      <= 5'b0;
            ras       <= 1'b0;
        end
        else if (rtu_global_flush || retire_vld) begin
            vld       <= 1'b0;
            opcode    <= 7'b0;
            funct3    <= 3'b0;
            pc        <= 64'b0;
            src1      <= 5'b0;
            src1_vld  <= 1'b0;
            psrc1     <= 6'b0;
            src2      <= 5'b0;
            src2_vld  <= 1'b0;
            psrc2     <= 6'b0;
            dst       <= 5'b0;
            dst_vld   <= 1'b0;
            pdst      <= 6'b0;
            imm       <= 64'b0;
            imm_vld   <= 1'b0;
            inst_type <= 6'b0;
            pipe      <= 5'b0;
            ras       <= 1'b0;
        end
        else if (create_vld) begin
            vld       <= 1'b1;
            opcode    <= create_opcode;
            funct3    <= create_funct3;
            pc        <= create_pc;
            src1      <= create_src1;
            src1_vld  <= create_src1_vld;
            psrc1     <= create_psrc1;
            src2      <= create_src2;
            src2_vld  <= create_src2_vld;
            psrc2     <= create_psrc2;
            dst       <= create_dst;
            dst_vld   <= create_dst_vld;
            pdst      <= (create_dst == 0) ? 0 : create_pdst;
            imm       <= create_imm;
            imm_vld   <= create_imm_vld;
            inst_type <= create_type;
            pipe      <= create_pipe;
            ras       <= create_ras;
        end
        else begin
            vld       <= vld;
            opcode    <= opcode;
            funct3    <= funct3;
            pc        <= pc;
            src1      <= src1;
            src1_vld  <= src1_vld;
            psrc1     <= psrc1;
            src2      <= src2;
            src2_vld  <= src2_vld;
            psrc2     <= psrc2;
            dst       <= dst;
            dst_vld   <= dst_vld;
            pdst      <= pdst;
            imm       <= imm;
            imm_vld   <= imm_vld;
            inst_type <= inst_type;
            pipe      <= pipe;
            ras       <= ras;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            issue <= 0;
        else if (rtu_global_flush || retire_vld)
            issue <= 0;
        else if (issue_vld && vld)
            issue <= 1;
        else
            issue <= issue;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            complete <= 0;
        else if (rtu_global_flush || retire_vld)
            complete <= 0;
        else if (complete_vld && vld)
            complete <= 1;
        else
            complete <= complete;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            bju <= 0;
        else if (rtu_global_flush || retire_vld)
            bju <= 0;
        else if (bju_vld & vld)
            bju <= 1;
        else
            bju <= bju;
    end

    // retire sign
    assign retire_vld = (complete | complete_vld) & head_iid_ptr_cur_vld & vld & ~rtu_global_flush;

    // flush sign and jump_en（同一条线）
    // flush 周期可以取指（注 fetch 时 IF 依然取指令，但 ID 需要刷新
    // 但 flush 需要在retire vld的下一周期，否则JALR指令的PREG会来不及retire，导致recover出错
    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            flush_vld <= 0;
            jump_vld  <= 0;
        end
        else if (rtu_global_flush) begin
            flush_vld <= 0;
            jump_vld  <= 0;
        end
        else if (retire_vld & (bju | ras | bju_vld)) begin
            flush_vld <= 1;
            jump_vld  <= 1;
        end
        else begin
            flush_vld <= 0;
            jump_vld  <= 0;
        end
    end

    // ebreak
    always @(retire_vld)
    begin
        if (opcode == I_ENV && imm == ENVFLAG_EBREAK)
            ebreak(pc, ebreak_gpr10);
    end

    assign inst_message = {vld, opcode, funct3, pc, bju, ras,
                           src1_vld, src1, psrc1,
                           src2_vld, src2, psrc2,
                           dst_vld,  dst,  pdst,
                           imm_vld,  imm,
                           inst_type, pipe, issue, complete};
endmodule
