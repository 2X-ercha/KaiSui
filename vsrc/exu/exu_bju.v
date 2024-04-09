module exu_bju (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_exu_bju_vld,
    idu_exu_bju_iid,
    idu_exu_bju_opcode,
    idu_exu_bju_funct7,
    idu_exu_bju_funct3,
    idu_exu_bju_pc,
    idu_exu_bju_psrc1_vld,
    idu_exu_bju_psrc1_value,
    idu_exu_bju_psrc2_vld,
    idu_exu_bju_psrc2_value,
    idu_exu_bju_pdst_vld,
    idu_exu_bju_pdst,
    idu_exu_bju_imm_vld,
    idu_exu_bju_imm,
    exu_rtu_rob_bju_complete,
    exu_rtu_rob_bju_iid,
    exu_idu_rf_bju_wb_vld,
    exu_idu_rf_bju_wb_preg,
    exu_idu_rf_bju_wb_data,
    exu_idu_rf_bju_pcjump_vld,
    exu_idu_rf_bju_pcjump_addr
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_exu_bju_vld;
    input  [4 :0] idu_exu_bju_iid;
    input  [6 :0] idu_exu_bju_opcode;
    input  [6 :0] idu_exu_bju_funct7;
    input  [2 :0] idu_exu_bju_funct3;
    input  [63:0] idu_exu_bju_pc;
    input         idu_exu_bju_psrc1_vld;
    input  [63:0] idu_exu_bju_psrc1_value;
    input         idu_exu_bju_psrc2_vld;
    input  [63:0] idu_exu_bju_psrc2_value;
    input         idu_exu_bju_pdst_vld;
    input  [5 :0] idu_exu_bju_pdst;
    input         idu_exu_bju_imm_vld;
    input  [63:0] idu_exu_bju_imm;
    output        exu_rtu_rob_bju_complete;
    output [4 :0] exu_rtu_rob_bju_iid;
    output        exu_idu_rf_bju_wb_vld;
    output [5 :0] exu_idu_rf_bju_wb_preg;
    output [63:0] exu_idu_rf_bju_wb_data;
    output        exu_idu_rf_bju_pcjump_vld;
    output [63:0] exu_idu_rf_bju_pcjump_addr;

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

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_exu_bju_vld;
    wire [4 :0] idu_exu_bju_iid;
    wire [6 :0] idu_exu_bju_opcode;
    wire [6 :0] idu_exu_bju_funct7;
    wire [2 :0] idu_exu_bju_funct3;
    wire [63:0] idu_exu_bju_pc;
    wire        idu_exu_bju_psrc1_vld;
    wire [63:0] idu_exu_bju_psrc1_value;
    wire        idu_exu_bju_psrc2_vld;
    wire [63:0] idu_exu_bju_psrc2_value;
    wire        idu_exu_bju_pdst_vld;
    wire [5 :0] idu_exu_bju_pdst;
    wire        idu_exu_bju_imm_vld;
    wire [63:0] idu_exu_bju_imm;
    wire        exu_rtu_rob_bju_complete;
    wire [4 :0] exu_rtu_rob_bju_iid;
    wire        exu_idu_rf_bju_wb_vld;
    wire [5 :0] exu_idu_rf_bju_wb_preg;
    wire [63:0] exu_idu_rf_bju_wb_data;
    wire        exu_idu_rf_bju_pcjump_vld;
    wire [63:0] exu_idu_rf_bju_pcjump_addr;
    wire        I_jalr;
    wire        B_branch;
    wire        J_jal;
    wire [63:0] ans_jalr;
    wire [63:0] pc_jalr;
    wire [63:0] ans_jal;
    wire [63:0] pc_jal;
    wire [63:0] pc_branch;
    wire        B_Jump_en;
    wire [63:0] a4pc;
    wire [63:0] aipc;
    wire [63:0] ais1;
    wire        sless;
    wire        uless;
    wire        equal;
    wire        less;
    wire        result_tmp;
    wire        result;

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
        else if (idu_exu_bju_vld) begin
            vld         <= 1;
            iid         <= idu_exu_bju_iid;
            opcode      <= idu_exu_bju_opcode;
            funct7      <= idu_exu_bju_funct7;
            funct3      <= idu_exu_bju_funct3;
            pc          <= idu_exu_bju_pc;
            psrc1_vld   <= idu_exu_bju_psrc1_vld;
            psrc1_value <= idu_exu_bju_psrc1_value;
            psrc2_vld   <= idu_exu_bju_psrc2_vld;
            psrc2_value <= idu_exu_bju_psrc2_value;
            pdst_vld    <= idu_exu_bju_pdst_vld;
            pdst        <= idu_exu_bju_pdst;
            imm_vld     <= idu_exu_bju_imm_vld;
            imm         <= idu_exu_bju_imm;
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

    assign I_jalr     = (opcode == I_JALR) & (funct3 == 3'b000);
    assign B_branch   = (opcode == B_BRANCH);
    assign J_jal      = (opcode == J_JAL);
    assign sless = ($signed(psrc1_value)     <   $signed(psrc2_value)   );
    assign uless = ($unsigned(psrc1_value)   <   $unsigned(psrc2_value) );
    assign equal = (psrc1_value              ==  psrc2_value            );

    assign less       = (funct3[1]) ? uless         : sless     ;
    assign result_tmp = (funct3[2]) ? less          : equal     ;
    assign result     = (funct3[0]) ? ~result_tmp   : result_tmp;
    assign B_Jump_en  = result & B_branch;

    assign a4pc       = pc + 4;
    assign aipc       = pc + imm;
    assign ais1       = (psrc1_value + imm) & ~(64'b1);
    assign ans_jalr   = a4pc & {64{I_jalr}};
    assign ans_jal    = a4pc & {64{J_jal}};
    assign pc_jalr    = ais1 & {64{I_jalr}};
    assign pc_jal     = aipc & {64{J_jal}};
    assign pc_branch  = aipc & {64{B_Jump_en}};

    assign exu_rtu_rob_bju_complete   = vld;
    assign exu_rtu_rob_bju_iid        = iid;
    assign exu_idu_rf_bju_wb_vld      = pdst_vld;
    assign exu_idu_rf_bju_wb_preg     = pdst;
    assign exu_idu_rf_bju_wb_data     = ans_jalr | ans_jal;
    assign exu_idu_rf_bju_pcjump_vld  = I_jalr | J_jal | B_Jump_en;
    assign exu_idu_rf_bju_pcjump_addr = pc_jalr | pc_jal | pc_branch;

    `ifdef DEBUG_EXU_BJU_PRINT
        always @(negedge clk)
        begin
            $display("EXU_BJU: pc = %x, jump_en = %b, jump_pc = %x", pc, exu_idu_rf_bju_pcjump_vld, exu_idu_rf_bju_pcjump_addr);
        end
    `endif

endmodule
