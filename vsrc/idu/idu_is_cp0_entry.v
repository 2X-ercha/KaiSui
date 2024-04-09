module idu_is_cp0_entry (
    clk,
    rst_clk,
    rtu_global_flush,
    create_vld,
    create_iid,
    create_opcode,
    create_psrc1_vld,
    create_psrc1_ready,
    create_psrc1,
    create_imm_vld,
    create_imm,
    issue_vld,
    idu_idu_is_alu_is_forward_vld,
    idu_idu_is_alu_is_forward_preg,
    idu_idu_is_alu_rf_forward_vld,
    idu_idu_is_alu_rf_forward_preg,
    exu_idu_is_alu_result_vld,
    exu_idu_is_alu_result_preg,
    exu_idu_is_mul1_forward_vld,
    exu_idu_is_mul1_forward_preg,
    exu_idu_is_mul2_forward_vld,
    exu_idu_is_mul2_forward_preg,
    exu_idu_is_mul3_result_vld,
    exu_idu_is_mul3_result_preg,
    exu_idu_is_div1_forward_vld,
    exu_idu_is_div1_forward_preg,
    exu_idu_is_div2_forward_vld,
    exu_idu_is_div2_forward_preg,
    exu_idu_is_div3_result_vld,
    exu_idu_is_div3_result_preg,
    exu_idu_is_lsu_result_vld,
    exu_idu_is_lsu_result_preg,
    vld,
    iid,
    opcode,
    psrc1_vld,
    psrc1,
    imm_vld,
    imm,
    ready
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         create_vld;
    input  [4 :0] create_iid;
    input  [6 :0] create_opcode;
    input         create_psrc1_vld;
    input         create_psrc1_ready;
    input  [5 :0] create_psrc1;
    input         create_imm_vld;
    input  [63:0] create_imm;
    input         issue_vld;
    input         idu_idu_is_alu_is_forward_vld;
    input  [5 :0] idu_idu_is_alu_is_forward_preg;
    input         idu_idu_is_alu_rf_forward_vld;
    input  [5 :0] idu_idu_is_alu_rf_forward_preg;
    input         exu_idu_is_alu_result_vld;
    input  [5 :0] exu_idu_is_alu_result_preg;
    input         exu_idu_is_mul1_forward_vld;
    input  [5 :0] exu_idu_is_mul1_forward_preg;
    input         exu_idu_is_mul2_forward_vld;
    input  [5 :0] exu_idu_is_mul2_forward_preg;
    input         exu_idu_is_mul3_result_vld;
    input  [5 :0] exu_idu_is_mul3_result_preg;
    input         exu_idu_is_div1_forward_vld;
    input  [5 :0] exu_idu_is_div1_forward_preg;
    input         exu_idu_is_div2_forward_vld;
    input  [5 :0] exu_idu_is_div2_forward_preg;
    input         exu_idu_is_div3_result_vld;
    input  [5 :0] exu_idu_is_div3_result_preg;
    input         exu_idu_is_lsu_result_vld;
    input  [5 :0] exu_idu_is_lsu_result_preg;
    output        vld;
    output [4 :0] iid;
    output [6 :0] opcode;
    output        psrc1_vld;
    output [5 :0] psrc1;
    output        imm_vld;
    output [63:0] imm;
    output        ready;

    // &Regs;
    reg        vld;
    reg [4 :0] iid;
    reg [6 :0] opcode;
    reg        psrc1_vld;
    reg        psrc1_ready;
    reg [5 :0] psrc1;
    reg        imm_vld;
    reg [63:0] imm;

    // Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        create_vld;
    wire [4 :0] create_iid;
    wire [6 :0] create_opcode;
    wire        create_psrc1_vld;
    wire        create_psrc1_ready;
    wire [5 :0] create_psrc1;
    wire        create_imm_vld;
    wire [63:0] create_imm;
    wire        issue_vld;
    wire        idu_idu_is_alu_is_forward_vld;
    wire [5 :0] idu_idu_is_alu_is_forward_preg;
    wire        idu_idu_is_alu_rf_forward_vld;
    wire [5 :0] idu_idu_is_alu_rf_forward_preg;
    wire        exu_idu_is_alu_result_vld;
    wire [5 :0] exu_idu_is_alu_result_preg;
    wire        exu_idu_is_mul1_forward_vld;
    wire [5 :0] exu_idu_is_mul1_forward_preg;
    wire        exu_idu_is_mul2_forward_vld;
    wire [5 :0] exu_idu_is_mul2_forward_preg;
    wire        exu_idu_is_mul3_result_vld;
    wire [5 :0] exu_idu_is_mul3_result_preg;
    wire        exu_idu_is_div1_forward_vld;
    wire [5 :0] exu_idu_is_div1_forward_preg;
    wire        exu_idu_is_div2_forward_vld;
    wire [5 :0] exu_idu_is_div2_forward_preg;
    wire        exu_idu_is_div3_result_vld;
    wire [5 :0] exu_idu_is_div3_result_preg;
    wire        exu_idu_is_lsu_result_vld;
    wire [5 :0] exu_idu_is_lsu_result_preg;
    wire        ready;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            psrc1_vld   <= 0;
            psrc1_ready <= 0;
            psrc1       <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (rtu_global_flush || issue_vld) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            psrc1_vld   <= 0;
            psrc1_ready <= 0;
            psrc1       <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (create_vld) begin
            vld         <= 1;
            iid         <= create_iid;
            opcode      <= create_opcode;
            psrc1_vld   <= create_psrc1_vld;
            psrc1_ready <= create_psrc1_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == create_psrc1))
                                              | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == create_psrc1))
                                              | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == create_psrc1))
                                              | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == create_psrc1))
                                              | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == create_psrc1))
                                              | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == create_psrc1))
                                              | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == create_psrc1))
                                              | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == create_psrc1))
                                              | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == create_psrc1))
                                              | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == create_psrc1));
            psrc1       <= create_psrc1;
            imm_vld     <= create_imm_vld;
            imm         <= create_imm;
        end
        else begin
            vld         <= vld;
            iid         <= iid;
            opcode      <= opcode;
            psrc1_vld   <= psrc1_vld;
            psrc1_ready <= psrc1_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == psrc1))
                                       | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == psrc1))
                                       | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == psrc1))
                                       | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == psrc1))
                                       | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == psrc1))
                                       | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == psrc1))
                                       | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == psrc1))
                                       | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == psrc1))
                                       | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == psrc1))
                                       | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == psrc1));
            psrc1       <= psrc1;
            imm_vld     <= imm_vld;
            imm         <= imm;
        end
    end

    assign ready = psrc1_ready & vld;
endmodule