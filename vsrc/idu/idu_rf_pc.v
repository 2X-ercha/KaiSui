module idu_rf_pc (
    clk,
    rst_clk,
    y_stall_ctrl,
    rob_idu_rf_pcjump_vld,
    exu_idu_rf_bju_pcjump_vld,
    exu_idu_rf_bju_pcjump_addr,
    pc
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         y_stall_ctrl;
    input         rob_idu_rf_pcjump_vld;
    input         exu_idu_rf_bju_pcjump_vld;
    input  [63:0] exu_idu_rf_bju_pcjump_addr;

    output [63:0] pc;

    // &Regs;
    reg [63:0] pc;
    reg [63:0] bju_rs; // Branch Jump inst Rstention Station（分支跳转指令保留站）
    reg        bju_rs_mask;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        y_stall_ctrl;
    wire        rob_idu_rf_pcjump_vld;
    wire        exu_idu_rf_bju_pcjump_vld;
    wire [63:0] exu_idu_rf_bju_pcjump_addr;

    // pc
    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            pc <= PC_RESET;
        else if (rob_idu_rf_pcjump_vld)
            pc <= bju_rs;
        else if (y_stall_ctrl)
            pc <= pc;
        else
            pc <= pc + 4;
    end

    // bju_rs
    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            bju_rs      <= PC_RESET;
            bju_rs_mask <= 0;
        end
        else if (rob_idu_rf_pcjump_vld) begin
            bju_rs      <= 0;
            bju_rs_mask <= 0;
        end
        else if (exu_idu_rf_bju_pcjump_vld) begin
            bju_rs      <= (bju_rs_mask) ? bju_rs : exu_idu_rf_bju_pcjump_addr;
            bju_rs_mask <= 1;
        end
        else begin
            bju_rs      <= bju_rs;
            bju_rs_mask <= bju_rs_mask;
        end
    end

endmodule
