module ifu_if (
    clk,
    rst_clk,
    rtu_global_flush,
    y_stall_ctrl,
    idu_ifu_if_pc,
    inst_vld,
    inst_pc,
    inst
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_stall_ctrl;
    input  [63:0] idu_ifu_if_pc;

    output        inst_vld;
    output        inst_pc;
    output        inst;

    // &Regs;
    reg        inst_vld;
    reg [63:0] inst_pc;
    reg [31:0] inst;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_stall_ctrl;
    wire [63:0] idu_ifu_if_pc;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            inst_vld <= 0;
            inst_pc  <= 0;
            inst     <= 0;
        end
        else if (rtu_global_flush) begin
            inst_vld <= 0;
            inst_pc  <= 0;
            inst     <= 0;
        end
        else if (y_stall_ctrl) begin
            inst_vld <= inst_vld;
            inst_pc  <= inst_pc;
            inst     <= inst;
        end
        else begin
            inst_vld <= 1;
            inst_pc  <= idu_ifu_if_pc;
            inst     <= readword(idu_ifu_if_pc);
        end
    end

    `ifdef DEBUG_IFU_IF_PRINT
        always @(negedge clk)
        begin
            $display("IFU_IF : PC = %x, INST = %x", inst_pc, inst);
        end
    `endif

endmodule
