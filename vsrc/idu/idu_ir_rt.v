module idu_ir_rt (
    clk,
    rst_clk,
    rtu_global_flush,
    y_idu_ir_stall_ctrl,
    rtu_idu_ir_recover_table,
    idu_idu_ir_vld,
    idu_idu_ir_src1_vld,
    idu_idu_ir_src1,
    idu_idu_ir_src2_vld,
    idu_idu_ir_src2,
    idu_idu_ir_dst_vld,
    idu_idu_ir_dst,
    idu_idu_ir_opcode,
    idu_idu_ir_funct7,
    idu_idu_ir_funct3,
    idu_idu_ir_pc,
    idu_idu_ir_imm_vld,
    idu_idu_ir_imm,
    idu_idu_ir_type,
    idu_idu_ir_pipe,
    idu_idu_ir_ras,
    rtu_idu_ir_alloc_vld,
    rtu_idu_ir_alloc_preg,
    exu_idu_ir_alu_complete_vld,
    exu_idu_ir_alu_complete_preg,
    exu_idu_ir_mxu_complete_vld,
    exu_idu_ir_mxu_complete_preg,
    exu_idu_ir_bju_complete_vld,
    exu_idu_ir_bju_complete_preg,
    exu_idu_ir_lsu_complete_vld,
    exu_idu_ir_lsu_complete_preg,
    rename_vld,
    rename_src1_vld,
    rename_src1,
    rename_src2_vld,
    rename_src2,
    rename_dst_vld,
    rename_dst,
    rename_opcode,
    rename_funct7,
    rename_funct3,
    rename_pc,
    rename_imm_vld,
    rename_imm,
    rename_type,
    rename_pipe,
    rename_ras,
    rename_psrc1_vld,
    rename_psrc1_ready,
    rename_psrc1,
    rename_psrc2_vld,
    rename_psrc2_ready,
    rename_psrc2,
    rename_pdst_vld,
    rename_pdst
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         y_idu_ir_stall_ctrl;
    input  [191:0] rtu_idu_ir_recover_table;
    input         idu_idu_ir_vld;
    input         idu_idu_ir_src1_vld;
    input  [4 :0] idu_idu_ir_src1;
    input         idu_idu_ir_src2_vld;
    input  [4 :0] idu_idu_ir_src2;
    input         idu_idu_ir_dst_vld;
    input  [4 :0] idu_idu_ir_dst;
    input  [6 :0] idu_idu_ir_opcode;
    input  [6 :0] idu_idu_ir_funct7;
    input  [2 :0] idu_idu_ir_funct3;
    input  [63:0] idu_idu_ir_pc;
    input         idu_idu_ir_imm_vld;
    input  [63:0] idu_idu_ir_imm;
    input  [5 :0] idu_idu_ir_type;
    input  [4 :0] idu_idu_ir_pipe;
    input         idu_idu_ir_ras;
    input         rtu_idu_ir_alloc_vld;
    input  [5 :0] rtu_idu_ir_alloc_preg;
    input         exu_idu_ir_alu_complete_vld;
    input  [5 :0] exu_idu_ir_alu_complete_preg;
    input         exu_idu_ir_mxu_complete_vld;
    input  [5 :0] exu_idu_ir_mxu_complete_preg;
    input         exu_idu_ir_bju_complete_vld;
    input  [5 :0] exu_idu_ir_bju_complete_preg;
    input         exu_idu_ir_lsu_complete_vld;
    input  [5 :0] exu_idu_ir_lsu_complete_preg;
    output        rename_vld;
    output        rename_src1_vld;
    output [4 :0] rename_src1;
    output        rename_src2_vld;
    output [4 :0] rename_src2;
    output        rename_dst_vld;
    output [4 :0] rename_dst;
    output [6 :0] rename_opcode;
    output [6 :0] rename_funct7;
    output [2 :0] rename_funct3;
    output [63:0] rename_pc;
    output        rename_imm_vld;
    output [63:0] rename_imm;
    output [5 :0] rename_type;
    output [4 :0] rename_pipe;
    output        rename_ras;
    output        rename_psrc1_vld;
    output        rename_psrc1_ready;
    output [5 :0] rename_psrc1;
    output        rename_psrc2_vld;
    output        rename_psrc2_ready;
    output [5 :0] rename_psrc2;
    output        rename_pdst_vld;
    output [5 :0] rename_pdst;

    // &Regs;
    reg        rename_vld;
    reg        rename_src1_vld;
    reg [4 :0] rename_src1;
    reg        rename_src2_vld;
    reg [4 :0] rename_src2;
    reg        rename_dst_vld;
    reg [4 :0] rename_dst;
    reg [6 :0] rename_opcode;
    reg [6 :0] rename_funct7;
    reg [2 :0] rename_funct3;
    reg [63:0] rename_pc;
    reg        rename_imm_vld;
    reg [63:0] rename_imm;
    reg [5 :0] rename_type;
    reg [4 :0] rename_pipe;
    reg        rename_ras;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        y_idu_ir_stall_ctrl;
    wire [191:0] rtu_idu_ir_recover_table;
    wire        idu_idu_ir_vld;
    wire        idu_idu_ir_src1_vld;
    wire [4 :0] idu_idu_ir_src1;
    wire        idu_idu_ir_src2_vld;
    wire [4 :0] idu_idu_ir_src2;
    wire        idu_idu_ir_dst_vld;
    wire [4 :0] idu_idu_ir_dst;
    wire [6 :0] idu_idu_ir_opcode;
    wire [6 :0] idu_idu_ir_funct7;
    wire [2 :0] idu_idu_ir_funct3;
    wire [63:0] idu_idu_ir_pc;
    wire        idu_idu_ir_imm_vld;
    wire [63:0] idu_idu_ir_imm;
    wire [5 :0] idu_idu_ir_type;
    wire [4 :0] idu_idu_ir_pipe;
    wire        idu_idu_ir_ras;
    wire        rename_psrc1_vld;
    wire        rename_psrc1_ready;
    wire [5 :0] rename_psrc1;
    wire        rename_psrc2_vld;
    wire        rename_psrc2_ready;
    wire [5 :0] rename_psrc2;
    wire        rename_pdst_vld;
    wire [5 :0] rename_pdst;
    wire        rtu_idu_ir_alloc_vld;
    wire [5 :0] rtu_idu_ir_alloc_preg;
    wire        exu_idu_ir_alu_complete_vld;
    wire [5 :0] exu_idu_ir_alu_complete_preg;
    wire        exu_idu_ir_mxu_complete_vld;
    wire [5 :0] exu_idu_ir_mxu_complete_preg;
    wire        exu_idu_ir_bju_complete_vld;
    wire [5 :0] exu_idu_ir_bju_complete_preg;
    wire        exu_idu_ir_lsu_complete_vld;
    wire [5 :0] exu_idu_ir_lsu_complete_preg;
    wire [31:0] map_update_vld;

    // wire [5 :0] gpr0_recover_preg;
    wire [5 :0] gpr1_recover_preg;
    wire [5 :0] gpr2_recover_preg;
    wire [5 :0] gpr3_recover_preg;
    wire [5 :0] gpr4_recover_preg;
    wire [5 :0] gpr5_recover_preg;
    wire [5 :0] gpr6_recover_preg;
    wire [5 :0] gpr7_recover_preg;
    wire [5 :0] gpr8_recover_preg;
    wire [5 :0] gpr9_recover_preg;
    wire [5 :0] gpr10_recover_preg;
    wire [5 :0] gpr11_recover_preg;
    wire [5 :0] gpr12_recover_preg;
    wire [5 :0] gpr13_recover_preg;
    wire [5 :0] gpr14_recover_preg;
    wire [5 :0] gpr15_recover_preg;
    wire [5 :0] gpr16_recover_preg;
    wire [5 :0] gpr17_recover_preg;
    wire [5 :0] gpr18_recover_preg;
    wire [5 :0] gpr19_recover_preg;
    wire [5 :0] gpr20_recover_preg;
    wire [5 :0] gpr21_recover_preg;
    wire [5 :0] gpr22_recover_preg;
    wire [5 :0] gpr23_recover_preg;
    wire [5 :0] gpr24_recover_preg;
    wire [5 :0] gpr25_recover_preg;
    wire [5 :0] gpr26_recover_preg;
    wire [5 :0] gpr27_recover_preg;
    wire [5 :0] gpr28_recover_preg;
    wire [5 :0] gpr29_recover_preg;
    wire [5 :0] gpr30_recover_preg;
    wire [5 :0] gpr31_recover_preg;
    // wire [5 :0] gpr0_reset_mapped_preg;
    wire [5 :0] gpr1_reset_mapped_preg;
    wire [5 :0] gpr2_reset_mapped_preg;
    wire [5 :0] gpr3_reset_mapped_preg;
    wire [5 :0] gpr4_reset_mapped_preg;
    wire [5 :0] gpr5_reset_mapped_preg;
    wire [5 :0] gpr6_reset_mapped_preg;
    wire [5 :0] gpr7_reset_mapped_preg;
    wire [5 :0] gpr8_reset_mapped_preg;
    wire [5 :0] gpr9_reset_mapped_preg;
    wire [5 :0] gpr10_reset_mapped_preg;
    wire [5 :0] gpr11_reset_mapped_preg;
    wire [5 :0] gpr12_reset_mapped_preg;
    wire [5 :0] gpr13_reset_mapped_preg;
    wire [5 :0] gpr14_reset_mapped_preg;
    wire [5 :0] gpr15_reset_mapped_preg;
    wire [5 :0] gpr16_reset_mapped_preg;
    wire [5 :0] gpr17_reset_mapped_preg;
    wire [5 :0] gpr18_reset_mapped_preg;
    wire [5 :0] gpr19_reset_mapped_preg;
    wire [5 :0] gpr20_reset_mapped_preg;
    wire [5 :0] gpr21_reset_mapped_preg;
    wire [5 :0] gpr22_reset_mapped_preg;
    wire [5 :0] gpr23_reset_mapped_preg;
    wire [5 :0] gpr24_reset_mapped_preg;
    wire [5 :0] gpr25_reset_mapped_preg;
    wire [5 :0] gpr26_reset_mapped_preg;
    wire [5 :0] gpr27_reset_mapped_preg;
    wire [5 :0] gpr28_reset_mapped_preg;
    wire [5 :0] gpr29_reset_mapped_preg;
    wire [5 :0] gpr30_reset_mapped_preg;
    wire [5 :0] gpr31_reset_mapped_preg;

    wire [5 :0] gpr0_preg;
    wire [5 :0] gpr1_preg;
    wire [5 :0] gpr2_preg;
    wire [5 :0] gpr3_preg;
    wire [5 :0] gpr4_preg;
    wire [5 :0] gpr5_preg;
    wire [5 :0] gpr6_preg;
    wire [5 :0] gpr7_preg;
    wire [5 :0] gpr8_preg;
    wire [5 :0] gpr9_preg;
    wire [5 :0] gpr10_preg;
    wire [5 :0] gpr11_preg;
    wire [5 :0] gpr12_preg;
    wire [5 :0] gpr13_preg;
    wire [5 :0] gpr14_preg;
    wire [5 :0] gpr15_preg;
    wire [5 :0] gpr16_preg;
    wire [5 :0] gpr17_preg;
    wire [5 :0] gpr18_preg;
    wire [5 :0] gpr19_preg;
    wire [5 :0] gpr20_preg;
    wire [5 :0] gpr21_preg;
    wire [5 :0] gpr22_preg;
    wire [5 :0] gpr23_preg;
    wire [5 :0] gpr24_preg;
    wire [5 :0] gpr25_preg;
    wire [5 :0] gpr26_preg;
    wire [5 :0] gpr27_preg;
    wire [5 :0] gpr28_preg;
    wire [5 :0] gpr29_preg;
    wire [5 :0] gpr30_preg;
    wire [5 :0] gpr31_preg;
    wire [31:0] gpr_ready;
    wire [31:0] src1_sel;
    wire [31:0] src2_sel;
    wire [31:0] dst_sel;

    assign gpr0_preg    = 6'd0;
    assign gpr_ready[0] = 1;

    idu_ir_rt_entry idu_ir_rt1_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr1_recover_preg         ),
        .reset_mapped_preg        ( gpr1_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[1]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr1_preg                 ),
        .ready                    ( gpr_ready[1]              )
    );

    idu_ir_rt_entry idu_ir_rt2_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr2_recover_preg         ),
        .reset_mapped_preg        ( gpr2_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[2]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr2_preg                 ),
        .ready                    ( gpr_ready[2]              )
    );

    idu_ir_rt_entry idu_ir_rt3_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr3_recover_preg         ),
        .reset_mapped_preg        ( gpr3_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[3]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr3_preg                 ),
        .ready                    ( gpr_ready[3]              )
    );

    idu_ir_rt_entry idu_ir_rt4_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr4_recover_preg         ),
        .reset_mapped_preg        ( gpr4_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[4]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr4_preg                 ),
        .ready                    ( gpr_ready[4]              )
    );

    idu_ir_rt_entry idu_ir_rt5_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr5_recover_preg         ),
        .reset_mapped_preg        ( gpr5_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[5]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr5_preg                 ),
        .ready                    ( gpr_ready[5]              )
    );

    idu_ir_rt_entry idu_ir_rt6_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr6_recover_preg         ),
        .reset_mapped_preg        ( gpr6_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[6]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr6_preg                 ),
        .ready                    ( gpr_ready[6]              )
    );

    idu_ir_rt_entry idu_ir_rt7_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr7_recover_preg         ),
        .reset_mapped_preg        ( gpr7_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[7]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr7_preg                 ),
        .ready                    ( gpr_ready[7]              )
    );

    idu_ir_rt_entry idu_ir_rt8_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr8_recover_preg         ),
        .reset_mapped_preg        ( gpr8_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[8]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr8_preg                 ),
        .ready                    ( gpr_ready[8]              )
    );

    idu_ir_rt_entry idu_ir_rt9_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr9_recover_preg         ),
        .reset_mapped_preg        ( gpr9_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[9]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr9_preg                 ),
        .ready                    ( gpr_ready[9]              )
    );

    idu_ir_rt_entry idu_ir_rt10_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr10_recover_preg         ),
        .reset_mapped_preg        ( gpr10_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[10]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr10_preg                 ),
        .ready                    ( gpr_ready[10]              )
    );

    idu_ir_rt_entry idu_ir_rt11_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr11_recover_preg         ),
        .reset_mapped_preg        ( gpr11_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[11]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr11_preg                 ),
        .ready                    ( gpr_ready[11]              )
    );

    idu_ir_rt_entry idu_ir_rt12_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr12_recover_preg         ),
        .reset_mapped_preg        ( gpr12_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[12]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr12_preg                 ),
        .ready                    ( gpr_ready[12]              )
    );

    idu_ir_rt_entry idu_ir_rt13_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr13_recover_preg         ),
        .reset_mapped_preg        ( gpr13_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[13]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr13_preg                 ),
        .ready                    ( gpr_ready[13]              )
    );

    idu_ir_rt_entry idu_ir_rt14_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr14_recover_preg         ),
        .reset_mapped_preg        ( gpr14_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[14]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr14_preg                 ),
        .ready                    ( gpr_ready[14]              )
    );

    idu_ir_rt_entry idu_ir_rt15_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr15_recover_preg         ),
        .reset_mapped_preg        ( gpr15_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[15]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr15_preg                 ),
        .ready                    ( gpr_ready[15]              )
    );

    idu_ir_rt_entry idu_ir_rt16_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr16_recover_preg         ),
        .reset_mapped_preg        ( gpr16_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[16]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr16_preg                 ),
        .ready                    ( gpr_ready[16]              )
    );

    idu_ir_rt_entry idu_ir_rt17_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr17_recover_preg         ),
        .reset_mapped_preg        ( gpr17_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[17]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr17_preg                 ),
        .ready                    ( gpr_ready[17]              )
    );

    idu_ir_rt_entry idu_ir_rt18_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr18_recover_preg         ),
        .reset_mapped_preg        ( gpr18_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[18]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr18_preg                 ),
        .ready                    ( gpr_ready[18]              )
    );

    idu_ir_rt_entry idu_ir_rt19_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr19_recover_preg         ),
        .reset_mapped_preg        ( gpr19_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[19]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr19_preg                 ),
        .ready                    ( gpr_ready[19]              )
    );

    idu_ir_rt_entry idu_ir_rt20_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr20_recover_preg         ),
        .reset_mapped_preg        ( gpr20_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[20]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr20_preg                 ),
        .ready                    ( gpr_ready[20]              )
    );

    idu_ir_rt_entry idu_ir_rt21_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr21_recover_preg         ),
        .reset_mapped_preg        ( gpr21_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[21]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr21_preg                 ),
        .ready                    ( gpr_ready[21]              )
    );

    idu_ir_rt_entry idu_ir_rt22_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr22_recover_preg         ),
        .reset_mapped_preg        ( gpr22_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[22]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr22_preg                 ),
        .ready                    ( gpr_ready[22]              )
    );

    idu_ir_rt_entry idu_ir_rt23_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr23_recover_preg         ),
        .reset_mapped_preg        ( gpr23_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[23]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr23_preg                 ),
        .ready                    ( gpr_ready[23]              )
    );

    idu_ir_rt_entry idu_ir_rt24_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr24_recover_preg         ),
        .reset_mapped_preg        ( gpr24_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[24]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr24_preg                 ),
        .ready                    ( gpr_ready[24]              )
    );

    idu_ir_rt_entry idu_ir_rt25_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr25_recover_preg         ),
        .reset_mapped_preg        ( gpr25_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[25]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr25_preg                 ),
        .ready                    ( gpr_ready[25]              )
    );

    idu_ir_rt_entry idu_ir_rt26_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr26_recover_preg         ),
        .reset_mapped_preg        ( gpr26_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[26]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr26_preg                 ),
        .ready                    ( gpr_ready[26]              )
    );

    idu_ir_rt_entry idu_ir_rt27_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr27_recover_preg         ),
        .reset_mapped_preg        ( gpr27_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[27]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr27_preg                 ),
        .ready                    ( gpr_ready[27]              )
    );

    idu_ir_rt_entry idu_ir_rt28_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr28_recover_preg         ),
        .reset_mapped_preg        ( gpr28_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[28]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr28_preg                 ),
        .ready                    ( gpr_ready[28]              )
    );

    idu_ir_rt_entry idu_ir_rt29_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr29_recover_preg         ),
        .reset_mapped_preg        ( gpr29_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[29]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr29_preg                 ),
        .ready                    ( gpr_ready[29]              )
    );

    idu_ir_rt_entry idu_ir_rt30_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr30_recover_preg         ),
        .reset_mapped_preg        ( gpr30_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[30]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr30_preg                 ),
        .ready                    ( gpr_ready[30]              )
    );

    idu_ir_rt_entry idu_ir_rt31_entry(
        .clk                      ( clk                           ),
        .rst_clk                  ( rst_clk                       ),
        .rtu_global_flush         ( rtu_global_flush              ),
        .y_idu_ir_stall_ctrl      ( y_idu_ir_stall_ctrl           ),
        .recover_preg             ( gpr31_recover_preg         ),
        .reset_mapped_preg        ( gpr31_reset_mapped_preg    ),
        .map_update_vld           ( map_update_vld[31]         ),
        .update_preg              ( rtu_idu_ir_alloc_preg         ),
        .pipe0_alu_wb_vld         ( exu_idu_ir_alu_complete_vld   ),
        .pipe0_alu_wb_preg        ( exu_idu_ir_alu_complete_preg  ),
        .pipe1_mxu_wb_vld         ( exu_idu_ir_mxu_complete_vld   ),
        .pipe1_mxu_wb_preg        ( exu_idu_ir_mxu_complete_preg  ),
        .pipe2_bju_wb_vld         ( exu_idu_ir_bju_complete_vld   ),
        .pipe2_bju_wb_preg        ( exu_idu_ir_bju_complete_preg  ),
        .pipe3_lsu_wb_vld         ( exu_idu_ir_lsu_complete_vld   ),
        .pipe3_lsu_wb_preg        ( exu_idu_ir_lsu_complete_preg  ),
        .preg                     ( gpr31_preg                 ),
        .ready                    ( gpr_ready[31]              )
    );

    // assign gpr0_recover_preg  = rtu_idu_ir_recover_table[5  :0  ];
    assign gpr1_recover_preg  = rtu_idu_ir_recover_table[11 :6  ];
    assign gpr2_recover_preg  = rtu_idu_ir_recover_table[17 :12 ];
    assign gpr3_recover_preg  = rtu_idu_ir_recover_table[23 :18 ];
    assign gpr4_recover_preg  = rtu_idu_ir_recover_table[29 :24 ];
    assign gpr5_recover_preg  = rtu_idu_ir_recover_table[35 :30 ];
    assign gpr6_recover_preg  = rtu_idu_ir_recover_table[41 :36 ];
    assign gpr7_recover_preg  = rtu_idu_ir_recover_table[47 :42 ];
    assign gpr8_recover_preg  = rtu_idu_ir_recover_table[53 :48 ];
    assign gpr9_recover_preg  = rtu_idu_ir_recover_table[59 :54 ];
    assign gpr10_recover_preg = rtu_idu_ir_recover_table[65 :60 ];
    assign gpr11_recover_preg = rtu_idu_ir_recover_table[71 :66 ];
    assign gpr12_recover_preg = rtu_idu_ir_recover_table[77: 72 ];
    assign gpr13_recover_preg = rtu_idu_ir_recover_table[83 :78 ];
    assign gpr14_recover_preg = rtu_idu_ir_recover_table[89 :84 ];
    assign gpr15_recover_preg = rtu_idu_ir_recover_table[95 :90 ];
    assign gpr16_recover_preg = rtu_idu_ir_recover_table[101:96 ];
    assign gpr17_recover_preg = rtu_idu_ir_recover_table[107:102];
    assign gpr18_recover_preg = rtu_idu_ir_recover_table[113:108];
    assign gpr19_recover_preg = rtu_idu_ir_recover_table[119:114];
    assign gpr20_recover_preg = rtu_idu_ir_recover_table[125:120];
    assign gpr21_recover_preg = rtu_idu_ir_recover_table[131:126];
    assign gpr22_recover_preg = rtu_idu_ir_recover_table[137:132];
    assign gpr23_recover_preg = rtu_idu_ir_recover_table[143:138];
    assign gpr24_recover_preg = rtu_idu_ir_recover_table[149:144];
    assign gpr25_recover_preg = rtu_idu_ir_recover_table[155:150];
    assign gpr26_recover_preg = rtu_idu_ir_recover_table[161:156];
    assign gpr27_recover_preg = rtu_idu_ir_recover_table[167:162];
    assign gpr28_recover_preg = rtu_idu_ir_recover_table[173:168];
    assign gpr29_recover_preg = rtu_idu_ir_recover_table[179:174];
    assign gpr30_recover_preg = rtu_idu_ir_recover_table[185:180];
    assign gpr31_recover_preg = rtu_idu_ir_recover_table[191:186];

    // assign gpr0_reset_mapped_preg  = 6'd0;
    assign gpr1_reset_mapped_preg  = 6'd1;
    assign gpr2_reset_mapped_preg  = 6'd2;
    assign gpr3_reset_mapped_preg  = 6'd3;
    assign gpr4_reset_mapped_preg  = 6'd4;
    assign gpr5_reset_mapped_preg  = 6'd5;
    assign gpr6_reset_mapped_preg  = 6'd6;
    assign gpr7_reset_mapped_preg  = 6'd7;
    assign gpr8_reset_mapped_preg  = 6'd8;
    assign gpr9_reset_mapped_preg  = 6'd9;
    assign gpr10_reset_mapped_preg = 6'd10;
    assign gpr11_reset_mapped_preg = 6'd11;
    assign gpr12_reset_mapped_preg = 6'd12;
    assign gpr13_reset_mapped_preg = 6'd13;
    assign gpr14_reset_mapped_preg = 6'd14;
    assign gpr15_reset_mapped_preg = 6'd15;
    assign gpr16_reset_mapped_preg = 6'd16;
    assign gpr17_reset_mapped_preg = 6'd17;
    assign gpr18_reset_mapped_preg = 6'd18;
    assign gpr19_reset_mapped_preg = 6'd19;
    assign gpr20_reset_mapped_preg = 6'd20;
    assign gpr21_reset_mapped_preg = 6'd21;
    assign gpr22_reset_mapped_preg = 6'd22;
    assign gpr23_reset_mapped_preg = 6'd23;
    assign gpr24_reset_mapped_preg = 6'd24;
    assign gpr25_reset_mapped_preg = 6'd25;
    assign gpr26_reset_mapped_preg = 6'd26;
    assign gpr27_reset_mapped_preg = 6'd27;
    assign gpr28_reset_mapped_preg = 6'd28;
    assign gpr29_reset_mapped_preg = 6'd29;
    assign gpr30_reset_mapped_preg = 6'd30;
    assign gpr31_reset_mapped_preg = 6'd31;

    // ir 表项需要在当前周期写完就能读到结果，故而读应当是一个组合逻辑
    // 故在上升沿需要将上个流水到来的数据采样（反正本来就得拿去 create rob entry
    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            rename_vld      <= 0;
            rename_src1_vld <= 0;
            rename_src1     <= 0;
            rename_src2_vld <= 0;
            rename_src2     <= 0;
            rename_dst_vld  <= 0;
            rename_dst      <= 0;
            rename_opcode   <= 0;
            rename_funct7   <= 0;
            rename_funct3   <= 0;
            rename_pc       <= 0;
            rename_imm_vld  <= 0;
            rename_imm      <= 0;
            rename_type     <= 0;
            rename_pipe     <= 0;
            rename_ras      <= 0;
        end
        else if (rtu_global_flush) begin
            rename_vld      <= 0;
            rename_src1_vld <= 0;
            rename_src1     <= 0;
            rename_src2_vld <= 0;
            rename_src2     <= 0;
            rename_dst_vld  <= 0;
            rename_dst      <= 0;
            rename_opcode   <= 0;
            rename_funct7   <= 0;
            rename_funct3   <= 0;
            rename_pc       <= 0;
            rename_imm_vld  <= 0;
            rename_imm      <= 0;
            rename_type     <= 0;
            rename_pipe     <= 0;
            rename_ras      <= 0;
        end
        else if (y_idu_ir_stall_ctrl) begin
            rename_vld      <= rename_vld;
            rename_src1_vld <= rename_src1_vld;
            rename_src1     <= rename_src1;
            rename_src2_vld <= rename_src2_vld;
            rename_src2     <= rename_src2;
            rename_dst_vld  <= rename_dst_vld;
            rename_dst      <= rename_dst;
            rename_opcode   <= rename_opcode;
            rename_funct7   <= rename_funct7;
            rename_funct3   <= rename_funct3;
            rename_pc       <= rename_pc;
            rename_imm_vld  <= rename_imm_vld;
            rename_imm      <= rename_imm;
            rename_type     <= rename_type;
            rename_pipe     <= rename_pipe;
            rename_ras      <= rename_ras;
        end
        else if (idu_idu_ir_vld) begin
            rename_vld      <= 1;
            rename_src1_vld <= idu_idu_ir_src1_vld;
            rename_src1     <= idu_idu_ir_src1;
            rename_src2_vld <= idu_idu_ir_src2_vld;
            rename_src2     <= idu_idu_ir_src2;
            rename_dst_vld  <= idu_idu_ir_dst_vld;
            rename_dst      <= idu_idu_ir_dst;
            rename_opcode   <= idu_idu_ir_opcode;
            rename_funct7   <= idu_idu_ir_funct7;
            rename_funct3   <= idu_idu_ir_funct3;
            rename_pc       <= idu_idu_ir_pc;
            rename_imm_vld  <= idu_idu_ir_imm_vld;
            rename_imm      <= idu_idu_ir_imm;
            rename_type     <= idu_idu_ir_type;
            rename_pipe     <= idu_idu_ir_pipe;
            rename_ras      <= idu_idu_ir_ras;
        end
        else begin
            rename_vld      <= rename_vld;
            rename_src1_vld <= rename_src1_vld;
            rename_src1     <= rename_src1;
            rename_src2_vld <= rename_src2_vld;
            rename_src2     <= rename_src2;
            rename_dst_vld  <= rename_dst_vld;
            rename_dst      <= rename_dst;
            rename_opcode   <= rename_opcode;
            rename_funct7   <= rename_funct7;
            rename_funct3   <= rename_funct3;
            rename_pc       <= rename_pc;
            rename_imm_vld  <= rename_imm_vld;
            rename_imm      <= rename_imm;
            rename_type     <= rename_type;
            rename_pipe     <= rename_pipe;
            rename_ras      <= rename_ras;
        end
    end

    assign rename_psrc1_vld = rename_src1_vld;
    assign rename_psrc2_vld = rename_src2_vld;
    assign rename_pdst_vld  = rename_dst_vld;

    for (genvar i = 0; i < 32; i++)
    begin: sel_sign
        assign src1_sel[i] = (rename_src1 == i);
        assign src2_sel[i] = (rename_src2 == i);
        assign dst_sel[i]  = (rename_dst  == i);
    end

    assign rename_psrc1_ready = (src1_sel[0] & gpr_ready[0])
                              | (src1_sel[1] & gpr_ready[1])
                              | (src1_sel[2] & gpr_ready[2])
                              | (src1_sel[3] & gpr_ready[3])
                              | (src1_sel[4] & gpr_ready[4])
                              | (src1_sel[5] & gpr_ready[5])
                              | (src1_sel[6] & gpr_ready[6])
                              | (src1_sel[7] & gpr_ready[7])
                              | (src1_sel[8] & gpr_ready[8])
                              | (src1_sel[9] & gpr_ready[9])
                              | (src1_sel[10] & gpr_ready[10])
                              | (src1_sel[11] & gpr_ready[11])
                              | (src1_sel[12] & gpr_ready[12])
                              | (src1_sel[13] & gpr_ready[13])
                              | (src1_sel[14] & gpr_ready[14])
                              | (src1_sel[15] & gpr_ready[15])
                              | (src1_sel[16] & gpr_ready[16])
                              | (src1_sel[17] & gpr_ready[17])
                              | (src1_sel[18] & gpr_ready[18])
                              | (src1_sel[19] & gpr_ready[19])
                              | (src1_sel[20] & gpr_ready[20])
                              | (src1_sel[21] & gpr_ready[21])
                              | (src1_sel[22] & gpr_ready[22])
                              | (src1_sel[23] & gpr_ready[23])
                              | (src1_sel[24] & gpr_ready[24])
                              | (src1_sel[25] & gpr_ready[25])
                              | (src1_sel[26] & gpr_ready[26])
                              | (src1_sel[27] & gpr_ready[27])
                              | (src1_sel[28] & gpr_ready[28])
                              | (src1_sel[29] & gpr_ready[29])
                              | (src1_sel[30] & gpr_ready[30])
                              | (src1_sel[31] & gpr_ready[31]);
    assign rename_psrc2_ready = (src2_sel[0] & gpr_ready[0])
                              | (src2_sel[1] & gpr_ready[1])
                              | (src2_sel[2] & gpr_ready[2])
                              | (src2_sel[3] & gpr_ready[3])
                              | (src2_sel[4] & gpr_ready[4])
                              | (src2_sel[5] & gpr_ready[5])
                              | (src2_sel[6] & gpr_ready[6])
                              | (src2_sel[7] & gpr_ready[7])
                              | (src2_sel[8] & gpr_ready[8])
                              | (src2_sel[9] & gpr_ready[9])
                              | (src2_sel[10] & gpr_ready[10])
                              | (src2_sel[11] & gpr_ready[11])
                              | (src2_sel[12] & gpr_ready[12])
                              | (src2_sel[13] & gpr_ready[13])
                              | (src2_sel[14] & gpr_ready[14])
                              | (src2_sel[15] & gpr_ready[15])
                              | (src2_sel[16] & gpr_ready[16])
                              | (src2_sel[17] & gpr_ready[17])
                              | (src2_sel[18] & gpr_ready[18])
                              | (src2_sel[19] & gpr_ready[19])
                              | (src2_sel[20] & gpr_ready[20])
                              | (src2_sel[21] & gpr_ready[21])
                              | (src2_sel[22] & gpr_ready[22])
                              | (src2_sel[23] & gpr_ready[23])
                              | (src2_sel[24] & gpr_ready[24])
                              | (src2_sel[25] & gpr_ready[25])
                              | (src2_sel[26] & gpr_ready[26])
                              | (src2_sel[27] & gpr_ready[27])
                              | (src2_sel[28] & gpr_ready[28])
                              | (src2_sel[29] & gpr_ready[29])
                              | (src2_sel[30] & gpr_ready[30])
                              | (src2_sel[31] & gpr_ready[31]);

    assign rename_psrc1 = ({6{src1_sel[0]}} & gpr0_preg)
                        | ({6{src1_sel[1]}} & gpr1_preg)
                        | ({6{src1_sel[2]}} & gpr2_preg)
                        | ({6{src1_sel[3]}} & gpr3_preg)
                        | ({6{src1_sel[4]}} & gpr4_preg)
                        | ({6{src1_sel[5]}} & gpr5_preg)
                        | ({6{src1_sel[6]}} & gpr6_preg)
                        | ({6{src1_sel[7]}} & gpr7_preg)
                        | ({6{src1_sel[8]}} & gpr8_preg)
                        | ({6{src1_sel[9]}} & gpr9_preg)
                        | ({6{src1_sel[10]}} & gpr10_preg)
                        | ({6{src1_sel[11]}} & gpr11_preg)
                        | ({6{src1_sel[12]}} & gpr12_preg)
                        | ({6{src1_sel[13]}} & gpr13_preg)
                        | ({6{src1_sel[14]}} & gpr14_preg)
                        | ({6{src1_sel[15]}} & gpr15_preg)
                        | ({6{src1_sel[16]}} & gpr16_preg)
                        | ({6{src1_sel[17]}} & gpr17_preg)
                        | ({6{src1_sel[18]}} & gpr18_preg)
                        | ({6{src1_sel[19]}} & gpr19_preg)
                        | ({6{src1_sel[20]}} & gpr20_preg)
                        | ({6{src1_sel[21]}} & gpr21_preg)
                        | ({6{src1_sel[22]}} & gpr22_preg)
                        | ({6{src1_sel[23]}} & gpr23_preg)
                        | ({6{src1_sel[24]}} & gpr24_preg)
                        | ({6{src1_sel[25]}} & gpr25_preg)
                        | ({6{src1_sel[26]}} & gpr26_preg)
                        | ({6{src1_sel[27]}} & gpr27_preg)
                        | ({6{src1_sel[28]}} & gpr28_preg)
                        | ({6{src1_sel[29]}} & gpr29_preg)
                        | ({6{src1_sel[30]}} & gpr30_preg)
                        | ({6{src1_sel[31]}} & gpr31_preg);
    assign rename_psrc2 = ({6{src2_sel[0]}} & gpr0_preg)
                        | ({6{src2_sel[1]}} & gpr1_preg)
                        | ({6{src2_sel[2]}} & gpr2_preg)
                        | ({6{src2_sel[3]}} & gpr3_preg)
                        | ({6{src2_sel[4]}} & gpr4_preg)
                        | ({6{src2_sel[5]}} & gpr5_preg)
                        | ({6{src2_sel[6]}} & gpr6_preg)
                        | ({6{src2_sel[7]}} & gpr7_preg)
                        | ({6{src2_sel[8]}} & gpr8_preg)
                        | ({6{src2_sel[9]}} & gpr9_preg)
                        | ({6{src2_sel[10]}} & gpr10_preg)
                        | ({6{src2_sel[11]}} & gpr11_preg)
                        | ({6{src2_sel[12]}} & gpr12_preg)
                        | ({6{src2_sel[13]}} & gpr13_preg)
                        | ({6{src2_sel[14]}} & gpr14_preg)
                        | ({6{src2_sel[15]}} & gpr15_preg)
                        | ({6{src2_sel[16]}} & gpr16_preg)
                        | ({6{src2_sel[17]}} & gpr17_preg)
                        | ({6{src2_sel[18]}} & gpr18_preg)
                        | ({6{src2_sel[19]}} & gpr19_preg)
                        | ({6{src2_sel[20]}} & gpr20_preg)
                        | ({6{src2_sel[21]}} & gpr21_preg)
                        | ({6{src2_sel[22]}} & gpr22_preg)
                        | ({6{src2_sel[23]}} & gpr23_preg)
                        | ({6{src2_sel[24]}} & gpr24_preg)
                        | ({6{src2_sel[25]}} & gpr25_preg)
                        | ({6{src2_sel[26]}} & gpr26_preg)
                        | ({6{src2_sel[27]}} & gpr27_preg)
                        | ({6{src2_sel[28]}} & gpr28_preg)
                        | ({6{src2_sel[29]}} & gpr29_preg)
                        | ({6{src2_sel[30]}} & gpr30_preg)
                        | ({6{src2_sel[31]}} & gpr31_preg);
    assign rename_pdst  = ({6{dst_sel[0]}} & gpr0_preg)
                        | ({6{dst_sel[1]}} & gpr1_preg)
                        | ({6{dst_sel[2]}} & gpr2_preg)
                        | ({6{dst_sel[3]}} & gpr3_preg)
                        | ({6{dst_sel[4]}} & gpr4_preg)
                        | ({6{dst_sel[5]}} & gpr5_preg)
                        | ({6{dst_sel[6]}} & gpr6_preg)
                        | ({6{dst_sel[7]}} & gpr7_preg)
                        | ({6{dst_sel[8]}} & gpr8_preg)
                        | ({6{dst_sel[9]}} & gpr9_preg)
                        | ({6{dst_sel[10]}} & gpr10_preg)
                        | ({6{dst_sel[11]}} & gpr11_preg)
                        | ({6{dst_sel[12]}} & gpr12_preg)
                        | ({6{dst_sel[13]}} & gpr13_preg)
                        | ({6{dst_sel[14]}} & gpr14_preg)
                        | ({6{dst_sel[15]}} & gpr15_preg)
                        | ({6{dst_sel[16]}} & gpr16_preg)
                        | ({6{dst_sel[17]}} & gpr17_preg)
                        | ({6{dst_sel[18]}} & gpr18_preg)
                        | ({6{dst_sel[19]}} & gpr19_preg)
                        | ({6{dst_sel[20]}} & gpr20_preg)
                        | ({6{dst_sel[21]}} & gpr21_preg)
                        | ({6{dst_sel[22]}} & gpr22_preg)
                        | ({6{dst_sel[23]}} & gpr23_preg)
                        | ({6{dst_sel[24]}} & gpr24_preg)
                        | ({6{dst_sel[25]}} & gpr25_preg)
                        | ({6{dst_sel[26]}} & gpr26_preg)
                        | ({6{dst_sel[27]}} & gpr27_preg)
                        | ({6{dst_sel[28]}} & gpr28_preg)
                        | ({6{dst_sel[29]}} & gpr29_preg)
                        | ({6{dst_sel[30]}} & gpr30_preg)
                        | ({6{dst_sel[31]}} & gpr31_preg);

    assign map_update_vld = dst_sel;

    `ifdef DEBUG_IDU_IR_PRINT
        always @(negedge clk)
        begin
            $display("IDU_IR : PC = %x, OPCODE = %x, SRC1  = x%02d, SRC2  = x%02d, DST  = x%02d, IMM = %x, PIPE = %b",
                    rename_pc, rename_opcode, rename_src1, rename_src2, rename_dst, rename_imm, rename_pipe);
            $display("                                             PSRC1 = p%02d, PSRC2 = p%02d, PDST = p%02d",
                    rename_psrc1, rename_psrc2, rtu_idu_ir_alloc_preg);
            $display("                                      READY: %b            %b",
                    rename_psrc1_ready, rename_psrc2_ready);
        end
    `endif

endmodule
