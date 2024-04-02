module idu_ir_rt_entry(
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_ir_stall_ctrl,
    recover_preg,
    reset_mapped_preg,
    map_update_vld,
    update_preg,
    pipe0_alu_wb_vld,
    pipe0_alu_wb_preg,
    pipe1_mxu_wb_vld,
    pipe1_mxu_wb_preg,
    pipe2_bju_wb_vld,
    pipe2_bju_wb_preg,
    pipe3_lsu_wb_vld,
    pipe3_lsu_wb_preg,
    preg,
    ready
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_ir_stall_ctrl;
    input  [5 :0] recover_preg;
    input  [5 :0] reset_mapped_preg;
    input         map_update_vld;
    input  [5 :0] update_preg;
    input         pipe0_alu_wb_vld;
    input  [5 :0] pipe0_alu_wb_preg;
    input         pipe1_mxu_wb_vld;
    input  [5 :0] pipe1_mxu_wb_preg;
    input         pipe2_bju_wb_vld;
    input  [5 :0] pipe2_bju_wb_preg;
    input         pipe3_lsu_wb_vld;
    input  [5 :0] pipe3_lsu_wb_preg;
    output [5 :0] preg;
    output        ready;

    // &Regs;
    reg [5 :0] preg;
    reg        ready;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_ir_stall_ctrl;
    wire [5 :0] recover_preg;
    wire [5 :0] reset_mapped_preg;
    wire        map_update_vld;
    wire [5 :0] update_preg;
    wire        pipe0_alu_wb_vld;
    wire [5 :0] pipe0_alu_wb_preg;
    wire        pipe1_mxu_wb_vld;
    wire [5 :0] pipe1_mxu_wb_preg;
    wire        pipe2_bju_wb_vld;
    wire [5 :0] pipe2_bju_wb_preg;
    wire        pipe3_lsu_wb_vld;
    wire [5 :0] pipe3_lsu_wb_preg;
    wire        alu_ready_match;
    wire        mxu_ready_match;
    wire        bju_ready_match;
    wire        lsu_ready_match;
    wire        ready_vld;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            preg <= reset_mapped_preg;
        else if (rtu_global_flush)
            preg <= recover_preg;
        else if (y_idu_ir_stall_ctrl)
            preg <= preg;
        else if (map_update_vld)
            preg <= update_preg;
        else
            preg <= preg;
    end

    assign alu_ready_match = (pipe0_alu_wb_preg == preg);
    assign mxu_ready_match = (pipe1_mxu_wb_preg == preg);
    assign bju_ready_match = (pipe2_bju_wb_preg == preg);
    assign lsu_ready_match = (pipe3_lsu_wb_preg == preg);
    assign ready_vld       = (alu_ready_match & pipe0_alu_wb_vld)
                           | (mxu_ready_match & pipe1_mxu_wb_vld)
                           | (bju_ready_match & pipe2_bju_wb_vld)
                           | (lsu_ready_match & pipe3_lsu_wb_vld);

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            ready <= 1;
        else if (rtu_global_flush)
            ready <= 1;
        else if (y_idu_ir_stall_ctrl)
            ready <= ready;
        else if (map_update_vld)
            ready <= 0;
        else if (ready_vld)
            ready <= 1;
        else
            ready <= ready;
    end

endmodule
