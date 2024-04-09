module idu_rf_pipe4 (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_idu_rf_pipe4_vld,
    idu_idu_rf_pipe4_iid,
    idu_idu_rf_pipe4_opcode,
    idu_idu_rf_pipe4_psrc1_vld,
    idu_idu_rf_pipe4_psrc1,
    idu_idu_rf_pipe4_imm_vld,
    idu_idu_rf_pipe4_imm,
    exu_idu_rf_alu_ex_vld,
    exu_idu_rf_alu_ex_preg,
    exu_idu_rf_alu_ex_result,
    exu_idu_rf_mxu_ex_vld,
    exu_idu_rf_mxu_ex_preg,
    exu_idu_rf_mxu_ex_result,
    exu_idu_rf_div_ex_vld,
    exu_idu_rf_div_ex_preg,
    exu_idu_rf_div_ex_result,
    exu_idu_rf_lsu_ex_vld,
    exu_idu_rf_lsu_ex_preg,
    exu_idu_rf_lsu_ex_result,
    exu_idu_rf_alu_cdb_vld,
    exu_idu_rf_alu_cdb_preg,
    exu_idu_rf_alu_cdb_result,
    exu_idu_rf_mxu_cdb_vld,
    exu_idu_rf_mxu_cdb_preg,
    exu_idu_rf_mxu_cdb_result,
    exu_idu_rf_div_cdb_vld,
    exu_idu_rf_div_cdb_preg,
    exu_idu_rf_div_cdb_result,
    exu_idu_rf_lsu_cdb_vld,
    exu_idu_rf_lsu_cdb_preg,
    exu_idu_rf_lsu_cdb_result,
    x_rf_pipe4_psrc1_value,
    x_rf_preg_psrc1_vld,
    x_rf_preg_psrc1,
    pipe4_vld,
    pipe4_iid,
    pipe4_opcode,
    pipe4_psrc1_vld,
    pipe4_psrc1_value,
    pipe4_imm_vld,
    pipe4_imm
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_idu_rf_pipe4_vld;
    input  [4 :0] idu_idu_rf_pipe4_iid;
    input  [6 :0] idu_idu_rf_pipe4_opcode;
    input         idu_idu_rf_pipe4_psrc1_vld;
    input  [5 :0] idu_idu_rf_pipe4_psrc1;
    input         idu_idu_rf_pipe4_imm_vld;
    input  [63:0] idu_idu_rf_pipe4_imm;
    input         exu_idu_rf_alu_ex_vld;
    input  [5 :0] exu_idu_rf_alu_ex_preg;
    input  [63:0] exu_idu_rf_alu_ex_result;
    input         exu_idu_rf_mxu_ex_vld;
    input  [5 :0] exu_idu_rf_mxu_ex_preg;
    input  [63:0] exu_idu_rf_mxu_ex_result;
    input         exu_idu_rf_div_ex_vld;
    input  [5 :0] exu_idu_rf_div_ex_preg;
    input  [63:0] exu_idu_rf_div_ex_result;
    input         exu_idu_rf_lsu_ex_vld;
    input  [5 :0] exu_idu_rf_lsu_ex_preg;
    input  [63:0] exu_idu_rf_lsu_ex_result;
    input         exu_idu_rf_alu_cdb_vld;
    input  [5 :0] exu_idu_rf_alu_cdb_preg;
    input  [63:0] exu_idu_rf_alu_cdb_result;
    input         exu_idu_rf_mxu_cdb_vld;
    input  [5 :0] exu_idu_rf_mxu_cdb_preg;
    input  [63:0] exu_idu_rf_mxu_cdb_result;
    input         exu_idu_rf_div_cdb_vld;
    input  [5 :0] exu_idu_rf_div_cdb_preg;
    input  [63:0] exu_idu_rf_div_cdb_result;
    input         exu_idu_rf_lsu_cdb_vld;
    input  [5 :0] exu_idu_rf_lsu_cdb_preg;
    input  [63:0] exu_idu_rf_lsu_cdb_result;
    input  [63:0] x_rf_pipe4_psrc1_value;
    output        x_rf_preg_psrc1_vld;
    output [5 :0] x_rf_preg_psrc1;
    output        pipe4_vld;
    output [4 :0] pipe4_iid;
    output [6 :0] pipe4_opcode;
    output        pipe4_psrc1_vld;
    output [63:0] pipe4_psrc1_value;
    output        pipe4_imm_vld;
    output [63:0] pipe4_imm;

    // &Regs;
    reg        x_rf_preg_psrc1_vld;
    reg [5 :0] x_rf_preg_psrc1;
    reg        pipe4_vld;
    reg [4 :0] pipe4_iid;
    reg [6 :0] pipe4_opcode;
    reg        pipe4_imm_vld;
    reg [63:0] pipe4_imm;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_idu_rf_pipe4_vld;
    wire [4 :0] idu_idu_rf_pipe4_iid;
    wire [6 :0] idu_idu_rf_pipe4_opcode;
    wire        idu_idu_rf_pipe4_psrc1_vld;
    wire [5 :0] idu_idu_rf_pipe4_psrc1;
    wire        idu_idu_rf_pipe4_imm_vld;
    wire [63:0] idu_idu_rf_pipe4_imm;
    wire        exu_idu_rf_alu_ex_vld;
    wire [5 :0] exu_idu_rf_alu_ex_preg;
    wire [63:0] exu_idu_rf_alu_ex_result;
    wire        exu_idu_rf_alu_ex_psrc1_match;
    wire        exu_idu_rf_mxu_ex_vld;
    wire [5 :0] exu_idu_rf_mxu_ex_preg;
    wire [63:0] exu_idu_rf_mxu_ex_result;
    wire        exu_idu_rf_mxu_ex_psrc1_match;
    wire        exu_idu_rf_div_ex_vld;
    wire [5 :0] exu_idu_rf_div_ex_preg;
    wire [63:0] exu_idu_rf_div_ex_result;
    wire        exu_idu_rf_div_ex_psrc1_match;
    wire        exu_idu_rf_lsu_ex_vld;
    wire [5 :0] exu_idu_rf_lsu_ex_preg;
    wire [63:0] exu_idu_rf_lsu_ex_result;
    wire        exu_idu_rf_lsu_ex_psrc1_match;
    wire        exu_idu_rf_alu_cdb_vld;
    wire [5 :0] exu_idu_rf_alu_cdb_preg;
    wire [63:0] exu_idu_rf_alu_cdb_result;
    wire        exu_idu_rf_alu_cdb_psrc1_match;
    wire        exu_idu_rf_mxu_cdb_vld;
    wire [5 :0] exu_idu_rf_mxu_cdb_preg;
    wire [63:0] exu_idu_rf_mxu_cdb_result;
    wire        exu_idu_rf_mxu_cdb_psrc1_match;
    wire        exu_idu_rf_div_cdb_vld;
    wire [5 :0] exu_idu_rf_div_cdb_preg;
    wire [63:0] exu_idu_rf_div_cdb_result;
    wire        exu_idu_rf_div_cdb_psrc1_match;
    wire        exu_idu_rf_lsu_cdb_vld;
    wire [5 :0] exu_idu_rf_lsu_cdb_preg;
    wire [63:0] exu_idu_rf_lsu_cdb_result;
    wire        exu_idu_rf_lsu_cdb_psrc1_match;
    wire        forward_psrc1_match;
    wire        forward_psrc2_match;
    wire [63:0] x_rf_pipe4_psrc1_value;
    wire        pipe4_psrc1_vld;
    wire [63:0] pipe4_psrc1_value;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            pipe4_vld           <= 0;
            pipe4_iid           <= 0;
            pipe4_opcode        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            pipe4_imm_vld       <= 0;
            pipe4_imm           <= 0;
        end
        else if (rtu_global_flush) begin
            pipe4_vld           <= 0;
            pipe4_iid           <= 0;
            pipe4_opcode        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            pipe4_imm_vld       <= 0;
            pipe4_imm           <= 0;
        end
        else if (idu_idu_rf_pipe4_vld) begin
            pipe4_vld           <= 1;
            pipe4_iid           <= idu_idu_rf_pipe4_iid;
            pipe4_opcode        <= idu_idu_rf_pipe4_opcode;
            x_rf_preg_psrc1_vld <= idu_idu_rf_pipe4_psrc1_vld;
            x_rf_preg_psrc1     <= idu_idu_rf_pipe4_psrc1;
            pipe4_imm_vld       <= idu_idu_rf_pipe4_imm_vld;
            pipe4_imm           <= idu_idu_rf_pipe4_imm;
        end
        else begin
            pipe4_vld           <= 0;
            pipe4_iid           <= 0;
            pipe4_opcode        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            pipe4_imm_vld       <= 0;
            pipe4_imm           <= 0;
        end
    end

    assign pipe4_psrc1_vld = x_rf_preg_psrc1_vld;

    assign exu_idu_rf_alu_ex_psrc1_match = exu_idu_rf_alu_ex_vld & (exu_idu_rf_alu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_mxu_ex_psrc1_match = exu_idu_rf_mxu_ex_vld & (exu_idu_rf_mxu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_div_ex_psrc1_match = exu_idu_rf_div_ex_vld & (exu_idu_rf_div_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_lsu_ex_psrc1_match = exu_idu_rf_lsu_ex_vld & (exu_idu_rf_lsu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_alu_cdb_psrc1_match = exu_idu_rf_alu_cdb_vld & (exu_idu_rf_alu_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_mxu_cdb_psrc1_match = exu_idu_rf_mxu_cdb_vld & (exu_idu_rf_mxu_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_div_cdb_psrc1_match = exu_idu_rf_div_cdb_vld & (exu_idu_rf_div_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_lsu_cdb_psrc1_match = exu_idu_rf_lsu_cdb_vld & (exu_idu_rf_lsu_cdb_preg == x_rf_preg_psrc1);
    assign forward_psrc1_match = exu_idu_rf_alu_ex_psrc1_match
                               | exu_idu_rf_mxu_ex_psrc1_match
                               | exu_idu_rf_div_ex_psrc1_match
                               | exu_idu_rf_lsu_ex_psrc1_match
                               | exu_idu_rf_alu_cdb_psrc1_match
                               | exu_idu_rf_mxu_cdb_psrc1_match
                               | exu_idu_rf_div_cdb_psrc1_match
                               | exu_idu_rf_lsu_cdb_psrc1_match;

    assign pipe4_psrc1_value = (forward_psrc1_match & x_rf_preg_psrc1_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc1_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc1_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc1_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc1_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc1_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc1_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc1_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc1_match}}))
                                    : x_rf_pipe4_psrc1_value;

endmodule
