module idu_rf_pipe0 (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_idu_rf_pipe0_vld,
    idu_idu_rf_pipe0_iid,
    idu_idu_rf_pipe0_opcode,
    idu_idu_rf_pipe0_funct7,
    idu_idu_rf_pipe0_funct3,
    idu_idu_rf_pipe0_pc,
    idu_idu_rf_pipe0_psrc1_vld,
    idu_idu_rf_pipe0_psrc1,
    idu_idu_rf_pipe0_psrc2_vld,
    idu_idu_rf_pipe0_psrc2,
    idu_idu_rf_pipe0_pdst_vld,
    idu_idu_rf_pipe0_pdst,
    idu_idu_rf_pipe0_imm_vld,
    idu_idu_rf_pipe0_imm,
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
    x_rf_pipe0_psrc1_value,
    x_rf_pipe0_psrc2_value,
    x_rf_preg_psrc1_vld,
    x_rf_preg_psrc1,
    x_rf_preg_psrc2_vld,
    x_rf_preg_psrc2,
    pipe0_vld,
    pipe0_iid,
    pipe0_opcode,
    pipe0_funct7,
    pipe0_funct3,
    pipe0_pc,
    pipe0_psrc1_vld,
    pipe0_psrc1_value,
    pipe0_psrc2_vld,
    pipe0_psrc2_value,
    pipe0_pdst_vld,
    pipe0_pdst,
    pipe0_imm_vld,
    pipe0_imm,
    idu_idu_is_alu_rf_forward_vld,
    idu_idu_is_alu_rf_forward_preg
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_idu_rf_pipe0_vld;
    input  [3 :0] idu_idu_rf_pipe0_iid;
    input  [6 :0] idu_idu_rf_pipe0_opcode;
    input  [6 :0] idu_idu_rf_pipe0_funct7;
    input  [2 :0] idu_idu_rf_pipe0_funct3;
    input  [63:0] idu_idu_rf_pipe0_pc;
    input         idu_idu_rf_pipe0_psrc1_vld;
    input  [5 :0] idu_idu_rf_pipe0_psrc1;
    input         idu_idu_rf_pipe0_psrc2_vld;
    input  [5 :0] idu_idu_rf_pipe0_psrc2;
    input         idu_idu_rf_pipe0_pdst_vld;
    input  [5 :0] idu_idu_rf_pipe0_pdst;
    input         idu_idu_rf_pipe0_imm_vld;
    input  [63:0] idu_idu_rf_pipe0_imm;
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
    input  [63:0] x_rf_pipe0_psrc1_value;
    input  [63:0] x_rf_pipe0_psrc2_value;
    output        x_rf_preg_psrc1_vld;
    output [5 :0] x_rf_preg_psrc1;
    output        x_rf_preg_psrc2_vld;
    output [5 :0] x_rf_preg_psrc2;
    output        pipe0_vld;
    output [3 :0] pipe0_iid;
    output [6 :0] pipe0_opcode;
    output [6 :0] pipe0_funct7;
    output [2 :0] pipe0_funct3;
    output [63:0] pipe0_pc;
    output        pipe0_psrc1_vld;
    output [63:0] pipe0_psrc1_value;
    output        pipe0_psrc2_vld;
    output [63:0] pipe0_psrc2_value;
    output        pipe0_pdst_vld;
    output [5 :0] pipe0_pdst;
    output        pipe0_imm_vld;
    output [63:0] pipe0_imm;
    output        idu_idu_is_alu_rf_forward_vld;
    output [5 :0] idu_idu_is_alu_rf_forward_preg;

    // &Regs;
    reg        x_rf_preg_psrc1_vld;
    reg [5 :0] x_rf_preg_psrc1;
    reg        x_rf_preg_psrc2_vld;
    reg [5 :0] x_rf_preg_psrc2;
    reg        pipe0_vld;
    reg [3 :0] pipe0_iid;
    reg [6 :0] pipe0_opcode;
    reg [6 :0] pipe0_funct7;
    reg [2 :0] pipe0_funct3;
    reg [63:0] pipe0_pc;
    reg        pipe0_pdst_vld;
    reg [5 :0] pipe0_pdst;
    reg        pipe0_imm_vld;
    reg [63:0] pipe0_imm;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_idu_rf_pipe0_vld;
    wire [3 :0] idu_idu_rf_pipe0_iid;
    wire [6 :0] idu_idu_rf_pipe0_opcode;
    wire [6 :0] idu_idu_rf_pipe0_funct7;
    wire [2 :0] idu_idu_rf_pipe0_funct3;
    wire [63:0] idu_idu_rf_pipe0_pc;
    wire        idu_idu_rf_pipe0_psrc1_vld;
    wire [5 :0] idu_idu_rf_pipe0_psrc1;
    wire        idu_idu_rf_pipe0_psrc2_vld;
    wire [5 :0] idu_idu_rf_pipe0_psrc2;
    wire        idu_idu_rf_pipe0_pdst_vld;
    wire [5 :0] idu_idu_rf_pipe0_pdst;
    wire        idu_idu_rf_pipe0_imm_vld;
    wire [63:0] idu_idu_rf_pipe0_imm;
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
    wire [63:0] x_rf_pipe0_psrc1_value;
    wire [63:0] x_rf_pipe0_psrc2_value;
    wire        pipe0_psrc1_vld;
    wire [63:0] pipe0_psrc1_value;
    wire        pipe0_psrc2_vld;
    wire [63:0] pipe0_psrc2_value;
    wire        idu_idu_is_alu_rf_forward_vld;
    wire [5 :0] idu_idu_is_alu_rf_forward_preg;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            pipe0_vld           <= 0;
            pipe0_iid           <= 0;
            pipe0_opcode        <= 0;
            pipe0_funct7        <= 0;
            pipe0_funct3        <= 0;
            pipe0_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe0_pdst_vld      <= 0;
            pipe0_pdst          <= 0;
            pipe0_imm_vld       <= 0;
            pipe0_imm           <= 0;
        end
        else if (rtu_global_flush) begin
            pipe0_vld           <= 0;
            pipe0_iid           <= 0;
            pipe0_opcode        <= 0;
            pipe0_funct7        <= 0;
            pipe0_funct3        <= 0;
            pipe0_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe0_pdst_vld      <= 0;
            pipe0_pdst          <= 0;
            pipe0_imm_vld       <= 0;
            pipe0_imm           <= 0;
        end
        else if (idu_idu_rf_pipe0_vld) begin
            pipe0_vld           <= 1;
            pipe0_iid           <= idu_idu_rf_pipe0_iid;
            pipe0_opcode        <= idu_idu_rf_pipe0_opcode;
            pipe0_funct7        <= idu_idu_rf_pipe0_funct7;
            pipe0_funct3        <= idu_idu_rf_pipe0_funct3;
            pipe0_pc            <= idu_idu_rf_pipe0_pc;
            x_rf_preg_psrc1_vld <= idu_idu_rf_pipe0_psrc1_vld;
            x_rf_preg_psrc1     <= idu_idu_rf_pipe0_psrc1;
            x_rf_preg_psrc2_vld <= idu_idu_rf_pipe0_psrc2_vld;
            x_rf_preg_psrc2     <= idu_idu_rf_pipe0_psrc2;
            pipe0_pdst_vld      <= idu_idu_rf_pipe0_pdst_vld;
            pipe0_pdst          <= idu_idu_rf_pipe0_pdst;
            pipe0_imm_vld       <= idu_idu_rf_pipe0_imm_vld;
            pipe0_imm           <= idu_idu_rf_pipe0_imm;
        end
        else begin
            pipe0_vld           <= 0;
            pipe0_iid           <= 0;
            pipe0_opcode        <= 0;
            pipe0_funct7        <= 0;
            pipe0_funct3        <= 0;
            pipe0_pc            <= 0;
            x_rf_preg_psrc1_vld <= 0;
            x_rf_preg_psrc1     <= 0;
            x_rf_preg_psrc2_vld <= 0;
            x_rf_preg_psrc2     <= 0;
            pipe0_pdst_vld      <= 0;
            pipe0_pdst          <= 0;
            pipe0_imm_vld       <= 0;
            pipe0_imm           <= 0;
        end
    end

    assign pipe0_psrc1_vld = x_rf_preg_psrc1_vld;
    assign pipe0_psrc2_vld = x_rf_preg_psrc2_vld;

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

    assign pipe0_psrc1_value = (forward_psrc1_match & x_rf_preg_psrc1_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc1_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc1_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc1_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc1_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc1_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc1_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc1_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc1_match}}))
                                    : x_rf_pipe0_psrc1_value;
    assign pipe0_psrc2_value = (forward_psrc2_match & x_rf_preg_psrc2_vld) ? (
                                      (exu_idu_rf_alu_ex_result & {64{exu_idu_rf_alu_ex_psrc2_match}})
                                    | (exu_idu_rf_mxu_ex_result & {64{exu_idu_rf_mxu_ex_psrc2_match}})
                                    | (exu_idu_rf_div_ex_result & {64{exu_idu_rf_div_ex_psrc2_match}})
                                    | (exu_idu_rf_lsu_ex_result & {64{exu_idu_rf_lsu_ex_psrc2_match}})
                                    | (exu_idu_rf_alu_cdb_result & {64{exu_idu_rf_alu_cdb_psrc2_match}})
                                    | (exu_idu_rf_mxu_cdb_result & {64{exu_idu_rf_mxu_cdb_psrc2_match}})
                                    | (exu_idu_rf_div_cdb_result & {64{exu_idu_rf_div_cdb_psrc2_match}})
                                    | (exu_idu_rf_lsu_cdb_result & {64{exu_idu_rf_lsu_cdb_psrc2_match}}))
                                    : x_rf_pipe0_psrc2_value;

    assign idu_idu_is_alu_rf_forward_vld  = pipe0_pdst_vld;
    assign idu_idu_is_alu_rf_forward_preg = pipe0_pdst;

endmodule
