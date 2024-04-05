module exu_cdb(
    clk,
    rst_clk,
    rtu_global_flush,
    x_alu_vld,
    x_alu_preg,
    x_alu_result,
    x_mxu_vld,
    x_mxu_preg,
    x_mxu_result,
    x_div_vld,
    x_div_preg,
    x_div_result,
    x_lsu_vld,
    x_lsu_preg,
    x_lsu_result,
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
    exu_idu_rf_lsu_cdb_result
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         x_alu_vld;
    input  [5 :0] x_alu_preg;
    input  [63:0] x_alu_result;
    input         x_mxu_vld;
    input  [5 :0] x_mxu_preg;
    input  [63:0] x_mxu_result;
    input         x_div_vld;
    input  [5 :0] x_div_preg;
    input  [63:0] x_div_result;
    input         x_lsu_vld;
    input  [5 :0] x_lsu_preg;
    input  [63:0] x_lsu_result;
    output        exu_idu_rf_alu_cdb_vld;
    output [5 :0] exu_idu_rf_alu_cdb_preg;
    output [63:0] exu_idu_rf_alu_cdb_result;
    output        exu_idu_rf_mxu_cdb_vld;
    output [5 :0] exu_idu_rf_mxu_cdb_preg;
    output [63:0] exu_idu_rf_mxu_cdb_result;
    output        exu_idu_rf_div_cdb_vld;
    output [5 :0] exu_idu_rf_div_cdb_preg;
    output [63:0] exu_idu_rf_div_cdb_result;
    output        exu_idu_rf_lsu_cdb_vld;
    output [5 :0] exu_idu_rf_lsu_cdb_preg;
    output [63:0] exu_idu_rf_lsu_cdb_result;

    // &Regs;
    reg        exu_idu_rf_alu_cdb_vld;
    reg [5 :0] exu_idu_rf_alu_cdb_preg;
    reg [63:0] exu_idu_rf_alu_cdb_result;
    reg        exu_idu_rf_mxu_cdb_vld;
    reg [5 :0] exu_idu_rf_mxu_cdb_preg;
    reg [63:0] exu_idu_rf_mxu_cdb_result;
    reg        exu_idu_rf_div_cdb_vld;
    reg [5 :0] exu_idu_rf_div_cdb_preg;
    reg [63:0] exu_idu_rf_div_cdb_result;
    reg        exu_idu_rf_lsu_cdb_vld;
    reg [5 :0] exu_idu_rf_lsu_cdb_preg;
    reg [63:0] exu_idu_rf_lsu_cdb_result;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        x_alu_vld;
    wire [5 :0] x_alu_preg;
    wire [63:0] x_alu_result;
    wire        x_mxu_vld;
    wire [5 :0] x_mxu_preg;
    wire [63:0] x_mxu_result;
    wire        x_div_vld;
    wire [5 :0] x_div_preg;
    wire [63:0] x_div_result;
    wire        x_lsu_vld;
    wire [5 :0] x_lsu_preg;
    wire [63:0] x_lsu_result;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            exu_idu_rf_alu_cdb_vld    <= 0;
            exu_idu_rf_alu_cdb_preg   <= 0;
            exu_idu_rf_alu_cdb_result <= 0;
            exu_idu_rf_mxu_cdb_vld    <= 0;
            exu_idu_rf_mxu_cdb_preg   <= 0;
            exu_idu_rf_mxu_cdb_result <= 0;
            exu_idu_rf_div_cdb_vld    <= 0;
            exu_idu_rf_div_cdb_preg   <= 0;
            exu_idu_rf_div_cdb_result <= 0;
            exu_idu_rf_lsu_cdb_vld    <= 0;
            exu_idu_rf_lsu_cdb_preg   <= 0;
            exu_idu_rf_lsu_cdb_result <= 0;
        end
        else if (rtu_global_flush) begin
            exu_idu_rf_alu_cdb_vld    <= 0;
            exu_idu_rf_alu_cdb_preg   <= 0;
            exu_idu_rf_alu_cdb_result <= 0;
            exu_idu_rf_mxu_cdb_vld    <= 0;
            exu_idu_rf_mxu_cdb_preg   <= 0;
            exu_idu_rf_mxu_cdb_result <= 0;
            exu_idu_rf_div_cdb_vld    <= 0;
            exu_idu_rf_div_cdb_preg   <= 0;
            exu_idu_rf_div_cdb_result <= 0;
            exu_idu_rf_lsu_cdb_vld    <= 0;
            exu_idu_rf_lsu_cdb_preg   <= 0;
            exu_idu_rf_lsu_cdb_result <= 0;
        end
        else begin
            exu_idu_rf_alu_cdb_vld    <= x_alu_vld;
            exu_idu_rf_alu_cdb_preg   <= x_alu_preg;
            exu_idu_rf_alu_cdb_result <= x_alu_result;
            exu_idu_rf_mxu_cdb_vld    <= x_mxu_vld;
            exu_idu_rf_mxu_cdb_preg   <= x_mxu_preg;
            exu_idu_rf_mxu_cdb_result <= x_mxu_result;
            exu_idu_rf_div_cdb_vld    <= x_div_vld;
            exu_idu_rf_div_cdb_preg   <= x_div_preg;
            exu_idu_rf_div_cdb_result <= x_div_result;
            exu_idu_rf_lsu_cdb_vld    <= x_lsu_vld;
            exu_idu_rf_lsu_cdb_preg   <= x_lsu_preg;
            exu_idu_rf_lsu_cdb_result <= x_lsu_result;
        end
    end

endmodule
