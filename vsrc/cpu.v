`include "debug_config.v"
`include "const.v"
`include "dpidef.v"

`include "ifu/ifu_if.v"
`include "idu/idu_id.v"
`include "idu/idu_rf_pc.v"
`include "idu/idu_ir_rt.v"
`include "idu/idu_ir_rt_entry.v"
`include "rtu/rtu_rob.v"
`include "rtu/rtu_rob_entry.v"
`include "rtu/rtu_pst_preg.v"
`include "rtu/rtu_pst_preg_entry.v"

module cpu (
        clk,
        rst_clk,

        pc
    );

    // &Ports;
    input         clk;
    input         rst_clk;

    output [63:0] pc;

    // &Regs;
    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_front_pipeline_stall;
    wire        rob_idu_rf_pcjump_vld;
    wire        exu_idu_rf_bju_pcjump_vld;
    wire [63:0] exu_idu_rf_bju_pcjump_addr;
    wire [63:0] pc;
    wire        ifu_idu_id_inst_vld;
    wire [63:0] ifu_idu_id_inst_pc;
    wire [31:0] ifu_idu_id_inst;
    wire        idu_idu_ir_vld;
    wire [6 :0] idu_idu_ir_opcode;
    wire [6 :0] idu_idu_ir_funct7;
    wire [2 :0] idu_idu_ir_funct3;
    wire [63:0] idu_idu_ir_pc;
    wire        idu_idu_ir_src1_vld;
    wire [4 :0] idu_idu_ir_src1;
    wire        idu_idu_ir_src2_vld;
    wire [4 :0] idu_idu_ir_src2;
    wire        idu_idu_ir_dst_vld;
    wire [4 :0] idu_idu_ir_dst;
    wire        idu_idu_ir_imm_vld;
    wire [63:0] idu_idu_ir_imm;
    wire [5 :0] idu_idu_ir_type;
    wire [4 :0] idu_idu_ir_pipe;
    wire        idu_idu_ir_ras;
    wire        idu_idu_is_vld;
    wire [6 :0] idu_idu_is_opcode;
    wire [6 :0] idu_idu_is_funct7;
    wire [2 :0] idu_idu_is_funct3;
    wire [63:0] idu_idu_is_pc;
    wire        idu_idu_is_imm_vld;
    wire [63:0] idu_idu_is_imm;
    wire [5 :0] idu_idu_is_type;
    wire [4 :0] idu_idu_is_pipe;
    wire        idu_idu_is_ras;
    wire        idu_idu_is_psrc1_vld;
    wire        idu_idu_is_psrc1_ready;
    wire [5 :0] idu_idu_is_psrc1;
    wire        idu_idu_is_psrc2_vld;
    wire        idu_idu_is_psrc2_ready;
    wire [5 :0] idu_idu_is_psrc2;
    wire        idu_idu_is_pdst_vld;
    wire        idu_rtu_rob_iid_req_vld;
    wire        idu_rtu_pst_pdst_req_vld;
    wire        idu_rtu_rob_create_vld;
    wire [6 :0] idu_rtu_rob_create_opcode;
    wire [2 :0] idu_rtu_rob_create_funct3;
    wire [63:0] idu_rtu_rob_create_pc;
    wire [4 :0] idu_rtu_rob_create_src1;
    wire        idu_rtu_rob_create_src1_vld;
    wire [5 :0] idu_rtu_rob_create_psrc1;
    wire [4 :0] idu_rtu_rob_create_src2;
    wire        idu_rtu_rob_create_src2_vld;
    wire [5 :0] idu_rtu_rob_create_psrc2;
    wire [4 :0] idu_rtu_rob_create_dst;
    wire        idu_rtu_rob_create_dst_vld;
    wire [5 :0] idu_rtu_rob_create_pdst;
    wire [63:0] idu_rtu_rob_create_imm;
    wire        idu_rtu_rob_create_imm_vld;
    wire [5 :0] idu_rtu_rob_create_type;
    wire [4 :0] idu_rtu_rob_create_pipe;
    wire        idu_rtu_rob_create_ras;
    wire        idu_rtu_rob_alu_issue_vld;
    wire [3 :0] idu_rtu_rob_alu_issue_iid;
    wire        idu_rtu_rob_mxu_issue_vld;
    wire [3 :0] idu_rtu_rob_mxu_issue_iid;
    wire        idu_rtu_rob_bju_issue_vld;
    wire [3 :0] idu_rtu_rob_bju_issue_iid;
    wire        idu_rtu_rob_lsu_issue_vld;
    wire [3 :0] idu_rtu_rob_lsu_issue_iid;
    wire        idu_rtu_rob_cp0_issue_vld;
    wire [3 :0] idu_rtu_rob_cp0_issue_iid;
    wire        exu_rtu_rob_alu_complete_vld;
    wire [3 :0] exu_rtu_rob_alu_complete_iid;
    wire        exu_rtu_rob_mxu_complete_vld;
    wire [3 :0] exu_rtu_rob_mxu_complete_iid;
    wire        exu_rtu_rob_bju_complete_vld;
    wire [3 :0] exu_rtu_rob_bju_complete_iid;
    wire        exu_rtu_rob_lsu_complete_vld;
    wire [3 :0] exu_rtu_rob_lsu_complete_iid;
    wire        exu_rtu_rob_cp0_complete_vld;
    wire [3 :0] exu_rtu_rob_cp0_complete_iid;
    wire        exu_idu_ir_alu_complete_vld;
    wire [5 :0] exu_idu_ir_alu_complete_preg;
    wire        exu_idu_ir_mxu_complete_vld;
    wire [5 :0] exu_idu_ir_mxu_complete_preg;
    wire        exu_idu_ir_bju_complete_vld;
    wire [5 :0] exu_idu_ir_bju_complete_preg;
    wire        exu_idu_ir_lsu_complete_vld;
    wire [5 :0] exu_idu_ir_lsu_complete_preg;
    wire        exu_rtu_rob_bju_pcjump_vld;
    wire [3 :0] exu_rtu_rob_bju_pcjump_iid;
    wire [63:0] ebreak_gpr10;
    wire        x_retire_vld;
    wire [3 :0] x_inst_retire_iid;
    wire        rtu_idu_is_iid_vld;
    wire [3 :0] rtu_idu_is_iid;
    wire        idu_rtu_pst_create_vld;
    wire [5 :0] idu_rtu_pst_create_preg_index;
    wire [3 :0] idu_rtu_pst_create_iid;
    wire [4 :0] idu_rtu_pst_create_gpr_index;
    wire [5 :0] idu_rtu_pst_create_gpr_pre_preg_index;
    wire [63:0] idu_rtu_pst_wb_vld;
    wire        rtu_idu_is_preg_vld;
    wire [5 :0] rtu_idu_is_preg;
    wire [191:0] rtu_idu_ir_recover_table;

    // ifu modules
    ifu_if ifu_if(
        .clk              	( clk                     ),
        .rst_clk          	( rst_clk                 ),
        .rtu_global_flush 	( rtu_global_flush        ),
        .y_stall_ctrl     	( y_front_pipeline_stall  ),
        .idu_ifu_if_pc    	( pc                      ),
        .inst_vld         	( ifu_idu_id_inst_vld     ),
        .inst_pc          	( ifu_idu_id_inst_pc      ),
        .inst             	( ifu_idu_id_inst         )
    );

    // idu modules
    idu_id u_idu_id(
        .clk                 	( clk                       ),
        .rst_clk             	( rst_clk                   ),
        .rtu_global_flush    	( rtu_global_flush          ),
        .y_idu_id_stall_ctrl 	( y_front_pipeline_stall    ),
        .ifu_idu_id_inst_vld 	( ifu_idu_id_inst_vld       ),
        .ifu_idu_id_inst_pc  	( ifu_idu_id_inst_pc        ),
        .ifu_idu_id_inst     	( ifu_idu_id_inst           ),
        .decode_vld          	( idu_idu_ir_vld            ),
        .decode_opcode       	( idu_idu_ir_opcode         ),
        .decode_funct7       	( idu_idu_ir_funct7         ),
        .decode_funct3       	( idu_idu_ir_funct3         ),
        .decode_pc           	( idu_idu_ir_pc             ),
        .decode_src1_vld     	( idu_idu_ir_src1_vld       ),
        .decode_src1         	( idu_idu_ir_src1           ),
        .decode_src2_vld     	( idu_idu_ir_src2_vld       ),
        .decode_src2         	( idu_idu_ir_src2           ),
        .decode_dst_vld      	( idu_idu_ir_dst_vld        ),
        .decode_dst          	( idu_idu_ir_dst            ),
        .decode_imm_vld      	( idu_idu_ir_imm_vld        ),
        .decode_imm          	( idu_idu_ir_imm            ),
        .decode_type         	( idu_idu_ir_type           ),
        .decode_pipe         	( idu_idu_ir_pipe           ),
        .decode_ras          	( idu_idu_ir_ras            ),
        .iid_req                ( idu_rtu_rob_iid_req_vld   ),
        .preg_req               ( idu_rtu_pst_pdst_req_vld  )
    );

    idu_ir_rt idu_ir_rt(
        .clk                            ( clk),
        .rst_clk                        ( rst_clk),
        .rtu_global_flush               ( rtu_global_flush),
        .y_idu_ir_stall_ctrl            ( y_front_pipeline_stall),
        .rtu_idu_ir_recover_table       ( rtu_idu_ir_recover_table),
        .idu_idu_ir_vld                 ( idu_idu_ir_vld),
        .idu_idu_ir_src1_vld            ( idu_idu_ir_src1_vld),
        .idu_idu_ir_src1                ( idu_idu_ir_src1),
        .idu_idu_ir_src2_vld            ( idu_idu_ir_src2_vld),
        .idu_idu_ir_src2                ( idu_idu_ir_src2),
        .idu_idu_ir_dst_vld             ( idu_idu_ir_dst_vld),
        .idu_idu_ir_dst                 ( idu_idu_ir_dst),
        .idu_idu_ir_opcode              ( idu_idu_ir_opcode),
        .idu_idu_ir_funct7              ( idu_idu_ir_funct7),
        .idu_idu_ir_funct3              ( idu_idu_ir_funct3),
        .idu_idu_ir_pc                  ( idu_idu_ir_pc),
        .idu_idu_ir_imm_vld             ( idu_idu_ir_imm_vld),
        .idu_idu_ir_imm                 ( idu_idu_ir_imm),
        .idu_idu_ir_type                ( idu_idu_ir_type),
        .idu_idu_ir_pipe                ( idu_idu_ir_pipe),
        .idu_idu_ir_ras                 ( idu_idu_ir_ras),
        .rtu_idu_ir_alloc_vld           ( rtu_idu_is_preg_vld),
        .rtu_idu_ir_alloc_preg          ( rtu_idu_is_preg),
        .exu_idu_ir_alu_complete_vld    ( exu_idu_ir_alu_complete_vld),
        .exu_idu_ir_alu_complete_preg   ( exu_idu_ir_alu_complete_preg),
        .exu_idu_ir_mxu_complete_vld    ( exu_idu_ir_mxu_complete_vld),
        .exu_idu_ir_mxu_complete_preg   ( exu_idu_ir_mxu_complete_preg),
        .exu_idu_ir_bju_complete_vld    ( exu_idu_ir_bju_complete_vld),
        .exu_idu_ir_bju_complete_preg   ( exu_idu_ir_bju_complete_preg),
        .exu_idu_ir_lsu_complete_vld    ( exu_idu_ir_lsu_complete_vld),
        .exu_idu_ir_lsu_complete_preg   ( exu_idu_ir_lsu_complete_preg),
        .rename_vld                     ( idu_idu_is_vld),
        .rename_src1_vld                ( idu_rtu_rob_create_src1_vld),
        .rename_src1                    ( idu_rtu_rob_create_src1),
        .rename_src2_vld                ( idu_rtu_rob_create_src2_vld),
        .rename_src2                    ( idu_rtu_rob_create_src2),
        .rename_dst_vld                 ( idu_rtu_rob_create_dst_vld),
        .rename_dst                     ( idu_rtu_rob_create_dst),
        .rename_opcode                  ( idu_idu_is_opcode),
        .rename_funct7                  ( idu_idu_is_funct7),
        .rename_funct3                  ( idu_idu_is_funct3),
        .rename_pc                      ( idu_idu_is_pc),
        .rename_imm_vld                 ( idu_idu_is_imm_vld),
        .rename_imm                     ( idu_idu_is_imm),
        .rename_type                    ( idu_idu_is_type),
        .rename_pipe                    ( idu_idu_is_pipe),
        .rename_ras                     ( idu_idu_is_ras),
        .rename_psrc1_vld               ( idu_idu_is_psrc1_vld),
        .rename_psrc1_ready             ( idu_idu_is_psrc1_ready),
        .rename_psrc1                   ( idu_idu_is_psrc1),
        .rename_psrc2_vld               ( idu_idu_is_psrc2_vld),
        .rename_psrc2_ready             ( idu_idu_is_psrc2_ready),
        .rename_psrc2                   ( idu_idu_is_psrc2),
        .rename_pdst_vld                ( idu_idu_is_pdst_vld),
        .rename_pdst                    ( idu_rtu_pst_create_gpr_pre_preg_index)
    );

    idu_rf_pc idu_rf_pc(
        .clk                        	( clk                         ),
        .rst_clk                    	( rst_clk                     ),
        .y_stall_ctrl               	( y_front_pipeline_stall      ),
        .rob_idu_rf_pcjump_vld      	( rob_idu_rf_pcjump_vld       ),
        .exu_idu_rf_bju_pcjump_vld  	( exu_idu_rf_bju_pcjump_vld   ),
        .exu_idu_rf_bju_pcjump_addr 	( exu_idu_rf_bju_pcjump_addr  ),
        .pc                         	( pc                          )
    );

    // rtu modules
    rtu_rob rtu_rob(
        .clk                            ( clk                           ),
        .rst_clk                        ( rst_clk                       ),
        .idu_rtu_rob_iid_req_vld        ( idu_rtu_rob_iid_req_vld       ),
        .idu_rtu_rob_create_vld         ( idu_rtu_rob_create_vld        ),
        .idu_rtu_rob_create_opcode      ( idu_rtu_rob_create_opcode     ),
        .idu_rtu_rob_create_funct3      ( idu_rtu_rob_create_funct3     ),
        .idu_rtu_rob_create_pc          ( idu_rtu_rob_create_pc         ),
        .idu_rtu_rob_create_src1        ( idu_rtu_rob_create_src1       ),
        .idu_rtu_rob_create_src1_vld    ( idu_rtu_rob_create_src1_vld   ),
        .idu_rtu_rob_create_psrc1       ( idu_rtu_rob_create_psrc1      ),
        .idu_rtu_rob_create_src2        ( idu_rtu_rob_create_src2       ),
        .idu_rtu_rob_create_src2_vld    ( idu_rtu_rob_create_src2_vld   ),
        .idu_rtu_rob_create_psrc2       ( idu_rtu_rob_create_psrc2      ),
        .idu_rtu_rob_create_dst         ( idu_rtu_rob_create_dst        ),
        .idu_rtu_rob_create_dst_vld     ( idu_rtu_rob_create_dst_vld    ),
        .idu_rtu_rob_create_pdst        ( idu_rtu_rob_create_pdst       ),
        .idu_rtu_rob_create_imm         ( idu_rtu_rob_create_imm        ),
        .idu_rtu_rob_create_imm_vld     ( idu_rtu_rob_create_imm_vld    ),
        .idu_rtu_rob_create_type        ( idu_rtu_rob_create_type       ),
        .idu_rtu_rob_create_pipe        ( idu_rtu_rob_create_pipe       ),
        .idu_rtu_rob_create_ras         ( idu_rtu_rob_create_ras        ),
        .idu_rtu_rob_alu_issue_vld      ( idu_rtu_rob_alu_issue_vld     ),
        .idu_rtu_rob_alu_issue_iid      ( idu_rtu_rob_alu_issue_iid     ),
        .idu_rtu_rob_mxu_issue_vld      ( idu_rtu_rob_mxu_issue_vld     ),
        .idu_rtu_rob_mxu_issue_iid      ( idu_rtu_rob_mxu_issue_iid     ),
        .idu_rtu_rob_bju_issue_vld      ( idu_rtu_rob_bju_issue_vld     ),
        .idu_rtu_rob_bju_issue_iid      ( idu_rtu_rob_bju_issue_iid     ),
        .idu_rtu_rob_lsu_issue_vld      ( idu_rtu_rob_lsu_issue_vld     ),
        .idu_rtu_rob_lsu_issue_iid      ( idu_rtu_rob_lsu_issue_iid     ),
        .idu_rtu_rob_cp0_issue_vld      ( idu_rtu_rob_cp0_issue_vld     ),
        .idu_rtu_rob_cp0_issue_iid      ( idu_rtu_rob_cp0_issue_iid     ),
        .exu_rtu_rob_alu_complete_vld   ( exu_rtu_rob_alu_complete_vld  ),
        .exu_rtu_rob_alu_complete_iid   ( exu_rtu_rob_alu_complete_iid  ),
        .exu_rtu_rob_mxu_complete_vld   ( exu_rtu_rob_mxu_complete_vld  ),
        .exu_rtu_rob_mxu_complete_iid   ( exu_rtu_rob_mxu_complete_iid  ),
        .exu_rtu_rob_bju_complete_vld   ( exu_rtu_rob_bju_complete_vld  ),
        .exu_rtu_rob_bju_complete_iid   ( exu_rtu_rob_bju_complete_iid  ),
        .exu_rtu_rob_lsu_complete_vld   ( exu_rtu_rob_lsu_complete_vld  ),
        .exu_rtu_rob_lsu_complete_iid   ( exu_rtu_rob_lsu_complete_iid  ),
        .exu_rtu_rob_cp0_complete_vld   ( exu_rtu_rob_cp0_complete_vld  ),
        .exu_rtu_rob_cp0_complete_iid   ( exu_rtu_rob_cp0_complete_iid  ),
        .exu_rtu_rob_bju_pcjump_vld     ( exu_rtu_rob_bju_pcjump_vld    ),
        .exu_rtu_rob_bju_pcjump_iid     ( exu_rtu_rob_bju_pcjump_iid    ),
        .ebreak_gpr10                   ( ebreak_gpr10                  ),
        .rtu_idu_rf_pcjump              ( rob_idu_rf_pcjump_vld         ),
        .rtu_global_flush               ( rtu_global_flush              ),
        .x_retire_vld                   ( x_retire_vld                  ),
        .x_inst_retire_iid              ( x_inst_retire_iid             ),
        .iid_vld                        ( rtu_idu_is_iid_vld            ),
        .iid                            ( rtu_idu_is_iid                )
    );

    rtu_pst_preg rtu_pst_preg(
        .clk                                    ( clk                                    ),
        .rst_clk                                ( rst_clk                                ),
        .rtu_global_flush                       ( rtu_global_flush                       ),
        .idu_rtu_pst_pdst_req_vld               ( idu_rtu_pst_pdst_req_vld               ),
        .idu_rtu_pst_create_vld                 ( idu_rtu_pst_create_vld                 ),
        .idu_rtu_pst_create_preg_index          ( idu_rtu_pst_create_preg_index          ),
        .idu_rtu_pst_create_iid                 ( idu_rtu_pst_create_iid                 ),
        .idu_rtu_pst_create_gpr_index           ( idu_rtu_pst_create_gpr_index           ),
        .idu_rtu_pst_create_gpr_pre_preg_index  ( idu_rtu_pst_create_gpr_pre_preg_index  ),
        .x_inst_retire_iid                      ( x_inst_retire_iid                      ),
        .x_retire_vld                           ( x_retire_vld                           ),
        .idu_rtu_pst_wb_vld                     ( idu_rtu_pst_wb_vld                     ),
        .alloc_preg_vld                         ( rtu_idu_is_preg_vld                    ),
        .alloc_preg                             ( rtu_idu_is_preg                        ),
        .rtu_idu_ir_recover_table               ( rtu_idu_ir_recover_table               )
    );

    // debug
    assign y_front_pipeline_stall = !rtu_idu_is_iid_vld | !rtu_idu_is_preg_vld;
    assign rob_idu_rf_pcjump_vld = 0;
    assign exu_idu_rf_bju_pcjump_vld = 0;
    assign exu_idu_rf_bju_pcjump_addr = 64'b0;
    assign exu_idu_ir_alu_complete_vld  = 0;
    assign exu_idu_ir_alu_complete_preg = 0;
    assign exu_idu_ir_mxu_complete_vld  = 0;
    assign exu_idu_ir_mxu_complete_preg = 0;
    assign exu_idu_ir_bju_complete_vld  = 0;
    assign exu_idu_ir_bju_complete_preg = 0;
    assign exu_idu_ir_lsu_complete_vld  = 0;
    assign exu_idu_ir_lsu_complete_preg = 0;
    assign idu_rtu_rob_create_vld        = idu_idu_is_vld;
    assign idu_rtu_rob_create_opcode     = idu_idu_is_opcode;
    assign idu_rtu_rob_create_funct3     = idu_idu_is_funct3;
    assign idu_rtu_rob_create_pc         = idu_idu_is_pc;
    assign idu_rtu_rob_create_psrc1      = idu_idu_is_psrc1;
    assign idu_rtu_rob_create_psrc2      = idu_idu_is_psrc2;
    assign idu_rtu_rob_create_pdst       = rtu_idu_is_preg;
    assign idu_rtu_rob_create_imm        = idu_idu_is_imm;
    assign idu_rtu_rob_create_imm_vld    = idu_idu_is_imm_vld;
    assign idu_rtu_rob_create_type       = idu_idu_is_type;
    assign idu_rtu_rob_create_pipe       = idu_idu_is_pipe;
    assign idu_rtu_rob_create_ras        = idu_idu_is_ras;
    assign idu_rtu_rob_alu_issue_vld     = 0;
    assign idu_rtu_rob_alu_issue_iid     = 0;
    assign idu_rtu_rob_mxu_issue_vld     = 0;
    assign idu_rtu_rob_mxu_issue_iid     = 0;
    assign idu_rtu_rob_bju_issue_vld     = 0;
    assign idu_rtu_rob_bju_issue_iid     = 0;
    assign idu_rtu_rob_lsu_issue_vld     = 0;
    assign idu_rtu_rob_lsu_issue_iid     = 0;
    assign idu_rtu_rob_cp0_issue_vld     = 0;
    assign idu_rtu_rob_cp0_issue_iid     = 0;
    assign exu_rtu_rob_alu_complete_vld  = 0;
    assign exu_rtu_rob_alu_complete_iid  = 0;
    assign exu_rtu_rob_mxu_complete_vld  = 0;
    assign exu_rtu_rob_mxu_complete_iid  = 0;
    assign exu_rtu_rob_bju_complete_vld  = 0;
    assign exu_rtu_rob_bju_complete_iid  = 0;
    assign exu_rtu_rob_lsu_complete_vld  = 0;
    assign exu_rtu_rob_lsu_complete_iid  = 0;
    assign exu_rtu_rob_cp0_complete_vld  = 0;
    assign exu_rtu_rob_cp0_complete_iid  = 0;
    assign exu_rtu_rob_bju_pcjump_vld    = 0;
    assign exu_rtu_rob_bju_pcjump_iid    = 0;
    assign ebreak_gpr10                  = 0;
    assign idu_rtu_pst_create_vld                = idu_idu_is_vld & idu_idu_is_pdst_vld;
    assign idu_rtu_pst_create_preg_index         = rtu_idu_is_preg;
    assign idu_rtu_pst_create_iid                = rtu_idu_is_iid;
    assign idu_rtu_pst_create_gpr_index          = idu_rtu_rob_create_dst;
    assign idu_rtu_pst_wb_vld                    = 0;
endmodule
