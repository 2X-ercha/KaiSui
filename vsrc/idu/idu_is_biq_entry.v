module idu_is_biq_entry (
    clk,
    rst_clk,
    rtu_global_flush,
    create_vld,
    create_iid,
    create_opcode,
    create_funct7,
    create_funct3,
    create_pc,
    create_psrc1_vld,
    create_psrc1_ready,
    create_psrc1,
    create_psrc2_vld,
    create_psrc2_ready,
    create_psrc2,
    create_pdst_vld,
    create_pdst,
    create_imm_vld,
    create_imm,
    issue_vld,
    idu_idu_is_alu_is_forward_vld,
    idu_idu_is_alu_is_forward_preg,
    idu_idu_is_alu_rf_forward_vld,
    idu_idu_is_alu_rf_forward_preg,
    exu_idu_is_alu_result_vld,
    exu_idu_is_alu_result_preg,
    exu_idu_is_mul1_forward_vld,
    exu_idu_is_mul1_forward_preg,
    exu_idu_is_mul2_forward_vld,
    exu_idu_is_mul2_forward_preg,
    exu_idu_is_mul3_result_vld,
    exu_idu_is_mul3_result_preg,
    exu_idu_is_div1_forward_vld,
    exu_idu_is_div1_forward_preg,
    exu_idu_is_div2_forward_vld,
    exu_idu_is_div2_forward_preg,
    exu_idu_is_div3_result_vld,
    exu_idu_is_div3_result_preg,
    exu_idu_is_lsu_result_vld,
    exu_idu_is_lsu_result_preg,
    vld,
    iid,
    opcode,
    funct7,
    funct3,
    pc,
    psrc1_vld,
    psrc1,
    psrc2_vld,
    psrc2,
    pdst_vld,
    pdst,
    imm_vld,
    imm,
    ready
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         create_vld;
    input  [3 :0] create_iid;
    input  [6 :0] create_opcode;
    input  [6 :0] create_funct7;
    input  [2 :0] create_funct3;
    input  [63:0] create_pc;
    input         create_psrc1_vld;
    input         create_psrc1_ready;
    input  [5 :0] create_psrc1;
    input         create_psrc2_vld;
    input         create_psrc2_ready;
    input  [5 :0] create_psrc2;
    input         create_pdst_vld;
    input  [5 :0] create_pdst;
    input         create_imm_vld;
    input  [63:0] create_imm;
    input         issue_vld;
    input         idu_idu_is_alu_is_forward_vld;
    input  [5 :0] idu_idu_is_alu_is_forward_preg;
    input         idu_idu_is_alu_rf_forward_vld;
    input  [5 :0] idu_idu_is_alu_rf_forward_preg;
    input         exu_idu_is_alu_result_vld;
    input  [5 :0] exu_idu_is_alu_result_preg;
    input         exu_idu_is_mul1_forward_vld;
    input  [5 :0] exu_idu_is_mul1_forward_preg;
    input         exu_idu_is_mul2_forward_vld;
    input  [5 :0] exu_idu_is_mul2_forward_preg;
    input         exu_idu_is_mul3_result_vld;
    input  [5 :0] exu_idu_is_mul3_result_preg;
    input         exu_idu_is_div1_forward_vld;
    input  [5 :0] exu_idu_is_div1_forward_preg;
    input         exu_idu_is_div2_forward_vld;
    input  [5 :0] exu_idu_is_div2_forward_preg;
    input         exu_idu_is_div3_result_vld;
    input  [5 :0] exu_idu_is_div3_result_preg;
    input         exu_idu_is_lsu_result_vld;
    input  [5 :0] exu_idu_is_lsu_result_preg;
    output        vld;
    output [3 :0] iid;
    output [6 :0] opcode;
    output [6 :0] funct7;
    output [2 :0] funct3;
    output [63:0] pc;
    output        psrc1_vld;
    output [5 :0] psrc1;
    output        psrc2_vld;
    output [5 :0] psrc2;
    output        pdst_vld;
    output [5 :0] pdst;
    output        imm_vld;
    output [63:0] imm;
    output        ready;

    // &Regs;
    reg        vld;
    reg [3 :0] iid;
    reg [6 :0] opcode;
    reg [6 :0] funct7;
    reg [2 :0] funct3;
    reg [63:0] pc;
    reg        psrc1_vld;
    reg        psrc1_ready;
    reg [5 :0] psrc1;
    reg        psrc2_vld;
    reg        psrc2_ready;
    reg [5 :0] psrc2;
    reg        pdst_vld;
    reg [5 :0] pdst;
    reg        imm_vld;
    reg [63:0] imm;

    // Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        create_vld;
    wire [3 :0] create_iid;
    wire [6 :0] create_opcode;
    wire [6 :0] create_funct7;
    wire [2 :0] create_funct3;
    wire [63:0] create_pc;
    wire        create_psrc1_vld;
    wire        create_psrc1_ready;
    wire [5 :0] create_psrc1;
    wire        create_psrc2_vld;
    wire        create_psrc2_ready;
    wire [5 :0] create_psrc2;
    wire        create_pdst_vld;
    wire [5 :0] create_pdst;
    wire        create_imm_vld;
    wire [63:0] create_imm;
    wire        issue_vld;
    wire        idu_idu_is_alu_is_forward_vld;
    wire [5 :0] idu_idu_is_alu_is_forward_preg;
    wire        idu_idu_is_alu_rf_forward_vld;
    wire [5 :0] idu_idu_is_alu_rf_forward_preg;
    wire        exu_idu_is_alu_result_vld;
    wire [5 :0] exu_idu_is_alu_result_preg;
    wire        exu_idu_is_mul1_forward_vld;
    wire [5 :0] exu_idu_is_mul1_forward_preg;
    wire        exu_idu_is_mul2_forward_vld;
    wire [5 :0] exu_idu_is_mul2_forward_preg;
    wire        exu_idu_is_mul3_result_vld;
    wire [5 :0] exu_idu_is_mul3_result_preg;
    wire        exu_idu_is_div1_forward_vld;
    wire [5 :0] exu_idu_is_div1_forward_preg;
    wire        exu_idu_is_div2_forward_vld;
    wire [5 :0] exu_idu_is_div2_forward_preg;
    wire        exu_idu_is_div3_result_vld;
    wire [5 :0] exu_idu_is_div3_result_preg;
    wire        exu_idu_is_lsu_result_vld;
    wire [5 :0] exu_idu_is_lsu_result_preg;
    wire        ready;

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
            psrc1_ready <= 0;
            psrc1       <= 0;
            psrc2_vld   <= 0;
            psrc2_ready <= 0;
            psrc2       <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (rtu_global_flush || issue_vld) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            pc          <= 0;
            psrc1_vld   <= 0;
            psrc1_ready <= 0;
            psrc1       <= 0;
            psrc2_vld   <= 0;
            psrc2_ready <= 0;
            psrc2       <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
            imm_vld     <= 0;
            imm         <= 0;
        end
        else if (create_vld) begin
            vld         <= 1;
            iid         <= create_iid;
            opcode      <= create_opcode;
            funct7      <= create_funct7;
            funct3      <= create_funct3;
            pc          <= create_pc;
            psrc1_vld   <= create_psrc1_vld;
            psrc1_ready <= create_psrc1_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == create_psrc1))
                                              | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == create_psrc1))
                                              | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == create_psrc1))
                                              | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == create_psrc1))
                                              | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == create_psrc1))
                                              | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == create_psrc1))
                                              | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == create_psrc1))
                                              | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == create_psrc1))
                                              | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == create_psrc1))
                                              | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == create_psrc1));
            psrc1       <= create_psrc1;
            psrc2_vld   <= create_psrc2_vld;
            psrc2_ready <= create_psrc2_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == create_psrc2))
                                              | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == create_psrc2))
                                              | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == create_psrc2))
                                              | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == create_psrc2))
                                              | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == create_psrc2))
                                              | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == create_psrc2))
                                              | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == create_psrc2))
                                              | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == create_psrc2))
                                              | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == create_psrc2))
                                              | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == create_psrc2));
            psrc2       <= create_psrc2;
            pdst_vld    <= create_pdst_vld;
            pdst        <= (create_pdst_vld) ? create_pdst : 0;
            imm_vld     <= create_imm_vld;
            imm         <= create_imm;
        end
        else begin
            vld         <= vld;
            iid         <= iid;
            opcode      <= opcode;
            funct7      <= funct7;
            funct3      <= funct3;
            pc          <= pc;
            psrc1_vld   <= psrc1_vld;
            psrc1_ready <= psrc1_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == psrc1))
                                       | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == psrc1))
                                       | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == psrc1))
                                       | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == psrc1))
                                       | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == psrc1))
                                       | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == psrc1))
                                       | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == psrc1))
                                       | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == psrc1))
                                       | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == psrc1))
                                       | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == psrc1));
            psrc1       <= psrc1;
            psrc2_vld   <= psrc2_vld;
            psrc2_ready <= psrc2_ready | (idu_idu_is_alu_is_forward_vld & (idu_idu_is_alu_is_forward_preg == psrc2))
                                       | (idu_idu_is_alu_rf_forward_vld & (idu_idu_is_alu_rf_forward_preg == psrc2))
                                       | (exu_idu_is_alu_result_vld     & (exu_idu_is_alu_result_preg     == psrc2))
                                       | (exu_idu_is_mul1_forward_vld   & (exu_idu_is_mul1_forward_preg   == psrc2))
                                       | (exu_idu_is_mul2_forward_vld   & (exu_idu_is_mul2_forward_preg   == psrc2))
                                       | (exu_idu_is_mul3_result_vld    & (exu_idu_is_mul3_result_preg    == psrc2))
                                       | (exu_idu_is_div1_forward_vld   & (exu_idu_is_div1_forward_preg   == psrc2))
                                       | (exu_idu_is_div2_forward_vld   & (exu_idu_is_div2_forward_preg   == psrc2))
                                       | (exu_idu_is_div3_result_vld    & (exu_idu_is_div3_result_preg    == psrc2))
                                       | (exu_idu_is_lsu_result_vld     & (exu_idu_is_lsu_result_preg     == psrc2));
            psrc2       <= psrc2;
            pdst_vld    <= pdst_vld;
            pdst        <= pdst;
            imm_vld     <= imm_vld;
            imm         <= imm;
        end
    end

    assign ready = psrc1_ready & psrc2_ready & vld;
endmodule