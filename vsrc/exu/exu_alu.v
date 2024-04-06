module exu_alu (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_exu_alu_vld,
    idu_exu_alu_iid,
    idu_exu_alu_opcode,
    idu_exu_alu_funct7,
    idu_exu_alu_funct3,
    idu_exu_alu_pc,
    idu_exu_alu_psrc1_vld,
    idu_exu_alu_psrc1_value,
    idu_exu_alu_psrc2_vld,
    idu_exu_alu_psrc2_value,
    idu_exu_alu_pdst_vld,
    idu_exu_alu_pdst,
    idu_exu_alu_imm_vld,
    idu_exu_alu_imm,
    exu_rtu_rob_alu_complete,
    exu_rtu_rob_alu_iid,
    exu_idu_rf_alu_wb_vld,
    exu_idu_rf_alu_wb_preg,
    exu_idu_rf_alu_wb_data
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_exu_alu_vld;
    input  [3 :0] idu_exu_alu_iid;
    input  [6 :0] idu_exu_alu_opcode;
    input  [6 :0] idu_exu_alu_funct7;
    input  [2 :0] idu_exu_alu_funct3;
    input  [63:0] idu_exu_alu_pc;
    input         idu_exu_alu_psrc1_vld;
    input  [63:0] idu_exu_alu_psrc1_value;
    input         idu_exu_alu_psrc2_vld;
    input  [63:0] idu_exu_alu_psrc2_value;
    input         idu_exu_alu_pdst_vld;
    input  [5 :0] idu_exu_alu_pdst;
    input         idu_exu_alu_imm_vld;
    input  [63:0] idu_exu_alu_imm;
    output        exu_rtu_rob_alu_complete;
    output [3 :0] exu_rtu_rob_alu_iid;
    output        exu_idu_rf_alu_wb_vld;
    output [5 :0] exu_idu_rf_alu_wb_preg;
    output [63:0] exu_idu_rf_alu_wb_data;

    // &Regs;
    reg        vld;
    reg [3 :0] iid;
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
    wire        idu_exu_alu_vld;
    wire [3 :0] idu_exu_alu_iid;
    wire [6 :0] idu_exu_alu_opcode;
    wire [6 :0] idu_exu_alu_funct7;
    wire [2 :0] idu_exu_alu_funct3;
    wire [63:0] idu_exu_alu_pc;
    wire        idu_exu_alu_psrc1_vld;
    wire [63:0] idu_exu_alu_psrc1_value;
    wire        idu_exu_alu_psrc2_vld;
    wire [63:0] idu_exu_alu_psrc2_value;
    wire        idu_exu_alu_pdst_vld;
    wire [5 :0] idu_exu_alu_pdst;
    wire        idu_exu_alu_imm_vld;
    wire [63:0] idu_exu_alu_imm;
    wire        exu_rtu_rob_alu_complete;
    wire [3 :0] exu_rtu_rob_alu_iid;
    wire        exu_idu_rf_alu_wb_vld;
    wire [5 :0] exu_idu_rf_alu_wb_preg;
    wire [63:0] exu_idu_rf_alu_wb_data;
    wire        R_alu64;
    wire        R_alu32;
    wire        I_alu64;
    wire        I_alu32;
    wire        U_auipc;
    wire        U_lui;
    wire        R;
    wire        I;
    wire        op64;
    wire [63:0] operand1;
    wire [63:0] operand2;
    wire [5:0]  shift_amt;
    wire [63:0] ans_add;
    wire [63:0] ans_sub;
    wire [63:0] ans_shl;
    wire [63:0] ans_slt;
    wire [63:0] ans_sltu;
    wire [63:0] ans_xor;
    wire [63:0] ans_srl64;
    wire [63:0] ans_srl32;
    wire [63:0] ans_sra;
    wire [63:0] ans_or;
    wire [63:0] ans_and;
    wire [63:0] lui;
    wire [63:0] auipc;
    wire        add_sel;
    wire        sub_sel;
    wire        shl_sel;
    wire        slt_sel;
    wire        sltu_sel;
    wire        xor_sel;
    wire        srl64_sel;
    wire        srl32_sel;
    wire        sra_sel;
    wire        or_sel;
    wire        and_sel;
    wire [63:0] alu_out_64;
    wire        alu64_sel;
    wire        alu32_sel;

    parameter ALU_ADD   = 3'b000;
    parameter ALU_SHL   = 3'b001;
    parameter ALU_SLT   = 3'b010;
    parameter ALU_SLTU  = 3'b011;
    parameter ALU_XOR   = 3'b100;
    parameter ALU_SHR   = 3'b101;
    parameter ALU_OR    = 3'b110;
    parameter ALU_AND   = 3'b111;

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
        else if (idu_exu_alu_vld) begin
            vld         <= 1;
            iid         <= idu_exu_alu_iid;
            opcode      <= idu_exu_alu_opcode;
            funct7      <= idu_exu_alu_funct7;
            funct3      <= idu_exu_alu_funct3;
            pc          <= idu_exu_alu_pc;
            psrc1_vld   <= idu_exu_alu_psrc1_vld;
            psrc1_value <= idu_exu_alu_psrc1_value;
            psrc2_vld   <= idu_exu_alu_psrc2_vld;
            psrc2_value <= idu_exu_alu_psrc2_value;
            pdst_vld    <= idu_exu_alu_pdst_vld;
            pdst        <= idu_exu_alu_pdst;
            imm_vld     <= idu_exu_alu_imm_vld;
            imm         <= idu_exu_alu_imm;
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

    assign R_alu64    = (opcode == R_ALU64);
    assign R_alu32    = (opcode == R_ALU32);
    assign I_alu64    = (opcode == I_ALU64);
    assign I_alu32    = (opcode == I_ALU32);
    assign U_auipc    = (opcode == U_AUIPC);
    assign U_lui      = (opcode == U_LUI);
    assign R = R_alu64 | R_alu32;
    assign I = I_alu64 | I_alu32;
    assign op64 = R_alu64 | I_alu64;

    assign operand1 = (op64) ? psrc1_value
                             : {{32{psrc1_value[31]}}, psrc1_value[31:0]};
    assign operand2 = (R)    ? (
                      (op64) ? psrc2_value
                             : {{32{psrc2_value[31]}}, psrc2_value[31:0]})
                             : imm;

    // arithmetic all result
    assign shift_amt   = operand2[5:0];
    assign ans_add     = operand1 + operand2;
    assign ans_sub     = operand1 - operand2;
    assign ans_shl     = operand1 << shift_amt;
    assign ans_slt     = ($signed(operand1) < $signed(operand2)) ? 64'b1 : 64'b0;
    assign ans_sltu    = ($unsigned(operand1) < $unsigned(operand2)) ? 64'b1 : 64'b0;
    assign ans_xor     = operand1 ^ operand2;
    assign ans_srl64   = operand1 >> shift_amt;
    assign ans_srl32   = {32'b0, operand1[31:0]} >> shift_amt;
    assign ans_sra     = $signed(operand1) >>> shift_amt;
    assign ans_or      = operand1 | operand2;
    assign ans_and     = operand1 & operand2;
    assign lui         = imm;
    assign auipc       = pc + imm;

    assign add_sel     = (funct3 == ALU_ADD ) & ((~funct7[5] & R) | I);
    assign sub_sel     = (funct3 == ALU_ADD ) & funct7[5] & R;
    assign shl_sel     = (funct3 == ALU_SHL ) & (R | I);
    assign slt_sel     = (funct3 == ALU_SLT ) & (R | I);
    assign sltu_sel    = (funct3 == ALU_SLTU) & (R | I);
    assign xor_sel     = (funct3 == ALU_XOR ) & (R | I);
    assign srl64_sel   = (funct3 == ALU_SHR ) & ~funct7[5] & (R | I) & op64;
    assign srl32_sel   = (funct3 == ALU_SHR ) & ~funct7[5] & (R | I) & ~op64;
    assign sra_sel     = (funct3 == ALU_SHR ) & funct7[5] & (R | I);
    assign or_sel      = (funct3 == ALU_OR  ) & (R | I);
    assign and_sel     = (funct3 == ALU_AND ) & (R | I);

    assign alu_out_64  = (ans_add   & {64{add_sel  }})
                       | (ans_sub   & {64{sub_sel  }})
                       | (ans_shl   & {64{shl_sel  }})
                       | (ans_slt   & {64{slt_sel  }})
                       | (ans_sltu  & {64{sltu_sel }})
                       | (ans_xor   & {64{xor_sel  }})
                       | (ans_srl64 & {64{srl64_sel}})
                       | (ans_srl32 & {64{srl32_sel}})
                       | (ans_sra   & {64{sra_sel  }})
                       | (ans_or    & {64{or_sel   }})
                       | (ans_and   & {64{and_sel  }});
    assign alu64_sel = (R | I) &  op64;
    assign alu32_sel = (R | I) & ~op64;

    assign exu_rtu_rob_alu_complete   = vld;
    assign exu_rtu_rob_alu_iid        = iid;
    assign exu_idu_rf_alu_wb_vld      = pdst_vld;
    assign exu_idu_rf_alu_wb_preg     = pdst;
    assign exu_idu_rf_alu_wb_data     = (alu_out_64 & {64{alu64_sel}})
                                      | ({{32{alu_out_64[31]}}, alu_out_64[31:0]} & {64{alu32_sel}})
                                      | (lui & {64{U_lui}})
                                      | (auipc & {64{U_auipc}});

    `ifdef DEBUG_EXU_ALU_PRINT
        always @(negedge clk)
        begin
            $display("EXU_ALU: pc = %x, op1 = %x, op2 = %x, ans = %x", pc, operand1, operand2, exu_idu_rf_alu_wb_data);
        end
    `endif

endmodule
