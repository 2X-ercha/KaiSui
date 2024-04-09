module exu_lsu (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_exu_lsu_vld,
    idu_exu_lsu_iid,
    idu_exu_lsu_opcode,
    idu_exu_lsu_funct7,
    idu_exu_lsu_funct3,
    idu_exu_lsu_pc,
    idu_exu_lsu_psrc1_vld,
    idu_exu_lsu_psrc1_value,
    idu_exu_lsu_psrc2_vld,
    idu_exu_lsu_psrc2_value,
    idu_exu_lsu_pdst_vld,
    idu_exu_lsu_pdst,
    idu_exu_lsu_imm_vld,
    idu_exu_lsu_imm,
    exu_rtu_rob_lsu_complete,
    exu_rtu_rob_lsu_iid,
    exu_idu_rf_lsu_wb_vld,
    exu_idu_rf_lsu_wb_preg,
    exu_idu_rf_lsu_wb_data
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_exu_lsu_vld;
    input  [4 :0] idu_exu_lsu_iid;
    input  [6 :0] idu_exu_lsu_opcode;
    input  [6 :0] idu_exu_lsu_funct7;
    input  [2 :0] idu_exu_lsu_funct3;
    input  [63:0] idu_exu_lsu_pc;
    input         idu_exu_lsu_psrc1_vld;
    input  [63:0] idu_exu_lsu_psrc1_value;
    input         idu_exu_lsu_psrc2_vld;
    input  [63:0] idu_exu_lsu_psrc2_value;
    input         idu_exu_lsu_pdst_vld;
    input  [5 :0] idu_exu_lsu_pdst;
    input         idu_exu_lsu_imm_vld;
    input  [63:0] idu_exu_lsu_imm;
    output        exu_rtu_rob_lsu_complete;
    output [4 :0] exu_rtu_rob_lsu_iid;
    output        exu_idu_rf_lsu_wb_vld;
    output [5 :0] exu_idu_rf_lsu_wb_preg;
    output [63:0] exu_idu_rf_lsu_wb_data;

    // &Regs;
    reg        vld;
    reg [4 :0] iid;
    reg [6 :0] opcode;
    reg [6 :0] funct7;
    reg [2 :0] funct3;
    reg [63:0] pc;
    reg        psrc1_vld;
    reg [63:0] psrc1_value;
    reg        psrc2_vld;
    reg [63:0] psrc2_value;
    reg        pdst_vld;
    reg [5 :0] pdst;
    reg        imm_vld;
    reg [63:0] imm;
    reg [63:0] mem_read;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_exu_lsu_vld;
    wire [4 :0] idu_exu_lsu_iid;
    wire [6 :0] idu_exu_lsu_opcode;
    wire [6 :0] idu_exu_lsu_funct7;
    wire [2 :0] idu_exu_lsu_funct3;
    wire [63:0] idu_exu_lsu_pc;
    wire        idu_exu_lsu_psrc1_vld;
    wire [63:0] idu_exu_lsu_psrc1_value;
    wire        idu_exu_lsu_psrc2_vld;
    wire [63:0] idu_exu_lsu_psrc2_value;
    wire        idu_exu_lsu_pdst_vld;
    wire [5 :0] idu_exu_lsu_pdst;
    wire        idu_exu_lsu_imm_vld;
    wire [63:0] idu_exu_lsu_imm;
    wire        exu_rtu_rob_lsu_complete;
    wire [4 :0] exu_rtu_rob_lsu_iid;
    wire        exu_idu_rf_lsu_wb_vld;
    wire [5 :0] exu_idu_rf_lsu_wb_preg;
    wire [63:0] exu_idu_rf_lsu_wb_data;
    wire        I_memload;
    wire        S_memstore;
    wire [63:0] addr;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            pc          <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (rtu_global_flush) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            pc          <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (idu_exu_lsu_vld) begin
            vld         <= 1;
            iid         <= idu_exu_lsu_iid;
            opcode      <= idu_exu_lsu_opcode;
            funct7      <= idu_exu_lsu_funct7;
            funct3      <= idu_exu_lsu_funct3;
            pc          <= idu_exu_lsu_pc;
            psrc1_vld   <= idu_exu_lsu_psrc1_vld;
            psrc1_value <= idu_exu_lsu_psrc1_value;
            psrc2_vld   <= idu_exu_lsu_psrc2_vld;
            psrc2_value <= idu_exu_lsu_psrc2_value;
            pdst_vld    <= idu_exu_lsu_pdst_vld;
            pdst        <= idu_exu_lsu_pdst;
            imm_vld     <= idu_exu_lsu_imm_vld;
            imm         <= idu_exu_lsu_imm;
        end
        else begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            pc          <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
    end

    assign I_memload  = (opcode == I_MEMLOAD);
    assign S_memstore = (opcode == S_MEMSTORE);

    assign addr = psrc1_value + imm;

    // 由于读写DPI-C的缘故，只能以不是很规范的方式写
    always @(negedge clk)
    begin
        if (I_memload) begin
            case (funct3[1:0])
                2'b00 : mem_read = {56'b0 , readbyte(addr)};
                2'b01 : mem_read = {48'b0 , readhalf(addr)};
                2'b10 : mem_read = {32'b0 , readword(addr)};
                2'b11 : mem_read = readdword(addr);
            endcase
        end
        else
            mem_read = 0;
    end

    always @(negedge clk)
    begin
        if (S_memstore) begin
            case (funct3[1:0])
                2'b00 : writebyte(addr, psrc2_value[7:0]);
                2'b01 : writehalf(addr, psrc2_value[15:0]);
                2'b10 : writeword(addr, psrc2_value[31:0]);
                2'b11 : writedword(addr, psrc2_value);
            endcase
        end
    end

    assign exu_rtu_rob_lsu_complete = vld;
    assign exu_rtu_rob_lsu_iid      = iid;
    assign exu_idu_rf_lsu_wb_vld    = I_memload;
    assign exu_idu_rf_lsu_wb_preg   = pdst;
    assign exu_idu_rf_lsu_wb_data   = (funct3[2]           ) ? mem_read                               & {64{I_memload}}:
                                      (funct3[1:0] == 2'b00) ? {{(56){mem_read[7]}}, mem_read[7:0]}   & {64{I_memload}}:
                                      (funct3[1:0] == 2'b01) ? {{(48){mem_read[15]}}, mem_read[15:0]} & {64{I_memload}}:
                                      (funct3[1:0] == 2'b10) ? {{(32){mem_read[31]}}, mem_read[31:0]} & {64{I_memload}}:
                                                               mem_read                               & {64{I_memload}};

    `ifdef DEBUG_EXU_LSU_PRINT
        always @(posedge clk)
        begin
            $display("EXU_LSU: load: %b, store: %b, addr = %x, mem_read = %x", I_memload, S_memstore, addr, exu_idu_rf_lsu_wb_data);
            $display("%x %x, %x, %x", idu_exu_lsu_pc, idu_exu_lsu_psrc1_value, idu_exu_lsu_psrc2_value, idu_exu_lsu_imm);
        end
    `endif

endmodule
