module idu_rf_preg (
    clk,
    rst_clk,
    write_en,
    write_data,
    data,
    wb_vld
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         write_en;
    input  [63:0] write_data;
    output [63:0] data;
    output        wb_vld;

    // &Regs;
    reg [63:0] data;
    reg        wb_vld;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        write_en;
    wire [63:0] write_data;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            data   <= 0;
            wb_vld <= 0;
        end
        else if (write_en) begin
            data   <= write_data;
            wb_vld <= 1;
        end
        else begin
            data   <= data;
            wb_vld <= 0;
        end
    end

endmodule