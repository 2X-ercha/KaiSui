// init
parameter PC_RESET		= 64'h0000_0000_8000_0000;

// opcode
// R-type
// 这里的32/64代表的是rs的长度
// ALU
parameter R_ALU64		= 7'b0110011;
parameter R_ALU32 		= 7'b0111011;
// I-type
// ALU
parameter I_ALU64		= 7'b0010011;
parameter I_ALU32 		= 7'b0011011;
// MEMORY_load
parameter I_MEMLOAD		= 7'b0000011;
// ENV
parameter I_ENV			= 7'b1110011;
// PCJUMP_jalr
parameter I_JALR		= 7'b1100111;
// S-type
// MEMORY_STORE
parameter S_MEMSTORE 	= 7'b0100011;
// B-type
// PCJUMP_branch
parameter B_BRANCH		= 7'b1100011;
// U-type
// REG_auipc
parameter U_AUIPC 		= 7'b0010111;
// MEMORY_LUI
parameter U_LUI 		= 7'b0110111;
// J-type
parameter J_JAL			= 7'b1101111;

// funct3
// MEM load and store
// {signed/unsigned, type[1:0]}
parameter MEMINDEX_UNSIGNED 	= 2;
parameter MEMFLAG_TYPE_BYTE 	= 2'b00;
parameter MEMFLAG_TYPE_HALF 	= 2'b01;
parameter MEMFLAG_TYPE_WORD 	= 2'b10;
parameter MEMFLAG_TYPE_DWORD 	= 2'b11;
// pc jump logic
// {equality/relational, signed/unsigned, invert}
// optype can diff (==/!=) && (</>=)
// invert_flag explain the result needing invert or not
// less 		= (funct3[LOGICINDEX_UNSIGNED])   ? uless 		: sless		;
// result_tmp 	= (funct3[LOGICINDEX_OPTYPE]) 	  ? less 		: equal		;
// result 		= (funct3[LOGICINDEX_INVERTFLAG]) ? ~result_tmp : result_tmp;
parameter LOGICINDEX_OPTYPE 	= 2;
parameter LOGICINDEX_UNSIGNED	= 1;
parameter LOGICINDEX_INVERTFLAG	= 0;

// funct7
// funct7[5] 0/1: add/sub、srl/sra
// srli/srai: imm[5] used as funct7[5]
parameter ALUINDEX_OP_MODIFIER	= 5;
// funct7[0] 1: mul、div、rem flag
parameter ALUINDEX_M_EXT		= 0;

// imm
// ecall
parameter ENVFLAG_ECALL 		= 64'b0;
parameter ENVFLAG_EBREAK 		= 64'b1;

// special
// ALU
// opcode	0110011					0111011			0010011		0011011
//						funct7[0]=1
//									32							32
// 000: 	add/sub 	mul			addw/subw/mulw
// 001: 	sll			mulh		sllw			slli		slliw
// 010: 	slt			mulhsu
// 011: 	sltu		mulhu
// 100: 	xor			div			divw
// 101: 	srl/sra		divu		srlw/sraw/divuw	srli/srai	srliw/sraiw
// 110: 	or			rem			remw
// 111: 	and			remu		remuw
//
// judge order: funct7[0] (I/M)
//			 -> funct3
//			 -> funct7[5] (I -> add/sub、srl/sra)
//			 -> is32	  (I/M)
