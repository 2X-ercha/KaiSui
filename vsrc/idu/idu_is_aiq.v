module idu_is_aiq (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_is_stall_ctrl,
    idu_idu_is_vld,
    rtu_idu_is_iid,
    idu_idu_is_opcode,
    idu_idu_is_funct7,
    idu_idu_is_funct3,
    idu_idu_is_pc,
    idu_idu_is_psrc1_vld,
    idu_idu_is_psrc1_ready,
    idu_idu_is_psrc1,
    idu_idu_is_psrc2_vld,
    idu_idu_is_psrc2_ready,
    idu_idu_is_psrc2,
    idu_idu_is_pdst_vld,
    rtu_idu_is_preg,
    idu_idu_is_imm_vld,
    idu_idu_is_imm,
    idu_idu_is_pipe,
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
    aiq_stall_ctrl,
    aiq_vld,
    aiq_iid,
    aiq_opcode,
    aiq_funct7,
    aiq_funct3,
    aiq_pc,
    aiq_psrc1_vld,
    aiq_psrc1,
    aiq_psrc2_vld,
    aiq_psrc2,
    aiq_pdst_vld,
    aiq_pdst,
    aiq_imm_vld,
    aiq_imm,
    idu_idu_is_alu_is_forward_vld,
    idu_idu_is_alu_is_forward_preg
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_is_stall_ctrl;
    input         idu_idu_is_vld;
    input  [3 :0] rtu_idu_is_iid;
    input  [6 :0] idu_idu_is_opcode;
    input  [6 :0] idu_idu_is_funct7;
    input  [2 :0] idu_idu_is_funct3;
    input  [63:0] idu_idu_is_pc;
    input         idu_idu_is_psrc1_vld;
    input         idu_idu_is_psrc1_ready;
    input  [5 :0] idu_idu_is_psrc1;
    input         idu_idu_is_psrc2_vld;
    input         idu_idu_is_psrc2_ready;
    input  [5 :0] idu_idu_is_psrc2;
    input         idu_idu_is_pdst_vld;
    input  [5 :0] rtu_idu_is_preg;
    input         idu_idu_is_imm_vld;
    input  [63:0] idu_idu_is_imm;
    input  [4 :0] idu_idu_is_pipe;
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
    output        aiq_stall_ctrl;
    output        aiq_vld;
    output [3 :0] aiq_iid;
    output [6 :0] aiq_opcode;
    output [6 :0] aiq_funct7;
    output [2 :0] aiq_funct3;
    output [63:0] aiq_pc;
    output        aiq_psrc1_vld;
    output [5 :0] aiq_psrc1;
    output        aiq_psrc2_vld;
    output [5 :0] aiq_psrc2;
    output        aiq_pdst_vld;
    output [5 :0] aiq_pdst;
    output        aiq_imm_vld;
    output [63:0] aiq_imm;
    output        idu_idu_is_alu_is_forward_vld;
    output [5 :0] idu_idu_is_alu_is_forward_preg;

    // &Regs;
    reg [3 :0] num;
    reg [2 :0] entry0_age;
    reg [2 :0] entry1_age;
    reg [2 :0] entry2_age;
    reg [2 :0] entry3_age;
    reg [2 :0] entry4_age;
    reg [2 :0] entry5_age;
    reg [2 :0] entry6_age;
    reg [2 :0] entry7_age;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_is_stall_ctrl;
    wire        idu_idu_is_vld;
    wire [3 :0] rtu_idu_is_iid;
    wire [6 :0] idu_idu_is_opcode;
    wire [6 :0] idu_idu_is_funct7;
    wire [2 :0] idu_idu_is_funct3;
    wire [63:0] idu_idu_is_pc;
    wire        idu_idu_is_psrc1_vld;
    wire        idu_idu_is_psrc1_ready;
    wire [5 :0] idu_idu_is_psrc1;
    wire        idu_idu_is_psrc2_vld;
    wire        idu_idu_is_psrc2_ready;
    wire [5 :0] idu_idu_is_psrc2;
    wire        idu_idu_is_pdst_vld;
    wire [5 :0] rtu_idu_is_preg;
    wire        idu_idu_is_imm_vld;
    wire [63:0] idu_idu_is_imm;
    wire [4 :0] idu_idu_is_pipe;
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
    wire [7 :0] create_sel;
    wire [7 :0] create_vld;
    wire [7 :0] entry_vld;
    wire [7 :0] entry_ready;
    wire        cmp_10;
    wire [1 :0] cmp_10_vld;
    wire [3 :0] cmp_10_vage;
    wire        cmp_32;
    wire [1 :0] cmp_32_vld;
    wire [3 :0] cmp_32_vage;
    wire        cmp_54;
    wire [1 :0] cmp_54_vld;
    wire [3 :0] cmp_54_vage;
    wire        cmp_76;
    wire [1 :0] cmp_76_vld;
    wire [3 :0] cmp_76_vage;
    wire        cmp_30;
    wire [3 :0] cmp_30_vld;
    wire [3 :0] cmp_30_vage;
    wire        cmp_74;
    wire [3 :0] cmp_74_vld;
    wire [3 :0] cmp_74_vage;
    wire        cmp_70;
    wire [7 :0] cmp_70_vld;
    wire [3 :0] cmp_70_vage;
    wire [7 :0] issue_vld;
    wire [2 :0] issue_age;
    wire        aiq_stall_ctrl;
    wire        create_entry_vld;
    wire        aiq_vld;
    wire [3 :0] aiq_iid;
    wire [6 :0] aiq_opcode;
    wire [6 :0] aiq_funct7;
    wire [2 :0] aiq_funct3;
    wire [63:0] aiq_pc;
    wire        aiq_psrc1_vld;
    wire [5 :0] aiq_psrc1;
    wire        aiq_psrc2_vld;
    wire [5 :0] aiq_psrc2;
    wire        aiq_pdst_vld;
    wire [5 :0] aiq_pdst;
    wire        aiq_imm_vld;
    wire [63:0] aiq_imm;
    wire [3 :0] entry0_iid;
    wire [3 :0] entry1_iid;
    wire [3 :0] entry2_iid;
    wire [3 :0] entry3_iid;
    wire [3 :0] entry4_iid;
    wire [3 :0] entry5_iid;
    wire [3 :0] entry6_iid;
    wire [3 :0] entry7_iid;
    wire [6 :0] entry0_opcode;
    wire [6 :0] entry1_opcode;
    wire [6 :0] entry2_opcode;
    wire [6 :0] entry3_opcode;
    wire [6 :0] entry4_opcode;
    wire [6 :0] entry5_opcode;
    wire [6 :0] entry6_opcode;
    wire [6 :0] entry7_opcode;
    wire [6 :0] entry0_funct7;
    wire [6 :0] entry1_funct7;
    wire [6 :0] entry2_funct7;
    wire [6 :0] entry3_funct7;
    wire [6 :0] entry4_funct7;
    wire [6 :0] entry5_funct7;
    wire [6 :0] entry6_funct7;
    wire [6 :0] entry7_funct7;
    wire [2 :0] entry0_funct3;
    wire [2 :0] entry1_funct3;
    wire [2 :0] entry2_funct3;
    wire [2 :0] entry3_funct3;
    wire [2 :0] entry4_funct3;
    wire [2 :0] entry5_funct3;
    wire [2 :0] entry6_funct3;
    wire [2 :0] entry7_funct3;
    wire [63:0] entry0_pc;
    wire [63:0] entry1_pc;
    wire [63:0] entry2_pc;
    wire [63:0] entry3_pc;
    wire [63:0] entry4_pc;
    wire [63:0] entry5_pc;
    wire [63:0] entry6_pc;
    wire [63:0] entry7_pc;
    wire [7 :0] entry_psrc1_vld;
    wire [5 :0] entry0_psrc1;
    wire [5 :0] entry1_psrc1;
    wire [5 :0] entry2_psrc1;
    wire [5 :0] entry3_psrc1;
    wire [5 :0] entry4_psrc1;
    wire [5 :0] entry5_psrc1;
    wire [5 :0] entry6_psrc1;
    wire [5 :0] entry7_psrc1;
    wire [7 :0] entry_psrc2_vld;
    wire [5 :0] entry0_psrc2;
    wire [5 :0] entry1_psrc2;
    wire [5 :0] entry2_psrc2;
    wire [5 :0] entry3_psrc2;
    wire [5 :0] entry4_psrc2;
    wire [5 :0] entry5_psrc2;
    wire [5 :0] entry6_psrc2;
    wire [5 :0] entry7_psrc2;
    wire [7 :0] entry_pdst_vld;
    wire [5 :0] entry0_pdst;
    wire [5 :0] entry1_pdst;
    wire [5 :0] entry2_pdst;
    wire [5 :0] entry3_pdst;
    wire [5 :0] entry4_pdst;
    wire [5 :0] entry5_pdst;
    wire [5 :0] entry6_pdst;
    wire [5 :0] entry7_pdst;
    wire [7 :0] entry_imm_vld;
    wire [63:0] entry0_imm;
    wire [63:0] entry1_imm;
    wire [63:0] entry2_imm;
    wire [63:0] entry3_imm;
    wire [63:0] entry4_imm;
    wire [63:0] entry5_imm;
    wire [63:0] entry6_imm;
    wire [63:0] entry7_imm;

    idu_is_aiq_entry idu_is_aiq0_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[0]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[0]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[0]                    ),
        .iid                            	( entry0_iid                      ),
        .opcode                         	( entry0_opcode                   ),
        .funct7                         	( entry0_funct7                   ),
        .funct3                         	( entry0_funct3                   ),
        .pc                             	( entry0_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[0]              ),
        .psrc1                          	( entry0_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[0]              ),
        .psrc2                          	( entry0_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[0]               ),
        .pdst                           	( entry0_pdst                     ),
        .imm_vld                        	( entry_imm_vld[0]                ),
        .imm                            	( entry0_imm                      ),
        .ready                          	( entry_ready[0]                  )
    );

    idu_is_aiq_entry idu_is_aiq1_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[1]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[1]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[1]                    ),
        .iid                            	( entry1_iid                      ),
        .opcode                         	( entry1_opcode                   ),
        .funct7                         	( entry1_funct7                   ),
        .funct3                         	( entry1_funct3                   ),
        .pc                             	( entry1_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[1]              ),
        .psrc1                          	( entry1_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[1]              ),
        .psrc2                          	( entry1_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[1]               ),
        .pdst                           	( entry1_pdst                     ),
        .imm_vld                        	( entry_imm_vld[1]                ),
        .imm                            	( entry1_imm                      ),
        .ready                          	( entry_ready[1]                  )
    );

    idu_is_aiq_entry idu_is_aiq2_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[2]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[2]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[2]                    ),
        .iid                            	( entry2_iid                      ),
        .opcode                         	( entry2_opcode                   ),
        .funct7                         	( entry2_funct7                   ),
        .funct3                         	( entry2_funct3                   ),
        .pc                             	( entry2_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[2]              ),
        .psrc1                          	( entry2_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[2]              ),
        .psrc2                          	( entry2_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[2]               ),
        .pdst                           	( entry2_pdst                     ),
        .imm_vld                        	( entry_imm_vld[2]                ),
        .imm                            	( entry2_imm                      ),
        .ready                          	( entry_ready[2]                  )
    );

    idu_is_aiq_entry idu_is_aiq3_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[3]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[3]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[3]                    ),
        .iid                            	( entry3_iid                      ),
        .opcode                         	( entry3_opcode                   ),
        .funct7                         	( entry3_funct7                   ),
        .funct3                         	( entry3_funct3                   ),
        .pc                             	( entry3_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[3]              ),
        .psrc1                          	( entry3_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[3]              ),
        .psrc2                          	( entry3_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[3]               ),
        .pdst                           	( entry3_pdst                     ),
        .imm_vld                        	( entry_imm_vld[3]                ),
        .imm                            	( entry3_imm                      ),
        .ready                          	( entry_ready[3]                  )
    );

    idu_is_aiq_entry idu_is_aiq4_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[4]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[4]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[4]                    ),
        .iid                            	( entry4_iid                      ),
        .opcode                         	( entry4_opcode                   ),
        .funct7                         	( entry4_funct7                   ),
        .funct3                         	( entry4_funct3                   ),
        .pc                             	( entry4_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[4]              ),
        .psrc1                          	( entry4_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[4]              ),
        .psrc2                          	( entry4_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[4]               ),
        .pdst                           	( entry4_pdst                     ),
        .imm_vld                        	( entry_imm_vld[4]                ),
        .imm                            	( entry4_imm                      ),
        .ready                          	( entry_ready[4]                  )
    );

    idu_is_aiq_entry idu_is_aiq5_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[5]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[5]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[5]                    ),
        .iid                            	( entry5_iid                      ),
        .opcode                         	( entry5_opcode                   ),
        .funct7                         	( entry5_funct7                   ),
        .funct3                         	( entry5_funct3                   ),
        .pc                             	( entry5_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[5]              ),
        .psrc1                          	( entry5_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[5]              ),
        .psrc2                          	( entry5_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[5]               ),
        .pdst                           	( entry5_pdst                     ),
        .imm_vld                        	( entry_imm_vld[5]                ),
        .imm                            	( entry5_imm                      ),
        .ready                          	( entry_ready[5]                  )
    );

    idu_is_aiq_entry idu_is_aiq6_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[6]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[6]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[6]                    ),
        .iid                            	( entry6_iid                      ),
        .opcode                         	( entry6_opcode                   ),
        .funct7                         	( entry6_funct7                   ),
        .funct3                         	( entry6_funct3                   ),
        .pc                             	( entry6_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[6]              ),
        .psrc1                          	( entry6_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[6]              ),
        .psrc2                          	( entry6_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[6]               ),
        .pdst                           	( entry6_pdst                     ),
        .imm_vld                        	( entry_imm_vld[6]                ),
        .imm                            	( entry6_imm                      ),
        .ready                          	( entry_ready[6]                  )
    );

    idu_is_aiq_entry idu_is_aiq7_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[7]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_pc                      	( idu_idu_is_pc                   ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld[7]                    ),
        .idu_idu_is_alu_is_forward_vld  	( idu_idu_is_alu_is_forward_vld   ),
        .idu_idu_is_alu_is_forward_preg 	( idu_idu_is_alu_is_forward_preg  ),
        .idu_idu_is_alu_rf_forward_vld  	( idu_idu_is_alu_rf_forward_vld   ),
        .idu_idu_is_alu_rf_forward_preg 	( idu_idu_is_alu_rf_forward_preg  ),
        .exu_idu_is_alu_result_vld      	( exu_idu_is_alu_result_vld       ),
        .exu_idu_is_alu_result_preg     	( exu_idu_is_alu_result_preg      ),
        .exu_idu_is_mul1_forward_vld    	( exu_idu_is_mul1_forward_vld     ),
        .exu_idu_is_mul1_forward_preg   	( exu_idu_is_mul1_forward_preg    ),
        .exu_idu_is_mul2_forward_vld    	( exu_idu_is_mul2_forward_vld     ),
        .exu_idu_is_mul2_forward_preg   	( exu_idu_is_mul2_forward_preg    ),
        .exu_idu_is_mul3_result_vld     	( exu_idu_is_mul3_result_vld      ),
        .exu_idu_is_mul3_result_preg    	( exu_idu_is_mul3_result_preg     ),
        .exu_idu_is_div1_forward_vld    	( exu_idu_is_div1_forward_vld     ),
        .exu_idu_is_div1_forward_preg   	( exu_idu_is_div1_forward_preg    ),
        .exu_idu_is_div2_forward_vld    	( exu_idu_is_div2_forward_vld     ),
        .exu_idu_is_div2_forward_preg   	( exu_idu_is_div2_forward_preg    ),
        .exu_idu_is_div3_result_vld     	( exu_idu_is_div3_result_vld      ),
        .exu_idu_is_div3_result_preg    	( exu_idu_is_div3_result_preg     ),
        .exu_idu_is_lsu_result_vld      	( exu_idu_is_lsu_result_vld       ),
        .exu_idu_is_lsu_result_preg     	( exu_idu_is_lsu_result_preg      ),
        .vld                            	( entry_vld[7]                    ),
        .iid                            	( entry7_iid                      ),
        .opcode                         	( entry7_opcode                   ),
        .funct7                         	( entry7_funct7                   ),
        .funct3                         	( entry7_funct3                   ),
        .pc                             	( entry7_pc                       ),
        .psrc1_vld                      	( entry_psrc1_vld[7]              ),
        .psrc1                          	( entry7_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[7]              ),
        .psrc2                          	( entry7_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[7]               ),
        .pdst                           	( entry7_pdst                     ),
        .imm_vld                        	( entry_imm_vld[7]                ),
        .imm                            	( entry7_imm                      ),
        .ready                          	( entry_ready[7]                  )
    );

    assign create_entry_vld = idu_idu_is_vld & ~aiq_stall_ctrl & idu_idu_is_pipe[4] & ~y_idu_is_stall_ctrl;

    // create_entry sel
    assign create_sel[0] = !entry_vld[0];
    assign create_sel[1] = !entry_vld[1] && entry_vld[0];
    assign create_sel[2] = !entry_vld[2] && (&entry_vld[1:0]);
    assign create_sel[3] = !entry_vld[3] && (&entry_vld[2:0]);
    assign create_sel[4] = !entry_vld[4] && (&entry_vld[3:0]);
    assign create_sel[5] = !entry_vld[5] && (&entry_vld[4:0]);
    assign create_sel[6] = !entry_vld[6] && (&entry_vld[5:0]);
    assign create_sel[7] = !entry_vld[7] && (&entry_vld[6:0]);
    assign create_vld    = create_sel & {8{create_entry_vld}};

    // issue_entry_sel
    assign cmp_10 = {~entry_ready[1], entry1_age} < {~entry_ready[0], entry0_age};
    assign cmp_32 = {~entry_ready[3], entry3_age} < {~entry_ready[2], entry2_age};
    assign cmp_54 = {~entry_ready[5], entry5_age} < {~entry_ready[4], entry4_age};
    assign cmp_76 = {~entry_ready[7], entry7_age} < {~entry_ready[6], entry6_age};
    assign cmp_30 = cmp_32_vage < cmp_10_vage;
    assign cmp_74 = cmp_76_vage < cmp_54_vage;
    assign cmp_70 = cmp_74_vage < cmp_30_vage;
    assign cmp_10_vage = cmp_10 ? {~entry_ready[1], entry1_age} : {~entry_ready[0], entry0_age};
    assign cmp_32_vage = cmp_32 ? {~entry_ready[3], entry3_age} : {~entry_ready[2], entry2_age};
    assign cmp_54_vage = cmp_54 ? {~entry_ready[5], entry5_age} : {~entry_ready[4], entry4_age};
    assign cmp_76_vage = cmp_76 ? {~entry_ready[7], entry7_age} : {~entry_ready[6], entry6_age};
    assign cmp_30_vage = cmp_30 ? cmp_32_vage : cmp_10_vage;
    assign cmp_74_vage = cmp_74 ? cmp_76_vage : cmp_54_vage;
    assign cmp_70_vage = cmp_70 ? cmp_74_vage : cmp_30_vage;
    assign cmp_10_vld = cmp_10 ? 2'b10 : 2'b01;
    assign cmp_32_vld = cmp_32 ? 2'b10 : 2'b01;
    assign cmp_54_vld = cmp_54 ? 2'b10 : 2'b01;
    assign cmp_76_vld = cmp_76 ? 2'b10 : 2'b01;
    assign cmp_30_vld = cmp_30 ? {cmp_32_vld, 2'b00}   : {2'b00, cmp_10_vld};
    assign cmp_74_vld = cmp_74 ? {cmp_76_vld, 2'b00}   : {2'b00, cmp_54_vld};
    assign cmp_70_vld = cmp_70 ? {cmp_74_vld, 4'b0000} : {4'b0000, cmp_30_vld};

    assign aiq_vld   = ~cmp_70_vage[3];
    assign issue_age = cmp_70_vage[2:0];
    assign issue_vld = cmp_70_vld & {8{aiq_vld}};

    assign aiq_stall_ctrl = (num == 8);

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            num <= 0;
        else if (rtu_global_flush)
            num <= 0;
        else if (create_entry_vld & aiq_vld)
            num <= num;
        else if (create_entry_vld)
            num <= num + 1;
        else if (aiq_vld)
            num <= num - 1;
        else
            num <= num;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry0_age <= 0;
        else if (rtu_global_flush)
            entry0_age <= 0;
        else if (create_vld[0])
            entry0_age <= num[2:0];
        else if (issue_vld[0])
            entry0_age <= 0;
        else if (aiq_vld)
            entry0_age <= (entry0_age > issue_age) ? entry0_age-1 : entry0_age;
        else
            entry0_age <= entry0_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry1_age <= 0;
        else if (rtu_global_flush)
            entry1_age <= 0;
        else if (create_vld[1])
            entry1_age <= num[2:0];
        else if (issue_vld[1])
            entry1_age <= 0;
        else if (aiq_vld)
            entry1_age <= (entry1_age > issue_age) ? entry1_age-1 : entry1_age;
        else
            entry1_age <= entry1_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry2_age <= 0;
        else if (rtu_global_flush)
            entry2_age <= 0;
        else if (create_vld[2])
            entry2_age <= num[2:0];
        else if (issue_vld[2])
            entry2_age <= 0;
        else if (aiq_vld)
            entry2_age <= (entry2_age > issue_age) ? entry2_age-1 : entry2_age;
        else
            entry2_age <= entry2_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry3_age <= 0;
        else if (rtu_global_flush)
            entry3_age <= 0;
        else if (create_vld[3])
            entry3_age <= num[2:0];
        else if (issue_vld[3])
            entry3_age <= 0;
        else if (aiq_vld)
            entry3_age <= (entry3_age > issue_age) ? entry3_age-1 : entry3_age;
        else
            entry3_age <= entry3_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry4_age <= 0;
        else if (rtu_global_flush)
            entry4_age <= 0;
        else if (create_vld[4])
            entry4_age <= num[2:0];
        else if (issue_vld[4])
            entry4_age <= 0;
        else if (aiq_vld)
            entry4_age <= (entry4_age > issue_age) ? entry4_age-1 : entry4_age;
        else
            entry4_age <= entry4_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry5_age <= 0;
        else if (rtu_global_flush)
            entry5_age <= 0;
        else if (create_vld[5])
            entry5_age <= num[2:0];
        else if (issue_vld[5])
            entry5_age <= 0;
        else if (aiq_vld)
            entry5_age <= (entry5_age > issue_age) ? entry5_age-1 : entry5_age;
        else
            entry5_age <= entry5_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry6_age <= 0;
        else if (rtu_global_flush)
            entry6_age <= 0;
        else if (create_vld[6])
            entry6_age <= num[2:0];
        else if (issue_vld[6])
            entry6_age <= 0;
        else if (aiq_vld)
            entry6_age <= (entry6_age > issue_age) ? entry6_age-1 : entry6_age;
        else
            entry6_age <= entry6_age;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            entry7_age <= 0;
        else if (rtu_global_flush)
            entry7_age <= 0;
        else if (create_vld[7])
            entry7_age <= num[2:0];
        else if (issue_vld[7])
            entry7_age <= 0;
        else if (aiq_vld)
            entry7_age <= (entry7_age > issue_age) ? entry7_age-1 : entry7_age;
        else
            entry7_age <= entry7_age;
    end

    assign aiq_iid = (entry0_iid & {4{issue_vld[0]}})
                   | (entry1_iid & {4{issue_vld[1]}})
                   | (entry2_iid & {4{issue_vld[2]}})
                   | (entry3_iid & {4{issue_vld[3]}})
                   | (entry4_iid & {4{issue_vld[4]}})
                   | (entry5_iid & {4{issue_vld[5]}})
                   | (entry6_iid & {4{issue_vld[6]}})
                   | (entry7_iid & {4{issue_vld[7]}});
    assign aiq_opcode = (entry0_opcode & {7{issue_vld[0]}})
                      | (entry1_opcode & {7{issue_vld[1]}})
                      | (entry2_opcode & {7{issue_vld[2]}})
                      | (entry3_opcode & {7{issue_vld[3]}})
                      | (entry4_opcode & {7{issue_vld[4]}})
                      | (entry5_opcode & {7{issue_vld[5]}})
                      | (entry6_opcode & {7{issue_vld[6]}})
                      | (entry7_opcode & {7{issue_vld[7]}});
    assign aiq_funct7 = (entry0_funct7 & {7{issue_vld[0]}})
                      | (entry1_funct7 & {7{issue_vld[1]}})
                      | (entry2_funct7 & {7{issue_vld[2]}})
                      | (entry3_funct7 & {7{issue_vld[3]}})
                      | (entry4_funct7 & {7{issue_vld[4]}})
                      | (entry5_funct7 & {7{issue_vld[5]}})
                      | (entry6_funct7 & {7{issue_vld[6]}})
                      | (entry7_funct7 & {7{issue_vld[7]}});
    assign aiq_funct3 = (entry0_funct3 & {3{issue_vld[0]}})
                      | (entry1_funct3 & {3{issue_vld[1]}})
                      | (entry2_funct3 & {3{issue_vld[2]}})
                      | (entry3_funct3 & {3{issue_vld[3]}})
                      | (entry4_funct3 & {3{issue_vld[4]}})
                      | (entry5_funct3 & {3{issue_vld[5]}})
                      | (entry6_funct3 & {3{issue_vld[6]}})
                      | (entry7_funct3 & {3{issue_vld[7]}});
    assign aiq_pc = (entry0_pc & {64{issue_vld[0]}})
                  | (entry1_pc & {64{issue_vld[1]}})
                  | (entry2_pc & {64{issue_vld[2]}})
                  | (entry3_pc & {64{issue_vld[3]}})
                  | (entry4_pc & {64{issue_vld[4]}})
                  | (entry5_pc & {64{issue_vld[5]}})
                  | (entry6_pc & {64{issue_vld[6]}})
                  | (entry7_pc & {64{issue_vld[7]}});
    assign aiq_psrc1_vld = |(entry_psrc1_vld & issue_vld);
    assign aiq_psrc1 = (entry0_psrc1 & {6{issue_vld[0]}})
                     | (entry1_psrc1 & {6{issue_vld[1]}})
                     | (entry2_psrc1 & {6{issue_vld[2]}})
                     | (entry3_psrc1 & {6{issue_vld[3]}})
                     | (entry4_psrc1 & {6{issue_vld[4]}})
                     | (entry5_psrc1 & {6{issue_vld[5]}})
                     | (entry6_psrc1 & {6{issue_vld[6]}})
                     | (entry7_psrc1 & {6{issue_vld[7]}});
    assign aiq_psrc2_vld = |(entry_psrc2_vld & issue_vld);
    assign aiq_psrc2 = (entry0_psrc2 & {6{issue_vld[0]}})
                     | (entry1_psrc2 & {6{issue_vld[1]}})
                     | (entry2_psrc2 & {6{issue_vld[2]}})
                     | (entry3_psrc2 & {6{issue_vld[3]}})
                     | (entry4_psrc2 & {6{issue_vld[4]}})
                     | (entry5_psrc2 & {6{issue_vld[5]}})
                     | (entry6_psrc2 & {6{issue_vld[6]}})
                     | (entry7_psrc2 & {6{issue_vld[7]}});
    assign aiq_pdst_vld = |(entry_pdst_vld & issue_vld);
    assign aiq_pdst = (entry0_pdst & {6{issue_vld[0]}})
                    | (entry1_pdst & {6{issue_vld[1]}})
                    | (entry2_pdst & {6{issue_vld[2]}})
                    | (entry3_pdst & {6{issue_vld[3]}})
                    | (entry4_pdst & {6{issue_vld[4]}})
                    | (entry5_pdst & {6{issue_vld[5]}})
                    | (entry6_pdst & {6{issue_vld[6]}})
                    | (entry7_pdst & {6{issue_vld[7]}});
    assign aiq_imm_vld = |(entry_imm_vld & issue_vld);
    assign aiq_imm = (entry0_imm & {64{issue_vld[0]}})
                   | (entry1_imm & {64{issue_vld[1]}})
                   | (entry2_imm & {64{issue_vld[2]}})
                   | (entry3_imm & {64{issue_vld[3]}})
                   | (entry4_imm & {64{issue_vld[4]}})
                   | (entry5_imm & {64{issue_vld[5]}})
                   | (entry6_imm & {64{issue_vld[6]}})
                   | (entry7_imm & {64{issue_vld[7]}});
    assign idu_idu_is_alu_is_forward_vld  = aiq_vld & aiq_pdst_vld;
    assign idu_idu_is_alu_is_forward_preg = aiq_pdst;

    `ifdef DEBUG_IDU_IS_AIQ_PRINT
        always @(negedge clk)
        begin
            $display("IDU_AIQ: num = %d, issue_sel = %b, issue_vld = %b, create_sel = %b", num, cmp_70_vld, aiq_vld, create_vld);
            $display("         forward_vld: %b, forward_preg: %d", idu_idu_is_alu_is_forward_vld, idu_idu_is_alu_is_forward_preg);
            $display("|   | age | vld | ready | iid |        pc        |");
            $display("| 0 | %d   | %b   | %b     | %02d  | %x |", entry0_age, entry_vld[0], entry_ready[0], entry0_iid, entry0_pc);
            $display("| 1 | %d   | %b   | %b     | %02d  | %x |", entry1_age, entry_vld[1], entry_ready[1], entry1_iid, entry1_pc);
            $display("| 2 | %d   | %b   | %b     | %02d  | %x |", entry2_age, entry_vld[2], entry_ready[2], entry2_iid, entry2_pc);
            $display("| 3 | %d   | %b   | %b     | %02d  | %x |", entry3_age, entry_vld[3], entry_ready[3], entry3_iid, entry3_pc);
            $display("| 4 | %d   | %b   | %b     | %02d  | %x |", entry4_age, entry_vld[4], entry_ready[4], entry4_iid, entry4_pc);
            $display("| 5 | %d   | %b   | %b     | %02d  | %x |", entry5_age, entry_vld[5], entry_ready[5], entry5_iid, entry5_pc);
            $display("| 6 | %d   | %b   | %b     | %02d  | %x |", entry6_age, entry_vld[6], entry_ready[6], entry6_iid, entry6_pc);
            $display("| 7 | %d   | %b   | %b     | %02d  | %x |", entry7_age, entry_vld[7], entry_ready[7], entry7_iid, entry7_pc);
        end
    `endif
endmodule
