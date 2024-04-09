module exu_cp0 (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_exu_cp0_vld,
    idu_exu_cp0_iid,
    idu_exu_cp0_opcode,
    idu_exu_cp0_psrc1_vld,
    idu_exu_cp0_psrc1_value,
    idu_exu_cp0_imm_vld,
    idu_exu_cp0_imm,
    exu_rtu_rob_cp0_complete,
    exu_rtu_rob_cp0_iid,
    ebreak_gpr10
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_exu_cp0_vld;
    input  [4 :0] idu_exu_cp0_iid;
    input  [6 :0] idu_exu_cp0_opcode;
    input         idu_exu_cp0_psrc1_vld;
    input  [63:0] idu_exu_cp0_psrc1_value;
    input         idu_exu_cp0_imm_vld;
    input  [63:0] idu_exu_cp0_imm;
    output        exu_rtu_rob_cp0_complete;
    output [4 :0] exu_rtu_rob_cp0_iid;
    output [63:0] ebreak_gpr10;

    // &Regs;
    reg        vld;
    reg [4 :0] iid;
    reg [6 :0] opcode;
    reg        psrc1_vld;
    reg [63:0] psrc1_value;
    reg        imm_vld;
    reg [63:0] imm;
    reg [63:0] ebreak_gpr10;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_exu_cp0_vld;
    wire [4 :0] idu_exu_cp0_iid;
    wire [6 :0] idu_exu_cp0_opcode;
    wire        idu_exu_cp0_psrc1_vld;
    wire [63:0] idu_exu_cp0_psrc1_value;
    wire        idu_exu_cp0_imm_vld;
    wire [63:0] idu_exu_cp0_imm;
    wire        exu_rtu_rob_cp0_complete;
    wire [4 :0] exu_rtu_rob_cp0_iid;
    wire        I_ebreak = (idu_exu_cp0_opcode == I_ENV) & (idu_exu_cp0_imm == ENVFLAG_EBREAK);

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            vld          <= 0;
            iid          <= 0;
            opcode       <= 0;
            psrc1_vld    <= 0;
            psrc1_value  <= 0;
            imm_vld      <= 0;
            imm          <= 0;
            ebreak_gpr10 <= 0;
        end
        else if (rtu_global_flush) begin
            vld          <= 0;
            iid          <= 0;
            opcode       <= 0;
            psrc1_vld    <= 0;
            psrc1_value  <= 0;
            imm_vld      <= 0;
            imm          <= 0;
            ebreak_gpr10 <= 0;
        end
        else if (idu_exu_cp0_vld) begin
            vld          <= 1;
            iid          <= idu_exu_cp0_iid;
            opcode       <= idu_exu_cp0_opcode;
            psrc1_vld    <= idu_exu_cp0_psrc1_vld;
            psrc1_value  <= idu_exu_cp0_psrc1_value;
            imm_vld      <= idu_exu_cp0_imm_vld;
            imm          <= idu_exu_cp0_imm;
            ebreak_gpr10 <= (I_ebreak) ? idu_exu_cp0_psrc1_value : 0;
        end
        else begin
            vld          <= 0;
            iid          <= 0;
            opcode       <= 0;
            psrc1_vld    <= 0;
            psrc1_value  <= 0;
            imm_vld      <= 0;
            imm          <= 0;
            ebreak_gpr10 <= ebreak_gpr10;
        end
    end

    assign exu_rtu_rob_cp0_complete = vld;
    assign exu_rtu_rob_cp0_iid      = iid;

endmodule
