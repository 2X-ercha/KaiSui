module idu_is_lsiq (
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
    x_lsiq_vld,
    x_lsiq_iid,
    lsiq_stall_ctrl,
    lsiq_vld,
    lsiq_iid,
    lsiq_opcode,
    lsiq_funct7,
    lsiq_funct3,
    lsiq_pc,
    lsiq_psrc1_vld,
    lsiq_psrc1,
    lsiq_psrc2_vld,
    lsiq_psrc2,
    lsiq_pdst_vld,
    lsiq_pdst,
    lsiq_imm_vld,
    lsiq_imm
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_is_stall_ctrl;
    input         idu_idu_is_vld;
    input  [4 :0] rtu_idu_is_iid;
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
    input         x_lsiq_vld;
    input  [4 :0] x_lsiq_iid;
    output        lsiq_stall_ctrl;
    output        lsiq_vld;
    output [4 :0] lsiq_iid;
    output [6 :0] lsiq_opcode;
    output [6 :0] lsiq_funct7;
    output [2 :0] lsiq_funct3;
    output [63:0] lsiq_pc;
    output        lsiq_psrc1_vld;
    output [5 :0] lsiq_psrc1;
    output        lsiq_psrc2_vld;
    output [5 :0] lsiq_psrc2;
    output        lsiq_pdst_vld;
    output [5 :0] lsiq_pdst;
    output        lsiq_imm_vld;
    output [63:0] lsiq_imm;

    // &Regs;
    reg [3 :0] num;
    reg [2 :0] head_lsiq_ptr;
    reg [2 :0] tail_lsiq_ptr;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_is_stall_ctrl;
    wire        idu_idu_is_vld;
    wire [4 :0] rtu_idu_is_iid;
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
    wire        x_lsiq_vld;
    wire [4 :0] x_lsiq_iid;
    wire [7 :0] create_vld;
    wire [7 :0] entry_vld;
    wire [7 :0] entry_ready;
    wire [7 :0] issue_sel;
    wire [4 :0] issue_sel_iid;
    wire        issue_ls_age_legal;
    wire [7 :0] issue_vld;
    wire        lsiq_stall_ctrl;
    wire        create_entry_vld;
    wire        lsiq_vld;
    wire [4 :0] lsiq_iid;
    wire [6 :0] lsiq_opcode;
    wire [6 :0] lsiq_funct7;
    wire [2 :0] lsiq_funct3;
    wire [63:0] lsiq_pc;
    wire        lsiq_psrc1_vld;
    wire [5 :0] lsiq_psrc1;
    wire        lsiq_psrc2_vld;
    wire [5 :0] lsiq_psrc2;
    wire        lsiq_pdst_vld;
    wire [5 :0] lsiq_pdst;
    wire        lsiq_imm_vld;
    wire [63:0] lsiq_imm;
    wire [4 :0] entry0_iid;
    wire [4 :0] entry1_iid;
    wire [4 :0] entry2_iid;
    wire [4 :0] entry3_iid;
    wire [4 :0] entry4_iid;
    wire [4 :0] entry5_iid;
    wire [4 :0] entry6_iid;
    wire [4 :0] entry7_iid;
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

    idu_is_lsiq_entry idu_is_lsiq0_entry(
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

    idu_is_lsiq_entry idu_is_lsiq1_entry(
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

    idu_is_lsiq_entry idu_is_lsiq2_entry(
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

    idu_is_lsiq_entry idu_is_lsiq3_entry(
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

    idu_is_lsiq_entry idu_is_lsiq4_entry(
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

    idu_is_lsiq_entry idu_is_lsiq5_entry(
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

    idu_is_lsiq_entry idu_is_lsiq6_entry(
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

    idu_is_lsiq_entry idu_is_lsiq7_entry(
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

    // create
    assign create_vld[0] = (tail_lsiq_ptr == 3'd0) & create_entry_vld;
    assign create_vld[1] = (tail_lsiq_ptr == 3'd1) & create_entry_vld;
    assign create_vld[2] = (tail_lsiq_ptr == 3'd2) & create_entry_vld;
    assign create_vld[3] = (tail_lsiq_ptr == 3'd3) & create_entry_vld;
    assign create_vld[4] = (tail_lsiq_ptr == 3'd4) & create_entry_vld;
    assign create_vld[5] = (tail_lsiq_ptr == 3'd5) & create_entry_vld;
    assign create_vld[6] = (tail_lsiq_ptr == 3'd6) & create_entry_vld;
    assign create_vld[7] = (tail_lsiq_ptr == 3'd7) & create_entry_vld;

    // issue
    assign issue_sel[0] = (head_lsiq_ptr == 3'd0) & entry_ready[0];
    assign issue_sel[1] = (head_lsiq_ptr == 3'd1) & entry_ready[1];
    assign issue_sel[2] = (head_lsiq_ptr == 3'd2) & entry_ready[2];
    assign issue_sel[3] = (head_lsiq_ptr == 3'd3) & entry_ready[3];
    assign issue_sel[4] = (head_lsiq_ptr == 3'd4) & entry_ready[4];
    assign issue_sel[5] = (head_lsiq_ptr == 3'd5) & entry_ready[5];
    assign issue_sel[6] = (head_lsiq_ptr == 3'd6) & entry_ready[6];
    assign issue_sel[7] = (head_lsiq_ptr == 3'd7) & entry_ready[7];

    assign issue_sel_iid = (entry0_iid & {5{issue_sel[0]}})
                         | (entry1_iid & {5{issue_sel[1]}})
                         | (entry2_iid & {5{issue_sel[2]}})
                         | (entry3_iid & {5{issue_sel[3]}})
                         | (entry4_iid & {5{issue_sel[4]}})
                         | (entry5_iid & {5{issue_sel[5]}})
                         | (entry6_iid & {5{issue_sel[6]}})
                         | (entry7_iid & {5{issue_sel[7]}});
    assign issue_ls_age_legal = (((x_lsiq_iid - issue_sel_iid) < 16) & x_lsiq_vld) | ~x_lsiq_vld;

    assign issue_vld = issue_sel & {8{issue_ls_age_legal}};

    assign lsiq_stall_ctrl = (num == 8);
    assign lsiq_vld = |issue_vld;
    assign create_entry_vld = idu_idu_is_vld & ~lsiq_stall_ctrl & idu_idu_is_pipe[1] & ~y_idu_is_stall_ctrl;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            num <= 0;
        else if (rtu_global_flush)
            num <= 0;
        else if (create_entry_vld & lsiq_vld)
            num <= num;
        else if (create_entry_vld)
            num <= num + 1;
        else if (lsiq_vld)
            num <= num - 1;
        else
            num <= num;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            head_lsiq_ptr <= 0;
        else if (rtu_global_flush)
            head_lsiq_ptr <= 0;
        else if (lsiq_vld)
            head_lsiq_ptr <= head_lsiq_ptr + 1;
        else
            head_lsiq_ptr <= head_lsiq_ptr;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            tail_lsiq_ptr <= 0;
        else if (rtu_global_flush)
            tail_lsiq_ptr <= 0;
        else if (create_entry_vld)
            tail_lsiq_ptr <= tail_lsiq_ptr + 1;
        else
            tail_lsiq_ptr <= tail_lsiq_ptr;
    end

    assign lsiq_iid = (entry0_iid & {5{issue_vld[0]}})
                    | (entry1_iid & {5{issue_vld[1]}})
                    | (entry2_iid & {5{issue_vld[2]}})
                    | (entry3_iid & {5{issue_vld[3]}})
                    | (entry4_iid & {5{issue_vld[4]}})
                    | (entry5_iid & {5{issue_vld[5]}})
                    | (entry6_iid & {5{issue_vld[6]}})
                    | (entry7_iid & {5{issue_vld[7]}});
    assign lsiq_opcode = (entry0_opcode & {7{issue_vld[0]}})
                      | (entry1_opcode & {7{issue_vld[1]}})
                      | (entry2_opcode & {7{issue_vld[2]}})
                      | (entry3_opcode & {7{issue_vld[3]}})
                      | (entry4_opcode & {7{issue_vld[4]}})
                      | (entry5_opcode & {7{issue_vld[5]}})
                      | (entry6_opcode & {7{issue_vld[6]}})
                      | (entry7_opcode & {7{issue_vld[7]}});
    assign lsiq_funct7 = (entry0_funct7 & {7{issue_vld[0]}})
                      | (entry1_funct7 & {7{issue_vld[1]}})
                      | (entry2_funct7 & {7{issue_vld[2]}})
                      | (entry3_funct7 & {7{issue_vld[3]}})
                      | (entry4_funct7 & {7{issue_vld[4]}})
                      | (entry5_funct7 & {7{issue_vld[5]}})
                      | (entry6_funct7 & {7{issue_vld[6]}})
                      | (entry7_funct7 & {7{issue_vld[7]}});
    assign lsiq_funct3 = (entry0_funct3 & {3{issue_vld[0]}})
                      | (entry1_funct3 & {3{issue_vld[1]}})
                      | (entry2_funct3 & {3{issue_vld[2]}})
                      | (entry3_funct3 & {3{issue_vld[3]}})
                      | (entry4_funct3 & {3{issue_vld[4]}})
                      | (entry5_funct3 & {3{issue_vld[5]}})
                      | (entry6_funct3 & {3{issue_vld[6]}})
                      | (entry7_funct3 & {3{issue_vld[7]}});
    assign lsiq_pc = (entry0_pc & {64{issue_vld[0]}})
                  | (entry1_pc & {64{issue_vld[1]}})
                  | (entry2_pc & {64{issue_vld[2]}})
                  | (entry3_pc & {64{issue_vld[3]}})
                  | (entry4_pc & {64{issue_vld[4]}})
                  | (entry5_pc & {64{issue_vld[5]}})
                  | (entry6_pc & {64{issue_vld[6]}})
                  | (entry7_pc & {64{issue_vld[7]}});
    assign lsiq_psrc1_vld = |(entry_psrc1_vld & issue_vld);
    assign lsiq_psrc1 = (entry0_psrc1 & {6{issue_vld[0]}})
                     | (entry1_psrc1 & {6{issue_vld[1]}})
                     | (entry2_psrc1 & {6{issue_vld[2]}})
                     | (entry3_psrc1 & {6{issue_vld[3]}})
                     | (entry4_psrc1 & {6{issue_vld[4]}})
                     | (entry5_psrc1 & {6{issue_vld[5]}})
                     | (entry6_psrc1 & {6{issue_vld[6]}})
                     | (entry7_psrc1 & {6{issue_vld[7]}});
    assign lsiq_psrc2_vld = |(entry_psrc2_vld & issue_vld);
    assign lsiq_psrc2 = (entry0_psrc2 & {6{issue_vld[0]}})
                     | (entry1_psrc2 & {6{issue_vld[1]}})
                     | (entry2_psrc2 & {6{issue_vld[2]}})
                     | (entry3_psrc2 & {6{issue_vld[3]}})
                     | (entry4_psrc2 & {6{issue_vld[4]}})
                     | (entry5_psrc2 & {6{issue_vld[5]}})
                     | (entry6_psrc2 & {6{issue_vld[6]}})
                     | (entry7_psrc2 & {6{issue_vld[7]}});
    assign lsiq_pdst_vld = |(entry_pdst_vld & issue_vld);
    assign lsiq_pdst = (entry0_pdst & {6{issue_vld[0]}})
                    | (entry1_pdst & {6{issue_vld[1]}})
                    | (entry2_pdst & {6{issue_vld[2]}})
                    | (entry3_pdst & {6{issue_vld[3]}})
                    | (entry4_pdst & {6{issue_vld[4]}})
                    | (entry5_pdst & {6{issue_vld[5]}})
                    | (entry6_pdst & {6{issue_vld[6]}})
                    | (entry7_pdst & {6{issue_vld[7]}});
    assign lsiq_imm_vld = |(entry_imm_vld & issue_vld);
    assign lsiq_imm = (entry0_imm & {64{issue_vld[0]}})
                   | (entry1_imm & {64{issue_vld[1]}})
                   | (entry2_imm & {64{issue_vld[2]}})
                   | (entry3_imm & {64{issue_vld[3]}})
                   | (entry4_imm & {64{issue_vld[4]}})
                   | (entry5_imm & {64{issue_vld[5]}})
                   | (entry6_imm & {64{issue_vld[6]}})
                   | (entry7_imm & {64{issue_vld[7]}});

    `ifdef DEBUG_IDU_IS_LSIQ_PRINT
        always @(negedge clk)
        begin
            $display("IDU_LSQ: num = %d, issue_vld = %b, create_sel = %b", num, lsiq_vld, create_vld);
            $display("|   | vld | ready | iid |        pc        |");
            $display("| 0 | %b   | %b     | %02d  | %x |", entry_vld[0], entry_ready[0], entry0_iid, entry0_pc);
            $display("| 1 | %b   | %b     | %02d  | %x |", entry_vld[1], entry_ready[1], entry1_iid, entry1_pc);
            $display("| 2 | %b   | %b     | %02d  | %x |", entry_vld[2], entry_ready[2], entry2_iid, entry2_pc);
            $display("| 3 | %b   | %b     | %02d  | %x |", entry_vld[3], entry_ready[3], entry3_iid, entry3_pc);
            $display("| 4 | %b   | %b     | %02d  | %x |", entry_vld[4], entry_ready[4], entry4_iid, entry4_pc);
            $display("| 5 | %b   | %b     | %02d  | %x |", entry_vld[5], entry_ready[5], entry5_iid, entry5_pc);
            $display("| 6 | %b   | %b     | %02d  | %x |", entry_vld[6], entry_ready[6], entry6_iid, entry6_pc);
            $display("| 7 | %b   | %b     | %02d  | %x |", entry_vld[7], entry_ready[7], entry7_iid, entry7_pc);
        end
    `endif

endmodule
