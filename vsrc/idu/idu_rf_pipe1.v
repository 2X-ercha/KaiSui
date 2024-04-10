module idu_rf_pipe1 (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_idu_rf_pipe1_vld,
    idu_idu_rf_pipe1_iid,
    idu_idu_rf_pipe1_opcode,
    idu_idu_rf_pipe1_funct7,
    idu_idu_rf_pipe1_funct3,
    idu_idu_rf_pipe1_psrc1_vld,
    idu_idu_rf_pipe1_psrc1,
    idu_idu_rf_pipe1_psrc2_vld,
    idu_idu_rf_pipe1_psrc2,
    idu_idu_rf_pipe1_pdst_vld,
    idu_idu_rf_pipe1_pdst,
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
    x_rf_pipe1_psrc1_value,
    x_rf_pipe1_psrc2_value,
    x_rf_preg_psrc1_vld,
    x_rf_preg_psrc1,
    x_rf_preg_psrc2_vld,
    x_rf_preg_psrc2,
    pipe1_vld,
    pipe1_iid,
    pipe1_opcode,
    pipe1_funct7,
    pipe1_funct3,
    pipe1_psrc1_vld,
    pipe1_psrc1_value,
    pipe1_psrc2_vld,
    pipe1_psrc2_value,
    pipe1_pdst_vld,
    pipe1_pdst
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_idu_rf_pipe1_vld;
    input  [4 :0] idu_idu_rf_pipe1_iid;
    input  [6 :0] idu_idu_rf_pipe1_opcode;
    input  [6 :0] idu_idu_rf_pipe1_funct7;
    input  [2 :0] idu_idu_rf_pipe1_funct3;
    input         idu_idu_rf_pipe1_psrc1_vld;
    input  [5 :0] idu_idu_rf_pipe1_psrc1;
    input         idu_idu_rf_pipe1_psrc2_vld;
    input  [5 :0] idu_idu_rf_pipe1_psrc2;
    input         idu_idu_rf_pipe1_pdst_vld;
    input  [5 :0] idu_idu_rf_pipe1_pdst;
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
    input  [63:0] x_rf_pipe1_psrc1_value;
    input  [63:0] x_rf_pipe1_psrc2_value;
    output        x_rf_preg_psrc1_vld;
    output [5 :0] x_rf_preg_psrc1;
    output        x_rf_preg_psrc2_vld;
    output [5 :0] x_rf_preg_psrc2;
    output        pipe1_vld;
    output [4 :0] pipe1_iid;
    output [6 :0] pipe1_opcode;
    output [6 :0] pipe1_funct7;
    output [2 :0] pipe1_funct3;
    output        pipe1_psrc1_vld;
    output [63:0] pipe1_psrc1_value;
    output        pipe1_psrc2_vld;
    output [63:0] pipe1_psrc2_value;
    output        pipe1_pdst_vld;
    output [5 :0] pipe1_pdst;

    // &Regs;
    reg        x_rf_preg_psrc1_vld;
    reg [5 :0] x_rf_preg_psrc1;
    reg        x_rf_preg_psrc2_vld;
    reg [5 :0] x_rf_preg_psrc2;
    reg        pipe1_vld;
    reg [4 :0] pipe1_iid;
    reg [6 :0] pipe1_opcode;
    reg [6 :0] pipe1_funct7;
    reg [2 :0] pipe1_funct3;
    reg        pipe1_pdst_vld;
    reg [5 :0] pipe1_pdst;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_idu_rf_pipe1_vld;
    wire [4 :0] idu_idu_rf_pipe1_iid;
    wire [6 :0] idu_idu_rf_pipe1_opcode;
    wire [6 :0] idu_idu_rf_pipe1_funct7;
    wire [2 :0] idu_idu_rf_pipe1_funct3;
    wire        idu_idu_rf_pipe1_psrc1_vld;
    wire [5 :0] idu_idu_rf_pipe1_psrc1;
    wire        idu_idu_rf_pipe1_psrc2_vld;
    wire [5 :0] idu_idu_rf_pipe1_psrc2;
    wire        idu_idu_rf_pipe1_pdst_vld;
    wire [5 :0] idu_idu_rf_pipe1_pdst;
    wire        exu_idu_rf_alu_ex_vld;
    wire [5 :0] exu_idu_rf_alu_ex_preg;
    wire [63:0] exu_idu_rf_alu_ex_result;
    wire        exu_idu_rf_alu_ex_psrc1_match;
    wire        exu_idu_rf_alu_ex_psrc2_match;
    wire        exu_idu_rf_mxu_ex_vld;
    wire [5 :0] exu_idu_rf_mxu_ex_preg;
    wire [63:0] exu_idu_rf_mxu_ex_result;
    wire        exu_idu_rf_mxu_ex_psrc1_match;
    wire        exu_idu_rf_mxu_ex_psrc2_match;
    wire        exu_idu_rf_div_ex_vld;
    wire [5 :0] exu_idu_rf_div_ex_preg;
    wire [63:0] exu_idu_rf_div_ex_result;
    wire        exu_idu_rf_div_ex_psrc1_match;
    wire        exu_idu_rf_div_ex_psrc2_match;
    wire        exu_idu_rf_lsu_ex_vld;
    wire [5 :0] exu_idu_rf_lsu_ex_preg;
    wire [63:0] exu_idu_rf_lsu_ex_result;
    wire        exu_idu_rf_lsu_ex_psrc1_match;
    wire        exu_idu_rf_lsu_ex_psrc2_match;
    wire        exu_idu_rf_alu_cdb_vld;
    wire [5 :0] exu_idu_rf_alu_cdb_preg;
    wire [63:0] exu_idu_rf_alu_cdb_result;
    wire        exu_idu_rf_alu_cdb_psrc1_match;
    wire        exu_idu_rf_alu_cdb_psrc2_match;
    wire        exu_idu_rf_mxu_cdb_vld;
    wire [5 :0] exu_idu_rf_mxu_cdb_preg;
    wire [63:0] exu_idu_rf_mxu_cdb_result;
    wire        exu_idu_rf_mxu_cdb_psrc1_match;
    wire        exu_idu_rf_mxu_cdb_psrc2_match;
    wire        exu_idu_rf_div_cdb_vld;
    wire [5 :0] exu_idu_rf_div_cdb_preg;
    wire [63:0] exu_idu_rf_div_cdb_result;
    wire        exu_idu_rf_div_cdb_psrc1_match;
    wire        exu_idu_rf_div_cdb_psrc2_match;
    wire        exu_idu_rf_lsu_cdb_vld;
    wire [5 :0] exu_idu_rf_lsu_cdb_preg;
    wire [63:0] exu_idu_rf_lsu_cdb_result;
    wire        exu_idu_rf_lsu_cdb_psrc1_match;
    wire        exu_idu_rf_lsu_cdb_psrc2_match;
    wire        forward_psrc1_match;
    wire        forward_psrc2_match;
    wire [63:0] x_rf_pipe1_psrc1_value;
    wire [63:0] x_rf_pipe1_psrc2_value;
    wire        pipe1_psrc1_vld;
    wire [63:0] pipe1_psrc1_value;
    wire        pipe1_psrc2_vld;
    wire [63:0] pipe1_psrc2_value;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            pipe1_vld           <= 0;
            pipe1_iid           <= 0;
            pipe1_opcode        <= 0;
            pipe1_funct7        <= 0;
            pipe1_funct3        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe1_pdst_vld      <= 0;
            pipe1_pdst          <= 0;
        end
        else if (rtu_global_flush) begin
            pipe1_vld           <= 0;
            pipe1_iid           <= 0;
            pipe1_opcode        <= 0;
            pipe1_funct7        <= 0;
            pipe1_funct3        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe1_pdst_vld      <= 0;
            pipe1_pdst          <= 0;
        end
        else if (idu_idu_rf_pipe1_vld) begin
            pipe1_vld           <= 1;
            pipe1_iid           <= idu_idu_rf_pipe1_iid;
            pipe1_opcode        <= idu_idu_rf_pipe1_opcode;
            pipe1_funct7        <= idu_idu_rf_pipe1_funct7;
            pipe1_funct3        <= idu_idu_rf_pipe1_funct3;
            x_rf_preg_psrc1_vld <= idu_idu_rf_pipe1_psrc1_vld;
            x_rf_preg_psrc1     <= idu_idu_rf_pipe1_psrc1;
            x_rf_preg_psrc2_vld <= idu_idu_rf_pipe1_psrc2_vld;
            x_rf_preg_psrc2     <= idu_idu_rf_pipe1_psrc2;
            pipe1_pdst_vld      <= idu_idu_rf_pipe1_pdst_vld;
            pipe1_pdst          <= idu_idu_rf_pipe1_pdst;
        end
        else begin
            pipe1_vld           <= 0;
            pipe1_iid           <= 0;
            pipe1_opcode        <= 0;
            pipe1_funct7        <= 0;
            pipe1_funct3        <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe1_pdst_vld      <= 0;
            pipe1_pdst          <= 0;
        end
    end

    assign pipe1_psrc1_vld = x_rf_preg_psrc1_vld;
    assign pipe1_psrc2_vld = x_rf_preg_psrc2_vld;

    assign exu_idu_rf_alu_ex_psrc1_match = exu_idu_rf_alu_ex_vld & (exu_idu_rf_alu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_alu_ex_psrc2_match = exu_idu_rf_alu_ex_vld & (exu_idu_rf_alu_ex_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_mxu_ex_psrc1_match = exu_idu_rf_mxu_ex_vld & (exu_idu_rf_mxu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_mxu_ex_psrc2_match = exu_idu_rf_mxu_ex_vld & (exu_idu_rf_mxu_ex_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_div_ex_psrc1_match = exu_idu_rf_div_ex_vld & (exu_idu_rf_div_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_div_ex_psrc2_match = exu_idu_rf_div_ex_vld & (exu_idu_rf_div_ex_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_lsu_ex_psrc1_match = exu_idu_rf_lsu_ex_vld & (exu_idu_rf_lsu_ex_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_lsu_ex_psrc2_match = exu_idu_rf_lsu_ex_vld & (exu_idu_rf_lsu_ex_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_alu_cdb_psrc1_match = exu_idu_rf_alu_cdb_vld & (exu_idu_rf_alu_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_alu_cdb_psrc2_match = exu_idu_rf_alu_cdb_vld & (exu_idu_rf_alu_cdb_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_mxu_cdb_psrc1_match = exu_idu_rf_mxu_cdb_vld & (exu_idu_rf_mxu_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_mxu_cdb_psrc2_match = exu_idu_rf_mxu_cdb_vld & (exu_idu_rf_mxu_cdb_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_div_cdb_psrc1_match = exu_idu_rf_div_cdb_vld & (exu_idu_rf_div_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_div_cdb_psrc2_match = exu_idu_rf_div_cdb_vld & (exu_idu_rf_div_cdb_preg == x_rf_preg_psrc2);
    assign exu_idu_rf_lsu_cdb_psrc1_match = exu_idu_rf_lsu_cdb_vld & (exu_idu_rf_lsu_cdb_preg == x_rf_preg_psrc1);
    assign exu_idu_rf_lsu_cdb_psrc2_match = exu_idu_rf_lsu_cdb_vld & (exu_idu_rf_lsu_cdb_preg == x_rf_preg_psrc2);
    assign forward_psrc1_match = exu_idu_rf_alu_ex_psrc1_match
                               | exu_idu_rf_mxu_ex_psrc1_match
                               | exu_idu_rf_div_ex_psrc1_match
                               | exu_idu_rf_lsu_ex_psrc1_match
                               | exu_idu_rf_alu_cdb_psrc1_match
                               | exu_idu_rf_mxu_cdb_psrc1_match
                               | exu_idu_rf_div_cdb_psrc1_match
                               | exu_idu_rf_lsu_cdb_psrc1_match;
    assign forward_psrc2_match = exu_idu_rf_alu_ex_psrc2_match
                               | exu_idu_rf_mxu_ex_psrc2_match
                               | exu_idu_rf_div_ex_psrc2_match
                               | exu_idu_rf_lsu_ex_psrc2_match
                               | exu_idu_rf_alu_cdb_psrc2_match
                               | exu_idu_rf_mxu_cdb_psrc2_match
                               | exu_idu_rf_div_cdb_psrc2_match
                               | exu_idu_rf_lsu_cdb_psrc2_match;

    assign pipe1_psrc1_value = (forward_psrc1_match & x_rf_preg_psrc1_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc1_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc1_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc1_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc1_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc1_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc1_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc1_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc1_match}}))
                                    : x_rf_pipe1_psrc1_value;
    assign pipe1_psrc2_value = (forward_psrc2_match & x_rf_preg_psrc2_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc2_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc2_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc2_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc2_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc2_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc2_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc2_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc2_match}}))
                                    : x_rf_pipe1_psrc2_value;

endmodule
