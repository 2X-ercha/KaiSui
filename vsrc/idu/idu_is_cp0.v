module idu_is_cp0 (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_is_stall_ctrl,
    idu_idu_is_vld,
    rtu_idu_is_iid,
    idu_idu_is_opcode,
    idu_idu_is_psrc1_vld,
    idu_idu_is_psrc1_ready,
    idu_idu_is_psrc1,
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
    cp0_stall_ctrl,
    cp0_vld,
    cp0_iid,
    cp0_opcode,
    cp0_psrc1_vld,
    cp0_psrc1,
    cp0_imm_vld,
    cp0_imm
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_is_stall_ctrl;
    input         idu_idu_is_vld;
    input  [4 :0] rtu_idu_is_iid;
    input  [6 :0] idu_idu_is_opcode;
    input         idu_idu_is_psrc1_vld;
    input         idu_idu_is_psrc1_ready;
    input  [5 :0] idu_idu_is_psrc1;
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
    output        cp0_stall_ctrl;
    output        cp0_vld;
    output [4 :0] cp0_iid;
    output [6 :0] cp0_opcode;
    output        cp0_psrc1_vld;
    output [5 :0] cp0_psrc1;
    output        cp0_imm_vld;
    output [63:0] cp0_imm;

    // &Regs

    // &Wires
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_is_stall_ctrl;
    wire        idu_idu_is_vld;
    wire [4 :0] rtu_idu_is_iid;
    wire [6 :0] idu_idu_is_opcode;
    wire        idu_idu_is_psrc1_vld;
    wire        idu_idu_is_psrc1_ready;
    wire [5 :0] idu_idu_is_psrc1;
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
    wire        cp0_stall_ctrl;
    wire        cp0_vld;
    wire [4 :0] cp0_iid;
    wire [6 :0] cp0_opcode;
    wire        cp0_psrc1_vld;
    wire [5 :0] cp0_psrc1;
    wire        cp0_imm_vld;
    wire [63:0] cp0_imm;
    wire        create_vld;
    wire        issue_vld;
    wire        entry_vld;
    wire [4 :0] entry_iid;
    wire [6 :0] entry_opcode;
    wire        entry_psrc1_vld;
    wire [5 :0] entry_psrc1;
    wire        entry_imm_vld;
    wire [63:0] entry_imm;
    wire        entry_ready;
    wire        create_entry_vld;

    idu_is_cp0_entry idu_is_cp0_entry(
        .clk                            	( clk                             ),
        .rst_clk                        	( rst_clk                         ),
        .rtu_global_flush               	( rtu_global_flush                ),
        .create_vld                     	( create_vld                      ),
        .create_iid                     	( rtu_idu_is_iid                  ),
        .create_opcode                  	( idu_idu_is_opcode               ),
        .create_psrc1_vld               	( idu_idu_is_psrc1_vld            ),
        .create_psrc1_ready             	( idu_idu_is_psrc1_ready          ),
        .create_psrc1                   	( idu_idu_is_psrc1                ),
        .create_imm_vld                 	( idu_idu_is_imm_vld              ),
        .create_imm                     	( idu_idu_is_imm                  ),
        .issue_vld                      	( issue_vld                       ),
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
        .vld                            	( entry_vld                       ),
        .iid                            	( entry_iid                       ),
        .opcode                         	( entry_opcode                    ),
        .psrc1_vld                      	( entry_psrc1_vld                 ),
        .psrc1                          	( entry_psrc1                     ),
        .imm_vld                        	( entry_imm_vld                   ),
        .imm                            	( entry_imm                       ),
        .ready                          	( entry_ready                     )
    );

    // create
    assign create_vld = create_entry_vld & ~entry_vld;

    // issue
    assign issue_vld = entry_ready;

    assign cp0_stall_ctrl = entry_vld;
    assign cp0_vld = issue_vld;
    assign create_entry_vld = idu_idu_is_vld & ~cp0_stall_ctrl & idu_idu_is_pipe[0] & ~y_idu_is_stall_ctrl;

    assign cp0_iid = entry_iid & {5{issue_vld}};
    assign cp0_opcode = entry_opcode & {7{issue_vld}};
    assign cp0_psrc1_vld = entry_psrc1_vld & issue_vld;
    assign cp0_psrc1 = entry_psrc1;
    assign cp0_imm_vld = entry_imm_vld & issue_vld;
    assign cp0_imm = entry_imm & {64{issue_vld}};

endmodule
