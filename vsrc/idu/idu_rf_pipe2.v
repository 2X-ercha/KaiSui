module idu_rf_pipe2 (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_idu_rf_pipe2_vld,
    idu_idu_rf_pipe2_iid,
    idu_idu_rf_pipe2_opcode,
    idu_idu_rf_pipe2_funct7,
    idu_idu_rf_pipe2_funct3,
    idu_idu_rf_pipe2_pc,
    idu_idu_rf_pipe2_psrc1_vld,
    idu_idu_rf_pipe2_psrc1,
    idu_idu_rf_pipe2_psrc2_vld,
    idu_idu_rf_pipe2_psrc2,
    idu_idu_rf_pipe2_pdst_vld,
    idu_idu_rf_pipe2_pdst,
    idu_idu_rf_pipe2_imm_vld,
    idu_idu_rf_pipe2_imm,
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
    x_rf_pipe2_psrc1_value,
    x_rf_pipe2_psrc2_value,
    x_rf_preg_psrc1_vld,
    x_rf_preg_psrc1,
    x_rf_preg_psrc2_vld,
    x_rf_preg_psrc2,
    pipe2_vld,
    pipe2_iid,
    pipe2_opcode,
    pipe2_funct7,
    pipe2_funct3,
    pipe2_pc,
    pipe2_psrc1_vld,
    pipe2_psrc1_value,
    pipe2_psrc2_vld,
    pipe2_psrc2_value,
    pipe2_pdst_vld,
    pipe2_pdst,
    pipe2_imm_vld,
    pipe2_imm
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_idu_rf_pipe2_vld;
    input  [4 :0] idu_idu_rf_pipe2_iid;
    input  [6 :0] idu_idu_rf_pipe2_opcode;
    input  [6 :0] idu_idu_rf_pipe2_funct7;
    input  [2 :0] idu_idu_rf_pipe2_funct3;
    input  [63:0] idu_idu_rf_pipe2_pc;
    input         idu_idu_rf_pipe2_psrc1_vld;
    input  [5 :0] idu_idu_rf_pipe2_psrc1;
    input         idu_idu_rf_pipe2_psrc2_vld;
    input  [5 :0] idu_idu_rf_pipe2_psrc2;
    input         idu_idu_rf_pipe2_pdst_vld;
    input  [5 :0] idu_idu_rf_pipe2_pdst;
    input         idu_idu_rf_pipe2_imm_vld;
    input  [63:0] idu_idu_rf_pipe2_imm;
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
    input  [63:0] x_rf_pipe2_psrc1_value;
    input  [63:0] x_rf_pipe2_psrc2_value;
    output        x_rf_preg_psrc1_vld;
    output [5 :0] x_rf_preg_psrc1;
    output        x_rf_preg_psrc2_vld;
    output [5 :0] x_rf_preg_psrc2;
    output        pipe2_vld;
    output [4 :0] pipe2_iid;
    output [6 :0] pipe2_opcode;
    output [6 :0] pipe2_funct7;
    output [2 :0] pipe2_funct3;
    output [63:0] pipe2_pc;
    output        pipe2_psrc1_vld;
    output [63:0] pipe2_psrc1_value;
    output        pipe2_psrc2_vld;
    output [63:0] pipe2_psrc2_value;
    output        pipe2_pdst_vld;
    output [5 :0] pipe2_pdst;
    output        pipe2_imm_vld;
    output [63:0] pipe2_imm;

    // &Regs;
    reg        x_rf_preg_psrc1_vld;
    reg [5 :0] x_rf_preg_psrc1;
    reg        x_rf_preg_psrc2_vld;
    reg [5 :0] x_rf_preg_psrc2;
    reg        pipe2_vld;
    reg [4 :0] pipe2_iid;
    reg [6 :0] pipe2_opcode;
    reg [6 :0] pipe2_funct7;
    reg [2 :0] pipe2_funct3;
    reg [63:0] pipe2_pc;
    reg        pipe2_pdst_vld;
    reg [5 :0] pipe2_pdst;
    reg        pipe2_imm_vld;
    reg [63:0] pipe2_imm;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_idu_rf_pipe2_vld;
    wire [4 :0] idu_idu_rf_pipe2_iid;
    wire [6 :0] idu_idu_rf_pipe2_opcode;
    wire [6 :0] idu_idu_rf_pipe2_funct7;
    wire [2 :0] idu_idu_rf_pipe2_funct3;
    wire [63:0] idu_idu_rf_pipe2_pc;
    wire        idu_idu_rf_pipe2_psrc1_vld;
    wire [5 :0] idu_idu_rf_pipe2_psrc1;
    wire        idu_idu_rf_pipe2_psrc2_vld;
    wire [5 :0] idu_idu_rf_pipe2_psrc2;
    wire        idu_idu_rf_pipe2_pdst_vld;
    wire [5 :0] idu_idu_rf_pipe2_pdst;
    wire        idu_idu_rf_pipe2_imm_vld;
    wire [63:0] idu_idu_rf_pipe2_imm;
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
    wire [63:0] x_rf_pipe2_psrc1_value;
    wire [63:0] x_rf_pipe2_psrc2_value;
    wire        pipe2_psrc1_vld;
    wire [63:0] pipe2_psrc1_value;
    wire        pipe2_psrc2_vld;
    wire [63:0] pipe2_psrc2_value;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            pipe2_vld           <= 0;
            pipe2_iid           <= 0;
            pipe2_opcode        <= 0;
            pipe2_funct7        <= 0;
            pipe2_funct3        <= 0;
            pipe2_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe2_pdst_vld      <= 0;
            pipe2_pdst          <= 0;
            pipe2_imm_vld       <= 0;
            pipe2_imm           <= 0;
        end
        else if (rtu_global_flush) begin
            pipe2_vld           <= 0;
            pipe2_iid           <= 0;
            pipe2_opcode        <= 0;
            pipe2_funct7        <= 0;
            pipe2_funct3        <= 0;
            pipe2_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe2_pdst_vld      <= 0;
            pipe2_pdst          <= 0;
            pipe2_imm_vld       <= 0;
            pipe2_imm           <= 0;
        end
        else if (idu_idu_rf_pipe2_vld) begin
            pipe2_vld           <= 1;
            pipe2_iid           <= idu_idu_rf_pipe2_iid;
            pipe2_opcode        <= idu_idu_rf_pipe2_opcode;
            pipe2_funct7        <= idu_idu_rf_pipe2_funct7;
            pipe2_funct3        <= idu_idu_rf_pipe2_funct3;
            pipe2_pc            <= idu_idu_rf_pipe2_pc;
            x_rf_preg_psrc1_vld <= idu_idu_rf_pipe2_psrc1_vld;
            x_rf_preg_psrc1     <= idu_idu_rf_pipe2_psrc1;
            x_rf_preg_psrc2_vld <= idu_idu_rf_pipe2_psrc2_vld;
            x_rf_preg_psrc2     <= idu_idu_rf_pipe2_psrc2;
            pipe2_pdst_vld      <= idu_idu_rf_pipe2_pdst_vld;
            pipe2_pdst          <= idu_idu_rf_pipe2_pdst;
            pipe2_imm_vld       <= idu_idu_rf_pipe2_imm_vld;
            pipe2_imm           <= idu_idu_rf_pipe2_imm;
        end
        else begin
            pipe2_vld           <= 0;
            pipe2_iid           <= 0;
            pipe2_opcode        <= 0;
            pipe2_funct7        <= 0;
            pipe2_funct3        <= 0;
            pipe2_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe2_pdst_vld      <= 0;
            pipe2_pdst          <= 0;
            pipe2_imm_vld       <= 0;
            pipe2_imm           <= 0;
        end
    end

    assign pipe2_psrc1_vld = x_rf_preg_psrc1_vld;
    assign pipe2_psrc2_vld = x_rf_preg_psrc2_vld;

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

    assign pipe2_psrc1_value = (forward_psrc1_match & x_rf_preg_psrc1_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc1_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc1_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc1_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc1_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc1_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc1_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc1_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc1_match}}))
                                    : x_rf_pipe2_psrc1_value;
    assign pipe2_psrc2_value = (forward_psrc2_match & x_rf_preg_psrc2_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc2_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc2_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc2_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc2_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc2_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc2_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc2_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc2_match}}))
                                    : x_rf_pipe2_psrc2_value;

endmodule
