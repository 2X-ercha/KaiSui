module idu_id (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_id_stall_ctrl,
    ifu_idu_id_inst_vld,
    ifu_idu_id_inst_pc,
    ifu_idu_id_inst,
    decode_vld,
    decode_opcode,
    decode_funct7,
    decode_funct3,
    decode_pc,
    decode_src1_vld,
    decode_src1,
    decode_src2_vld,
    decode_src2,
    decode_dst_vld,
    decode_dst,
    decode_imm_vld,
    decode_imm,
    decode_type,
    decode_pipe,
    decode_ras,
    iid_req,
    preg_req
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_id_stall_ctrl;
    input         ifu_idu_id_inst_vld;
    input  [63:0] ifu_idu_id_inst_pc;
    input  [31:0] ifu_idu_id_inst;
    output        decode_vld;
    output [6 :0] decode_opcode;
    output [6 :0] decode_funct7;
    output [2 :0] decode_funct3;
    output [63:0] decode_pc;
    output        decode_src1_vld;
    output [4 :0] decode_src1;
    output        decode_src2_vld;
    output [4 :0] decode_src2;
    output        decode_dst_vld;
    output [4 :0] decode_dst;
    output        decode_imm_vld;
    output [63:0] decode_imm;
    output [5 :0] decode_type;
    output [4 :0] decode_pipe;
    output        decode_ras;
    output        iid_req;
    output        preg_req;

    // &Regs;
    reg        decode_vld;
    reg [6 :0] decode_opcode;
    reg [6 :0] decode_funct7;
    reg [2 :0] decode_funct3;
    reg [63:0] decode_pc;
    reg        decode_src1_vld;
    reg [4 :0] decode_src1;
    reg        decode_src2_vld;
    reg [4 :0] decode_src2;
    reg        decode_dst_vld;
    reg [4 :0] decode_dst;
    reg        decode_imm_vld;
    reg [63:0] decode_imm;
    reg [5 :0] decode_type;
    reg [4 :0] decode_pipe;
    reg        decode_ras;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_id_stall_ctrl;
    wire        ifu_idu_id_inst_vld;
    wire [63:0] ifu_idu_id_inst_pc;
    wire [31:0] ifu_idu_id_inst;
    wire        iid_req;
    wire        preg_req;
    wire [6 :0] opcode;
    wire [6 :0] funct7;
    wire [2 :0] funct3;
    wire [4 :0] src1;
    wire [4 :0] src2;
    wire [4 :0] dst;
    wire [11:0] Iimm;
    wire [11:0] Simm;
    wire [12:0] Bimm;
    wire [31:0] Uimm;
    wire [20:0] Jimm;
    wire        R_alu64;
    wire        R_alu32;
    wire        I_alu64;
    wire        I_alu32;
    wire        I_memload;
    wire        I_env;
    wire        I_jalr;
    wire        S_memstore;
    wire        B_branch;
    wire        U_auipc;
    wire        U_lui;
    wire        J_jal;
    wire        R;
    wire        I;
    wire        S;
    wire        B;
    wire        U;
    wire        J;
    wire [5 :0] inst_type;
    wire        pipe0_alu;
    wire        pipe1_mxu;
    wire        pipe2_bju;
    wire        pipe3_lsu;
    wire        pipe4_cp0;
    wire [4 :0] pipe;
    wire        ras;

    parameter caseR = 6'b100000;
    parameter caseI = 6'b010000;
    parameter caseS = 6'b001000;
    parameter caseB = 6'b000100;
    parameter caseU = 6'b000010;
    parameter caseJ = 6'b000001;

    // level1 encode
    assign opcode = ifu_idu_id_inst[6:0];
    assign funct7 = ifu_idu_id_inst[31:25];
    assign funct3 = ifu_idu_id_inst[14:12];
    assign src1   = ifu_idu_id_inst[19:15];
    assign src2   = ifu_idu_id_inst[24:20];
    assign dst    = ifu_idu_id_inst[11:7];
    assign Iimm   = ifu_idu_id_inst[31:20];
    assign Simm   = {ifu_idu_id_inst[31:25], ifu_idu_id_inst[11:7]};
    assign Bimm   = {ifu_idu_id_inst[31], ifu_idu_id_inst[7], ifu_idu_id_inst[30:25], ifu_idu_id_inst[11:8], 1'b0};
    assign Uimm   = {ifu_idu_id_inst[31:12], 12'b0};
    assign Jimm   = {ifu_idu_id_inst[31], ifu_idu_id_inst[19:12], ifu_idu_id_inst[20], ifu_idu_id_inst[30:21], 1'b0};

    // level2 encode
    assign R_alu64    = (opcode == R_ALU64);
    assign R_alu32    = (opcode == R_ALU32);
    assign I_alu64    = (opcode == I_ALU64);
    assign I_alu32    = (opcode == I_ALU32);
    assign I_memload  = (opcode == I_MEMLOAD);
    assign I_env      = (opcode == I_ENV);
    assign I_jalr     = (opcode == I_JALR);
    assign S_memstore = (opcode == S_MEMSTORE);
    assign B_branch   = (opcode == B_BRANCH);
    assign U_auipc    = (opcode == U_AUIPC);
    assign U_lui      = (opcode == U_LUI);
    assign J_jal      = (opcode == J_JAL);

    // level3 encode
    assign R         = R_alu64 | R_alu32;
    assign I         = I_alu64 | I_alu32 | I_memload | I_env | I_jalr;
    assign S         = S_memstore;
    assign B         = B_branch;
    assign U         = U_auipc | U_lui;
    assign J         = J_jal;
    assign inst_type = {R, I, S, B, U, J};

    assign pipe0_alu = (R_alu64 & !funct7[0]) | (R_alu32 & !funct7[0]) | I_alu64 | I_alu32 | U_lui;
    assign pipe1_mxu = (R_alu64 &  funct7[0]) | (R_alu32 &  funct7[0]);
    assign pipe2_bju = I_jalr | B_branch | J_jal | U_auipc;
    assign pipe3_lsu = I_memload | S_memstore;
    assign pipe4_cp0 = I_env;
    assign pipe      = {pipe0_alu, pipe1_mxu, pipe2_bju, pipe3_lsu, pipe4_cp0};

    assign ras       = J_jal | I_jalr;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            decode_vld    <= 0;
            decode_opcode <= 0;
            decode_funct7 <= 0;
            decode_funct3 <= 0;
            decode_pc     <= 0;
            decode_type   <= 0;
            decode_pipe   <= 0;
            decode_ras    <= 0;
        end
        else if (rtu_global_flush) begin
            decode_vld    <= 0;
            decode_opcode <= 0;
            decode_funct7 <= 0;
            decode_funct3 <= 0;
            decode_pc     <= 0;
            decode_type   <= 0;
            decode_pipe   <= 0;
            decode_ras    <= 0;
        end
        else if (y_idu_id_stall_ctrl) begin
            decode_vld    <= decode_vld;
            decode_opcode <= decode_opcode;
            decode_funct7 <= decode_funct7;
            decode_funct3 <= decode_funct3;
            decode_pc     <= decode_pc;
            decode_type   <= decode_type;
            decode_pipe   <= decode_pipe;
            decode_ras    <= decode_ras;
        end
        else if (ifu_idu_id_inst_vld) begin
            decode_vld    <= 1;
            decode_opcode <= opcode;
            decode_funct7 <= funct7;
            decode_funct3 <= funct3;
            decode_pc     <= ifu_idu_id_inst_pc;
            decode_type   <= inst_type;
            decode_pipe   <= pipe;
            decode_ras    <= ras;
        end
        else begin
            decode_vld    <= decode_vld;
            decode_opcode <= decode_opcode;
            decode_funct7 <= decode_funct7;
            decode_funct3 <= decode_funct3;
            decode_pc     <= decode_pc;
            decode_type   <= decode_type;
            decode_pipe   <= decode_pipe;
            decode_ras    <= decode_ras;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            decode_src1_vld <= 0;
            decode_src1     <= 0;
            decode_src2_vld <= 0;
            decode_src2     <= 0;
            decode_dst_vld  <= 0;
            decode_dst      <= 0;
            decode_imm_vld  <= 0;
            decode_imm      <= 0;
        end
        else if (y_idu_id_stall_ctrl) begin
            decode_src1_vld <= decode_src1_vld;
            decode_src1     <= decode_src1;
            decode_src2_vld <= decode_src2_vld;
            decode_src2     <= decode_src2;
            decode_dst_vld  <= decode_dst_vld;
            decode_dst      <= decode_dst;
            decode_imm_vld  <= decode_imm_vld;
            decode_imm      <= decode_imm;
        end
        else if (ifu_idu_id_inst_vld) begin
            case (inst_type)
                caseR: begin
                    decode_src1_vld <= 1;
                    decode_src1     <= src1;
                    decode_src2_vld <= 1;
                    decode_src2     <= src2;
                    decode_dst_vld  <= 1;
                    decode_dst      <= dst;
                    decode_imm_vld  <= 0;
                    decode_imm      <= 0;
                end
                caseI: begin
                    decode_src1_vld <= 1;
                    decode_src1     <= src1;
                    decode_src2_vld <= 0;
                    decode_src2     <= 0;
                    decode_dst_vld  <= 1;
                    decode_dst      <= dst;
                    decode_imm_vld  <= 1;
                    decode_imm      <= {{(52){Iimm[11]}}, Iimm};
                end
                caseS: begin
                    decode_src1_vld <= 1;
                    decode_src1     <= src1;
                    decode_src2_vld <= 1;
                    decode_src2     <= src2;
                    decode_dst_vld  <= 0;
                    decode_dst      <= 0;
                    decode_imm_vld  <= 1;
                    decode_imm      <= {{(52){Simm[11]}}, Simm};
                end
                caseB: begin
                    decode_src1_vld <= 1;
                    decode_src1     <= src1;
                    decode_src2_vld <= 1;
                    decode_src2     <= src2;
                    decode_dst_vld  <= 0;
                    decode_dst      <= 0;
                    decode_imm_vld  <= 1;
                    decode_imm      <= {{(51){Bimm[12]}}, Bimm};
                end
                caseU: begin
                    decode_src1_vld <= 0;
                    decode_src1     <= 0;
                    decode_src2_vld <= 0;
                    decode_src2     <= 0;
                    decode_dst_vld  <= 1;
                    decode_dst      <= dst;
                    decode_imm_vld  <= 1;
                    decode_imm      <= {{(32){Uimm[31]}}, Uimm};
                end
                caseJ: begin
                    decode_src1_vld <= 0;
                    decode_src1     <= 0;
                    decode_src2_vld <= 0;
                    decode_src2     <= 0;
                    decode_dst_vld  <= 1 & (dst != 0);
                    decode_dst      <= dst;
                    decode_imm_vld  <= 1;
                    decode_imm      <= {{(43){Jimm[20]}}, Jimm};
                end
                default: begin
                    decode_src1_vld <= 0;
                    decode_src1     <= 0;
                    decode_src2_vld <= 0;
                    decode_src2     <= 0;
                    decode_dst_vld  <= 0;
                    decode_dst      <= 0;
                    decode_imm_vld  <= 0;
                    decode_imm      <= 0;
                end
            endcase
        end
        else begin
            decode_src1_vld <= decode_src1_vld;
            decode_src1     <= decode_src1;
            decode_src2_vld <= decode_src2_vld;
            decode_src2     <= decode_src2;
            decode_dst_vld  <= decode_dst_vld;
            decode_dst      <= decode_dst;
            decode_imm_vld  <= decode_imm_vld;
            decode_imm      <= decode_imm;
        end
    end

    assign iid_req  = decode_vld;
    assign preg_req = decode_dst_vld & (decode_dst != 0);

    `ifdef DEBUG_IDU_ID_PRINT
        always @(negedge clk)
        begin
            $display("IDU_ID : PC = %x, OPCODE = %x, SRC1 = x%02d, SRC2 = x%02d, DST = x%02d, IMM = %x, PIPE = %b",
                    decode_pc, decode_opcode, decode_src1, decode_src2, decode_dst, decode_imm, decode_pipe);
        end
    `endif

endmodule
