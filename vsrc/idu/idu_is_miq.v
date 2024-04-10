module idu_is_miq (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_is_stall_ctrl,
    exu_idu_is_div_stall_ctrl,
    idu_idu_is_vld,
    rtu_idu_is_iid,
    idu_idu_is_opcode,
    idu_idu_is_funct7,
    idu_idu_is_funct3,
    idu_idu_is_psrc1_vld,
    idu_idu_is_psrc1_ready,
    idu_idu_is_psrc1,
    idu_idu_is_psrc2_vld,
    idu_idu_is_psrc2_ready,
    idu_idu_is_psrc2,
    idu_idu_is_pdst_vld,
    rtu_idu_is_preg,
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
    miq_stall_ctrl,
    miq_vld,
    miq_iid,
    miq_opcode,
    miq_funct7,
    miq_funct3,
    miq_psrc1_vld,
    miq_psrc1,
    miq_psrc2_vld,
    miq_psrc2,
    miq_pdst_vld,
    miq_pdst
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_is_stall_ctrl;
    input         exu_idu_is_div_stall_ctrl;
    input         idu_idu_is_vld;
    input  [4 :0] rtu_idu_is_iid;
    input  [6 :0] idu_idu_is_opcode;
    input  [6 :0] idu_idu_is_funct7;
    input  [2 :0] idu_idu_is_funct3;
    input         idu_idu_is_psrc1_vld;
    input         idu_idu_is_psrc1_ready;
    input  [5 :0] idu_idu_is_psrc1;
    input         idu_idu_is_psrc2_vld;
    input         idu_idu_is_psrc2_ready;
    input  [5 :0] idu_idu_is_psrc2;
    input         idu_idu_is_pdst_vld;
    input  [5 :0] rtu_idu_is_preg;
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
    output        miq_stall_ctrl;
    output        miq_vld;
    output [4 :0] miq_iid;
    output [6 :0] miq_opcode;
    output [6 :0] miq_funct7;
    output [2 :0] miq_funct3;
    output        miq_psrc1_vld;
    output [5 :0] miq_psrc1;
    output        miq_psrc2_vld;
    output [5 :0] miq_psrc2;
    output        miq_pdst_vld;
    output [5 :0] miq_pdst;

    // &Regs;
    reg [2 :0] num;
    reg [1 :0] entry0_age;
    reg [1 :0] entry1_age;
    reg [1 :0] entry2_age;
    reg [1 :0] entry3_age;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_is_stall_ctrl;
    wire        exu_idu_is_div_stall_ctrl;
    wire        idu_idu_is_vld;
    wire [4 :0] rtu_idu_is_iid;
    wire [6 :0] idu_idu_is_opcode;
    wire [6 :0] idu_idu_is_funct7;
    wire [2 :0] idu_idu_is_funct3;
    wire        idu_idu_is_psrc1_vld;
    wire        idu_idu_is_psrc1_ready;
    wire [5 :0] idu_idu_is_psrc1;
    wire        idu_idu_is_psrc2_vld;
    wire        idu_idu_is_psrc2_ready;
    wire [5 :0] idu_idu_is_psrc2;
    wire        idu_idu_is_pdst_vld;
    wire [5 :0] rtu_idu_is_preg;
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
    wire [3 :0] create_sel;
    wire [3 :0] create_vld;
    wire [3 :0] entry_vld;
    wire [3 :0] entry_ready;
    wire [3 :0] entry_issue_ready;
    wire        cmp_10;
    wire [1 :0] cmp_10_vld;
    wire [2 :0] cmp_10_vage;
    wire        cmp_32;
    wire [1 :0] cmp_32_vld;
    wire [2 :0] cmp_32_vage;
    wire        cmp_30;
    wire [3 :0] cmp_30_vld;
    wire [2 :0] cmp_30_vage;
    wire [3 :0] issue_vld;
    wire [1 :0] issue_age;
    wire        miq_stall_ctrl;
    wire        create_entry_vld;
    wire        miq_vld;
    wire [4 :0] miq_iid;
    wire [6 :0] miq_opcode;
    wire [6 :0] miq_funct7;
    wire [2 :0] miq_funct3;
    wire        miq_psrc1_vld;
    wire [5 :0] miq_psrc1;
    wire        miq_psrc2_vld;
    wire [5 :0] miq_psrc2;
    wire        miq_pdst_vld;
    wire [5 :0] miq_pdst;
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

    idu_is_miq_entry idu_is_miq0_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[0]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
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
        .psrc1_vld                      	( entry_psrc1_vld[0]              ),
        .psrc1                          	( entry0_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[0]              ),
        .psrc2                          	( entry0_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[0]               ),
        .pdst                           	( entry0_pdst                     ),
        .ready                          	( entry_ready[0]                  )
    );

    idu_is_miq_entry idu_is_miq1_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[1]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
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
        .psrc1_vld                      	( entry_psrc1_vld[1]              ),
        .psrc1                          	( entry1_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[1]              ),
        .psrc2                          	( entry1_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[1]               ),
        .pdst                           	( entry1_pdst                     ),
        .ready                          	( entry_ready[1]                  )
    );

    idu_is_miq_entry idu_is_miq2_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[2]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
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
        .psrc1_vld                      	( entry_psrc1_vld[2]              ),
        .psrc1                          	( entry2_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[2]              ),
        .psrc2                          	( entry2_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[2]               ),
        .pdst                           	( entry2_pdst                     ),
        .ready                          	( entry_ready[2]                  )
    );

    idu_is_miq_entry idu_is_miq3_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld[3]                   ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_funct7                  	( idu_idu_is_funct7               ),
        .create_funct3                  	( idu_idu_is_funct3               ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_psrc2_vld               	( idu_idu_is_psrc2_vld            ),
        .create_psrc2_ready             	( idu_idu_is_psrc2_ready          ),
        .create_psrc2                   	( idu_idu_is_psrc2                ),
        .create_pdst_vld                	( idu_idu_is_pdst_vld             ),
        .create_pdst                    	( rtu_idu_is_preg                 ),
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
        .psrc1_vld                      	( entry_psrc1_vld[3]              ),
        .psrc1                          	( entry3_psrc1                    ),
        .psrc2_vld                      	( entry_psrc2_vld[3]              ),
        .psrc2                          	( entry3_psrc2                    ),
        .pdst_vld                       	( entry_pdst_vld[3]               ),
        .pdst                           	( entry3_pdst                     ),
        .ready                          	( entry_ready[3]                  )
    );

    assign create_entry_vld = idu_idu_is_vld & ~miq_stall_ctrl & idu_idu_is_pipe[3] & ~y_idu_is_stall_ctrl;

    // create_entry sel
    assign create_sel[0] = !entry_vld[0];
    assign create_sel[1] = !entry_vld[1] && entry_vld[0];
    assign create_sel[2] = !entry_vld[2] && (&entry_vld[1:0]);
    assign create_sel[3] = !entry_vld[3] && (&entry_vld[2:0]);
    assign create_vld    = create_sel & {4{create_entry_vld}};

    // issue_entry_sel
    assign entry_issue_ready[0] = entry_ready[0] & ((entry0_funct3[2] & ~exu_idu_is_div_stall_ctrl) | ~entry0_funct3[2]);
    assign entry_issue_ready[1] = entry_ready[1] & ((entry1_funct3[2] & ~exu_idu_is_div_stall_ctrl) | ~entry1_funct3[2]);
    assign entry_issue_ready[2] = entry_ready[2] & ((entry2_funct3[2] & ~exu_idu_is_div_stall_ctrl) | ~entry2_funct3[2]);
    assign entry_issue_ready[3] = entry_ready[3] & ((entry3_funct3[2] & ~exu_idu_is_div_stall_ctrl) | ~entry3_funct3[2]);
    assign cmp_10 = {~entry_issue_ready[1], entry1_age} < {~entry_issue_ready[0], entry0_age};
    assign cmp_32 = {~entry_issue_ready[3], entry3_age} < {~entry_issue_ready[2], entry2_age};
    assign cmp_30 = cmp_32_vage < cmp_10_vage;
    assign cmp_10_vage = cmp_10 ? {~entry_issue_ready[1], entry1_age} : {~entry_issue_ready[0], entry0_age};
    assign cmp_32_vage = cmp_32 ? {~entry_issue_ready[3], entry3_age} : {~entry_issue_ready[2], entry2_age};
    assign cmp_30_vage = cmp_30 ? cmp_32_vage : cmp_10_vage;
    assign cmp_10_vld = cmp_10 ? 2'b10 : 2'b01;
    assign cmp_32_vld = cmp_32 ? 2'b10 : 2'b01;
    assign cmp_30_vld = cmp_30 ? {cmp_32_vld, 2'b00}   : {2'b00, cmp_10_vld};

    assign miq_vld   = ~cmp_30_vage[2];
    assign issue_age = cmp_30_vage[1:0];
    assign issue_vld = cmp_30_vld & {4{miq_vld}};

    assign miq_stall_ctrl = (num == 4);

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            num <= 0;
        else if (rtu_global_flush)
            num <= 0;
        else if (create_entry_vld & miq_vld)
            num <= num;
        else if (create_entry_vld)
            num <= num + 1;
        else if (miq_vld)
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
            entry0_age <= num[1:0];
        else if (issue_vld[0])
            entry0_age <= 0;
        else if (miq_vld)
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
            entry1_age <= num[1:0];
        else if (issue_vld[1])
            entry1_age <= 0;
        else if (miq_vld)
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
            entry2_age <= num[1:0];
        else if (issue_vld[2])
            entry2_age <= 0;
        else if (miq_vld)
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
            entry3_age <= num[1:0];
        else if (issue_vld[3])
            entry3_age <= 0;
        else if (miq_vld)
            entry3_age <= (entry3_age > issue_age) ? entry3_age-1 : entry3_age;
        else
            entry3_age <= entry3_age;
    end

    assign miq_iid = (entry0_iid & {5{issue_vld[0]}})
                   | (entry1_iid & {5{issue_vld[1]}})
                   | (entry2_iid & {5{issue_vld[2]}})
                   | (entry3_iid & {5{issue_vld[3]}});
    assign miq_opcode = (entry0_opcode & {7{issue_vld[0]}})
                      | (entry1_opcode & {7{issue_vld[1]}})
                      | (entry2_opcode & {7{issue_vld[2]}})
                      | (entry3_opcode & {7{issue_vld[3]}});
    assign miq_funct7 = (entry0_funct7 & {7{issue_vld[0]}})
                      | (entry1_funct7 & {7{issue_vld[1]}})
                      | (entry2_funct7 & {7{issue_vld[2]}})
                      | (entry3_funct7 & {7{issue_vld[3]}});
    assign miq_funct3 = (entry0_funct3 & {3{issue_vld[0]}})
                      | (entry1_funct3 & {3{issue_vld[1]}})
                      | (entry2_funct3 & {3{issue_vld[2]}})
                      | (entry3_funct3 & {3{issue_vld[3]}});
    assign miq_psrc1_vld = |(entry_psrc1_vld & issue_vld);
    assign miq_psrc1 = (entry0_psrc1 & {6{issue_vld[0]}})
                     | (entry1_psrc1 & {6{issue_vld[1]}})
                     | (entry2_psrc1 & {6{issue_vld[2]}})
                     | (entry3_psrc1 & {6{issue_vld[3]}});
    assign miq_psrc2_vld = |(entry_psrc2_vld & issue_vld);
    assign miq_psrc2 = (entry0_psrc2 & {6{issue_vld[0]}})
                     | (entry1_psrc2 & {6{issue_vld[1]}})
                     | (entry2_psrc2 & {6{issue_vld[2]}})
                     | (entry3_psrc2 & {6{issue_vld[3]}});
    assign miq_pdst_vld = |(entry_pdst_vld & issue_vld);
    assign miq_pdst = (entry0_pdst & {6{issue_vld[0]}})
                    | (entry1_pdst & {6{issue_vld[1]}})
                    | (entry2_pdst & {6{issue_vld[2]}})
                    | (entry3_pdst & {6{issue_vld[3]}});

    `ifdef DEBUG_IDU_IS_MIQ_PRINT
        always @(negedge clk)
        begin
            $display("IDU_MIQ: num = %d, issue_sel = %b, issue_vld = %b, create_sel = %b", num, cmp_30_vld, miq_vld, create_vld);
            $display("         %d, %d", miq_psrc1, miq_psrc2);
            $display("|   | age | vld | ready | iid |");
            $display("| 0 | %d   | %b   | %b     | %02d  |", entry0_age, entry_vld[0], entry_issue_ready[0], entry0_iid);
            $display("| 1 | %d   | %b   | %b     | %02d  |", entry1_age, entry_vld[1], entry_issue_ready[1], entry1_iid);
            $display("| 2 | %d   | %b   | %b     | %02d  |", entry2_age, entry_vld[2], entry_issue_ready[2], entry2_iid);
            $display("| 3 | %d   | %b   | %b     | %02d  |", entry3_age, entry_vld[3], entry_issue_ready[3], entry3_iid);
        end
    `endif
endmodule
