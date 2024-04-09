module idu_is_biq (
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
    biq_stall_ctrl,
    biq_vld,
    biq_iid,
    biq_opcode,
    biq_funct7,
    biq_funct3,
    biq_pc,
    biq_psrc1_vld,
    biq_psrc1,
    biq_psrc2_vld,
    biq_psrc2,
    biq_pdst_vld,
    biq_pdst,
    biq_imm_vld,
    biq_imm
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
    output        biq_stall_ctrl;
    output        biq_vld;
    output [4 :0] biq_iid;
    output [6 :0] biq_opcode;
    output [6 :0] biq_funct7;
    output [2 :0] biq_funct3;
    output [63:0] biq_pc;
    output        biq_psrc1_vld;
    output [5 :0] biq_psrc1;
    output        biq_psrc2_vld;
    output [5 :0] biq_psrc2;
    output        biq_pdst_vld;
    output [5 :0] biq_pdst;
    output        biq_imm_vld;
    output [63:0] biq_imm;

    // &Regs
    reg [2 :0] num;
    reg [1 :0] head_biq_ptr;
    reg [1 :0] tail_biq_ptr;

    // &Wires
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
    wire        biq_stall_ctrl;
    wire        biq_vld;
    wire [4 :0] biq_iid;
    wire [6 :0] biq_opcode;
    wire [6 :0] biq_funct7;
    wire [2 :0] biq_funct3;
    wire [63:0] biq_pc;
    wire        biq_psrc1_vld;
    wire [5 :0] biq_psrc1;
    wire        biq_psrc2_vld;
    wire [5 :0] biq_psrc2;
    wire        biq_pdst_vld;
    wire [5 :0] biq_pdst;
    wire        biq_imm_vld;
    wire [63:0] biq_imm;
    wire [4 :0] entry0_iid;
    wire [4 :0] entry1_iid;
    wire [4 :0] entry2_iid;
    wire [4 :0] entry3_iid;
    wire [6 :0] entry0_opcode;
    wire [6 :0] entry1_opcode;
    wire [6 :0] entry2_opcode;
    wire [6 :0] entry3_opcode;
    wire [6 :0] entry0_funct7;
    wire [6 :0] entry1_funct7;
    wire [6 :0] entry2_funct7;
    wire [6 :0] entry3_funct7;
    wire [2 :0] entry0_funct3;
    wire [2 :0] entry1_funct3;
    wire [2 :0] entry2_funct3;
    wire [2 :0] entry3_funct3;
    wire [63:0] entry0_pc;
    wire [63:0] entry1_pc;
    wire [63:0] entry2_pc;
    wire [63:0] entry3_pc;
    wire [3 :0] entry_psrc1_vld;
    wire [5 :0] entry0_psrc1;
    wire [5 :0] entry1_psrc1;
    wire [5 :0] entry2_psrc1;
    wire [5 :0] entry3_psrc1;
    wire [3 :0] entry_psrc2_vld;
    wire [5 :0] entry0_psrc2;
    wire [5 :0] entry1_psrc2;
    wire [5 :0] entry2_psrc2;
    wire [5 :0] entry3_psrc2;
    wire [3 :0] entry_pdst_vld;
    wire [5 :0] entry0_pdst;
    wire [5 :0] entry1_pdst;
    wire [5 :0] entry2_pdst;
    wire [5 :0] entry3_pdst;
    wire [3 :0] entry_imm_vld;
    wire [63:0] entry0_imm;
    wire [63:0] entry1_imm;
    wire [63:0] entry2_imm;
    wire [63:0] entry3_imm;
    wire [3 :0] create_vld;
    wire [3 :0] issue_vld;
    wire [3 :0] entry_vld;
    wire [3 :0] entry_ready;
    wire        create_entry_vld;

    idu_is_biq_entry idu_is_biq0_entry(
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

    idu_is_biq_entry idu_is_biq1_entry(
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

    idu_is_biq_entry idu_is_biq2_entry(
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

    idu_is_biq_entry idu_is_biq3_entry(
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

    // create
    assign create_vld[0] = (tail_biq_ptr == 2'd0) & create_entry_vld;
    assign create_vld[1] = (tail_biq_ptr == 2'd1) & create_entry_vld;
    assign create_vld[2] = (tail_biq_ptr == 2'd2) & create_entry_vld;
    assign create_vld[3] = (tail_biq_ptr == 2'd3) & create_entry_vld;

    // issue
    assign issue_vld[0] = (head_biq_ptr == 2'd0) & entry_ready[0];
    assign issue_vld[1] = (head_biq_ptr == 2'd1) & entry_ready[1];
    assign issue_vld[2] = (head_biq_ptr == 2'd2) & entry_ready[2];
    assign issue_vld[3] = (head_biq_ptr == 2'd3) & entry_ready[3];

    assign biq_stall_ctrl = (num == 4);
    assign biq_vld = |issue_vld;
    assign create_entry_vld = idu_idu_is_vld & ~biq_stall_ctrl & idu_idu_is_pipe[2] & ~y_idu_is_stall_ctrl;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            num <= 0;
        else if (rtu_global_flush)
            num <= 0;
        else if (create_entry_vld & biq_vld)
            num <= num;
        else if (create_entry_vld)
            num <= num + 1;
        else if (biq_vld)
            num <= num - 1;
        else
            num <= num;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            head_biq_ptr <= 0;
        else if (rtu_global_flush)
            head_biq_ptr <= 0;
        else if (biq_vld)
            head_biq_ptr <= head_biq_ptr + 1;
        else
            head_biq_ptr <= head_biq_ptr;
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            tail_biq_ptr <= 0;
        else if (rtu_global_flush)
            tail_biq_ptr <= 0;
        else if (create_entry_vld)
            tail_biq_ptr <= tail_biq_ptr + 1;
        else
            tail_biq_ptr <= tail_biq_ptr;
    end

    assign biq_iid = (entry0_iid & {5{issue_vld[0]}})
                   | (entry1_iid & {5{issue_vld[1]}})
                   | (entry2_iid & {5{issue_vld[2]}})
                   | (entry3_iid & {5{issue_vld[3]}});
    assign biq_opcode = (entry0_opcode & {7{issue_vld[0]}})
                      | (entry1_opcode & {7{issue_vld[1]}})
                      | (entry2_opcode & {7{issue_vld[2]}})
                      | (entry3_opcode & {7{issue_vld[3]}});
    assign biq_funct7 = (entry0_funct7 & {7{issue_vld[0]}})
                      | (entry1_funct7 & {7{issue_vld[1]}})
                      | (entry2_funct7 & {7{issue_vld[2]}})
                      | (entry3_funct7 & {7{issue_vld[3]}});
    assign biq_funct3 = (entry0_funct3 & {3{issue_vld[0]}})
                      | (entry1_funct3 & {3{issue_vld[1]}})
                      | (entry2_funct3 & {3{issue_vld[2]}})
                      | (entry3_funct3 & {3{issue_vld[3]}});
    assign biq_pc = (entry0_pc & {64{issue_vld[0]}})
                  | (entry1_pc & {64{issue_vld[1]}})
                  | (entry2_pc & {64{issue_vld[2]}})
                  | (entry3_pc & {64{issue_vld[3]}});
    assign biq_psrc1_vld = |(entry_psrc1_vld & issue_vld);
    assign biq_psrc1 = (entry0_psrc1 & {6{issue_vld[0]}})
                     | (entry1_psrc1 & {6{issue_vld[1]}})
                     | (entry2_psrc1 & {6{issue_vld[2]}})
                     | (entry3_psrc1 & {6{issue_vld[3]}});
    assign biq_psrc2_vld = |(entry_psrc2_vld & issue_vld);
    assign biq_psrc2 = (entry0_psrc2 & {6{issue_vld[0]}})
                     | (entry1_psrc2 & {6{issue_vld[1]}})
                     | (entry2_psrc2 & {6{issue_vld[2]}})
                     | (entry3_psrc2 & {6{issue_vld[3]}});
    assign biq_pdst_vld = |(entry_pdst_vld & issue_vld);
    assign biq_pdst = (entry0_pdst & {6{issue_vld[0]}})
                    | (entry1_pdst & {6{issue_vld[1]}})
                    | (entry2_pdst & {6{issue_vld[2]}})
                    | (entry3_pdst & {6{issue_vld[3]}});
    assign biq_imm_vld = |(entry_imm_vld & issue_vld);
    assign biq_imm = (entry0_imm & {64{issue_vld[0]}})
                   | (entry1_imm & {64{issue_vld[1]}})
                   | (entry2_imm & {64{issue_vld[2]}})
                   | (entry3_imm & {64{issue_vld[3]}});

    `ifdef DEBUG_IDU_IS_BIQ_PRINT
        always @(negedge clk)
        begin
            $display("IDU_BIQ: num = %d, head = %b, tail = %b", num, head_biq_ptr, tail_biq_ptr);
            $display("|   | vld | ready | iid |        pc        |");
            $display("| 0 | %b   | %b     | %02d  | %x |", entry_vld[0], entry_ready[0], entry0_iid, entry0_pc);
            $display("| 1 | %b   | %b     | %02d  | %x |", entry_vld[1], entry_ready[1], entry1_iid, entry1_pc);
            $display("| 2 | %b   | %b     | %02d  | %x |", entry_vld[2], entry_ready[2], entry2_iid, entry2_pc);
            $display("| 3 | %b   | %b     | %02d  | %x |", entry_vld[3], entry_ready[3], entry3_iid, entry3_pc);
        end
    `endif
endmodule
