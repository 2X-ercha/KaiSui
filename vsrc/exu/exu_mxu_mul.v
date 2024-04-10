module exu_mxu_mul (
    clk,
    rst_clk,
    rtu_global_flush,
    idu_exu_mxu_vld,
    idu_exu_mxu_iid,
    idu_exu_mxu_opcode,
    idu_exu_mxu_funct7,
    idu_exu_mxu_funct3,
    idu_exu_mxu_psrc1_vld,
    idu_exu_mxu_psrc1_value,
    idu_exu_mxu_psrc2_vld,
    idu_exu_mxu_psrc2_value,
    idu_exu_mxu_pdst_vld,
    idu_exu_mxu_pdst,
    exu_rtu_rob_mxu_complete,
    exu_rtu_rob_mxu_iid,
    exu_idu_rf_mxu_wb_vld,
    exu_idu_rf_mxu_wb_preg,
    exu_idu_rf_mxu_wb_data,
    exu_idu_is_mul1_forward_vld,
    exu_idu_is_mul1_forward_preg,
    exu_idu_is_mul2_forward_vld,
    exu_idu_is_mul2_forward_preg
);
    // &Ports;
    input         clk;
    input         rst_clk;
    input         rtu_global_flush;
    input         idu_exu_mxu_vld;
    input  [4 :0] idu_exu_mxu_iid;
    input  [6 :0] idu_exu_mxu_opcode;
    input  [6 :0] idu_exu_mxu_funct7;
    input  [2 :0] idu_exu_mxu_funct3;
    input         idu_exu_mxu_psrc1_vld;
    input  [63:0] idu_exu_mxu_psrc1_value;
    input         idu_exu_mxu_psrc2_vld;
    input  [63:0] idu_exu_mxu_psrc2_value;
    input         idu_exu_mxu_pdst_vld;
    input  [5 :0] idu_exu_mxu_pdst;
    output        exu_rtu_rob_mxu_complete;
    output [4 :0] exu_rtu_rob_mxu_iid;
    output        exu_idu_rf_mxu_wb_vld;
    output [5 :0] exu_idu_rf_mxu_wb_preg;
    output [63:0] exu_idu_rf_mxu_wb_data;
    output        exu_idu_is_mul1_forward_vld;
    output [5 :0] exu_idu_is_mul1_forward_preg;
    output        exu_idu_is_mul2_forward_vld;
    output [5 :0] exu_idu_is_mul2_forward_preg;

    // &Regs;
    reg        vld;
    reg [4 :0] iid;
    reg [6 :0] opcode;
    reg [6 :0] funct7;
    reg [2 :0] funct3;
    reg        psrc1_vld;
    reg [63:0] psrc1_value;
    reg        psrc2_vld;
    reg [63:0] psrc2_value;
    reg        pdst_vld;
    reg [5 :0] pdst;
    reg        booth_vld;
    reg [4 :0] booth_iid;
    reg        booth_op64;
    reg [2 :0] booth_funct3;
    reg [5 :0] booth_pdst;
    reg [131:0] booth_psum [32:0];
    reg        wallace_vld;
    reg [4 :0] wallace_iid;
    reg        wallace_op64;
    reg [2 :0] wallace_funct3;
    reg [5 :0] wallace_pdst;
    reg [127:0] wallace_treeout0;
    reg [127:0] wallace_treeout1;
    reg        add_l_vld;
    reg [4 :0] add_l_iid;
    reg        add_l_op64;
    reg [2 :0] add_l_funct3;
    reg [5 :0] add_l_pdst;
    reg [63:0] add_l_treeout0_h;
    reg [63:0] add_l_treeout1_h;
    reg [63:0] add_l_result_l;
    reg        add_l_c;
    reg        add_h_vld;
    reg [4 :0] add_h_iid;
    reg        add_h_op64;
    reg [2 :0] add_h_funct3;
    reg [5 :0] add_h_pdst;
    reg [63:0] add_h_result_l;
    reg [63:0] add_h_result_h;

    // &Wires;
    wire        clk;
    wire        rst_clk;
    wire        rtu_global_flush;
    wire        idu_exu_mxu_vld;
    wire [4 :0] idu_exu_mxu_iid;
    wire [6 :0] idu_exu_mxu_opcode;
    wire [6 :0] idu_exu_mxu_funct7;
    wire [2 :0] idu_exu_mxu_funct3;
    wire        idu_exu_mxu_psrc1_vld;
    wire [63:0] idu_exu_mxu_psrc1_value;
    wire        idu_exu_mxu_psrc2_vld;
    wire [63:0] idu_exu_mxu_psrc2_value;
    wire        idu_exu_mxu_pdst_vld;
    wire [5 :0] idu_exu_mxu_pdst;
    wire        exu_rtu_rob_mxu_complete;
    wire [4 :0] exu_rtu_rob_mxu_iid;
    wire        exu_idu_rf_mxu_wb_vld;
    wire [5 :0] exu_idu_rf_mxu_wb_preg;
    wire [63:0] exu_idu_rf_mxu_wb_data;
    wire        exu_idu_is_mul1_forward_vld;
    wire [5 :0] exu_idu_is_mul1_forward_preg;
    wire        exu_idu_is_mul2_forward_vld;
    wire [5 :0] exu_idu_is_mul2_forward_preg;
    wire        R_alu64;
    wire [63:0] operand1;
    wire [63:0] operand2;
    wire        sign_x;
    wire        sign_y;
    wire [65:0] x;
    wire [65:0] y;
    wire [131:0] psum [32:0];
    wire [127:0] treeout0;
    wire [127:0] treeout1;
    wire [63:0] result_l;
    wire [63:0] result_h;
    wire        add_l64_c;
    wire        add_h64_c;
    wire [63:0] result_lh_sel;

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
        end
        else if (rtu_global_flush) begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
        end
        else if (idu_exu_mxu_vld & ~idu_exu_mxu_funct3[2]) begin
            vld         <= 1;
            iid         <= idu_exu_mxu_iid;
            opcode      <= idu_exu_mxu_opcode;
            funct7      <= idu_exu_mxu_funct7;
            funct3      <= idu_exu_mxu_funct3;
            psrc1_vld   <= idu_exu_mxu_psrc1_vld;
            psrc1_value <= idu_exu_mxu_psrc1_value;
            psrc2_vld   <= idu_exu_mxu_psrc2_vld;
            psrc2_value <= idu_exu_mxu_psrc2_value;
            pdst_vld    <= idu_exu_mxu_pdst_vld;
            pdst        <= idu_exu_mxu_pdst;
        end
        else begin
            vld         <= 0;
            iid         <= 0;
            opcode      <= 0;
            funct7      <= 0;
            funct3      <= 0;
            psrc1_vld   <= 0;
            psrc1_value <= 0;
            psrc2_vld   <= 0;
            psrc2_value <= 0;
            pdst_vld    <= 0;
            pdst        <= 0;
        end
    end

    assign R_alu64  = (opcode == R_ALU64);
    assign operand1 = (R_alu64) ? psrc1_value
                                : {{32{psrc1_value[31]}}, psrc1_value[31:0]};
    assign operand2 = (R_alu64) ? psrc2_value
                                : {{32{psrc2_value[31]}}, psrc2_value[31:0]};
    assign sign_x = (funct3[1:0] != 2'b11);
    assign sign_y = (funct3[1]   == 1'b0);
    assign x = sign_x ? {{(2){operand1[63]}}, operand1} : {2'b0, operand1};
    assign y = sign_y ? {{(2){operand1[63]}}, operand2} : {2'b0, operand2};

    booth booth(
        .x          ( x         ),
        .y          ( y         ),
        .psum0      ( psum[0]   ),
        .psum1      ( psum[1]   ),
        .psum2      ( psum[2]   ),
        .psum3      ( psum[3]   ),
        .psum4      ( psum[4]   ),
        .psum5      ( psum[5]   ),
        .psum6      ( psum[6]   ),
        .psum7      ( psum[7]   ),
        .psum8      ( psum[8]   ),
        .psum9      ( psum[9]   ),
        .psum10     ( psum[10]  ),
        .psum11     ( psum[11]  ),
        .psum12     ( psum[12]  ),
        .psum13     ( psum[13]  ),
        .psum14     ( psum[14]  ),
        .psum15     ( psum[15]  ),
        .psum16     ( psum[16]  ),
        .psum17     ( psum[17]  ),
        .psum18     ( psum[18]  ),
        .psum19     ( psum[19]  ),
        .psum20     ( psum[20]  ),
        .psum21     ( psum[21]  ),
        .psum22     ( psum[22]  ),
        .psum23     ( psum[23]  ),
        .psum24     ( psum[24]  ),
        .psum25     ( psum[25]  ),
        .psum26     ( psum[26]  ),
        .psum27     ( psum[27]  ),
        .psum28     ( psum[28]  ),
        .psum29     ( psum[29]  ),
        .psum30     ( psum[30]  ),
        .psum31     ( psum[31]  ),
        .psum32     ( psum[32]  )
    );

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            booth_vld      <= 0;
            booth_iid      <= 0;
            booth_op64     <= 0;
            booth_funct3   <= 0;
            booth_pdst     <= 0;
            booth_psum[0]  <= 0;
            booth_psum[1]  <= 0;
            booth_psum[2]  <= 0;
            booth_psum[3]  <= 0;
            booth_psum[4]  <= 0;
            booth_psum[5]  <= 0;
            booth_psum[6]  <= 0;
            booth_psum[7]  <= 0;
            booth_psum[8]  <= 0;
            booth_psum[9]  <= 0;
            booth_psum[10] <= 0;
            booth_psum[11] <= 0;
            booth_psum[12] <= 0;
            booth_psum[13] <= 0;
            booth_psum[14] <= 0;
            booth_psum[15] <= 0;
            booth_psum[16] <= 0;
            booth_psum[17] <= 0;
            booth_psum[18] <= 0;
            booth_psum[19] <= 0;
            booth_psum[20] <= 0;
            booth_psum[21] <= 0;
            booth_psum[22] <= 0;
            booth_psum[23] <= 0;
            booth_psum[24] <= 0;
            booth_psum[25] <= 0;
            booth_psum[26] <= 0;
            booth_psum[27] <= 0;
            booth_psum[28] <= 0;
            booth_psum[29] <= 0;
            booth_psum[30] <= 0;
            booth_psum[31] <= 0;
            booth_psum[32] <= 0;
        end
        else if (rtu_global_flush) begin
            booth_vld      <= 0;
            booth_iid      <= 0;
            booth_op64     <= 0;
            booth_funct3   <= 0;
            booth_pdst     <= 0;
            booth_psum[0]  <= 0;
            booth_psum[1]  <= 0;
            booth_psum[2]  <= 0;
            booth_psum[3]  <= 0;
            booth_psum[4]  <= 0;
            booth_psum[5]  <= 0;
            booth_psum[6]  <= 0;
            booth_psum[7]  <= 0;
            booth_psum[8]  <= 0;
            booth_psum[9]  <= 0;
            booth_psum[10] <= 0;
            booth_psum[11] <= 0;
            booth_psum[12] <= 0;
            booth_psum[13] <= 0;
            booth_psum[14] <= 0;
            booth_psum[15] <= 0;
            booth_psum[16] <= 0;
            booth_psum[17] <= 0;
            booth_psum[18] <= 0;
            booth_psum[19] <= 0;
            booth_psum[20] <= 0;
            booth_psum[21] <= 0;
            booth_psum[22] <= 0;
            booth_psum[23] <= 0;
            booth_psum[24] <= 0;
            booth_psum[25] <= 0;
            booth_psum[26] <= 0;
            booth_psum[27] <= 0;
            booth_psum[28] <= 0;
            booth_psum[29] <= 0;
            booth_psum[30] <= 0;
            booth_psum[31] <= 0;
            booth_psum[32] <= 0;
        end
        else if (vld) begin
            booth_vld      <= 1;
            booth_iid      <= iid;
            booth_op64     <= R_alu64;
            booth_funct3   <= funct3;
            booth_pdst     <= pdst;
            booth_psum[0]  <= psum[0];
            booth_psum[1]  <= psum[1];
            booth_psum[2]  <= psum[2];
            booth_psum[3]  <= psum[3];
            booth_psum[4]  <= psum[4];
            booth_psum[5]  <= psum[5];
            booth_psum[6]  <= psum[6];
            booth_psum[7]  <= psum[7];
            booth_psum[8]  <= psum[8];
            booth_psum[9]  <= psum[9];
            booth_psum[10] <= psum[10];
            booth_psum[11] <= psum[11];
            booth_psum[12] <= psum[12];
            booth_psum[13] <= psum[13];
            booth_psum[14] <= psum[14];
            booth_psum[15] <= psum[15];
            booth_psum[16] <= psum[16];
            booth_psum[17] <= psum[17];
            booth_psum[18] <= psum[18];
            booth_psum[19] <= psum[19];
            booth_psum[20] <= psum[20];
            booth_psum[21] <= psum[21];
            booth_psum[22] <= psum[22];
            booth_psum[23] <= psum[23];
            booth_psum[24] <= psum[24];
            booth_psum[25] <= psum[25];
            booth_psum[26] <= psum[26];
            booth_psum[27] <= psum[27];
            booth_psum[28] <= psum[28];
            booth_psum[29] <= psum[29];
            booth_psum[30] <= psum[30];
            booth_psum[31] <= psum[31];
            booth_psum[32] <= psum[32];
        end
        else begin
            booth_vld      <= 0;
            booth_iid      <= 0;
            booth_op64     <= 0;
            booth_funct3   <= 0;
            booth_pdst     <= 0;
            booth_psum[0]  <= 0;
            booth_psum[1]  <= 0;
            booth_psum[2]  <= 0;
            booth_psum[3]  <= 0;
            booth_psum[4]  <= 0;
            booth_psum[5]  <= 0;
            booth_psum[6]  <= 0;
            booth_psum[7]  <= 0;
            booth_psum[8]  <= 0;
            booth_psum[9]  <= 0;
            booth_psum[10] <= 0;
            booth_psum[11] <= 0;
            booth_psum[12] <= 0;
            booth_psum[13] <= 0;
            booth_psum[14] <= 0;
            booth_psum[15] <= 0;
            booth_psum[16] <= 0;
            booth_psum[17] <= 0;
            booth_psum[18] <= 0;
            booth_psum[19] <= 0;
            booth_psum[20] <= 0;
            booth_psum[21] <= 0;
            booth_psum[22] <= 0;
            booth_psum[23] <= 0;
            booth_psum[24] <= 0;
            booth_psum[25] <= 0;
            booth_psum[26] <= 0;
            booth_psum[27] <= 0;
            booth_psum[28] <= 0;
            booth_psum[29] <= 0;
            booth_psum[30] <= 0;
            booth_psum[31] <= 0;
            booth_psum[32] <= 0;
        end
    end

    wallace_33 wallace_33(
        .in0        ( booth_psum[0]   ),
        .in1        ( booth_psum[1]   ),
        .in2        ( booth_psum[2]   ),
        .in3        ( booth_psum[3]   ),
        .in4        ( booth_psum[4]   ),
        .in5        ( booth_psum[5]   ),
        .in6        ( booth_psum[6]   ),
        .in7        ( booth_psum[7]   ),
        .in8        ( booth_psum[8]   ),
        .in9        ( booth_psum[9]   ),
        .in10       ( booth_psum[10]  ),
        .in11       ( booth_psum[11]  ),
        .in12       ( booth_psum[12]  ),
        .in13       ( booth_psum[13]  ),
        .in14       ( booth_psum[14]  ),
        .in15       ( booth_psum[15]  ),
        .in16       ( booth_psum[16]  ),
        .in17       ( booth_psum[17]  ),
        .in18       ( booth_psum[18]  ),
        .in19       ( booth_psum[19]  ),
        .in20       ( booth_psum[20]  ),
        .in21       ( booth_psum[21]  ),
        .in22       ( booth_psum[22]  ),
        .in23       ( booth_psum[23]  ),
        .in24       ( booth_psum[24]  ),
        .in25       ( booth_psum[25]  ),
        .in26       ( booth_psum[26]  ),
        .in27       ( booth_psum[27]  ),
        .in28       ( booth_psum[28]  ),
        .in29       ( booth_psum[29]  ),
        .in30       ( booth_psum[30]  ),
        .in31       ( booth_psum[31]  ),
        .in32       ( booth_psum[32]  ),
        .out0       ( treeout0        ),
        .out1       ( treeout1        )
    );

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            wallace_vld      <= 0;
            wallace_iid      <= 0;
            wallace_op64     <= 0;
            wallace_funct3   <= 0;
            wallace_pdst     <= 0;
            wallace_treeout0 <= 0;
            wallace_treeout1 <= 0;
        end
        else if (rtu_global_flush) begin
            wallace_vld      <= 0;
            wallace_iid      <= 0;
            wallace_op64     <= 0;
            wallace_funct3   <= 0;
            wallace_pdst     <= 0;
            wallace_treeout0 <= 0;
            wallace_treeout1 <= 0;
        end
        else if (booth_vld) begin
            wallace_vld      <= 1;
            wallace_iid      <= booth_iid;
            wallace_op64     <= booth_op64;
            wallace_funct3   <= booth_funct3;
            wallace_pdst     <= booth_pdst;
            wallace_treeout0 <= treeout0;
            wallace_treeout1 <= treeout1;
        end
        else begin
            wallace_vld      <= 0;
            wallace_iid      <= 0;
            wallace_op64     <= 0;
            wallace_funct3   <= 0;
            wallace_pdst     <= 0;
            wallace_treeout0 <= 0;
            wallace_treeout1 <= 0;
        end
    end

    add64 add64_l(
        .operand1 	( wallace_treeout0[63:0]  ),
        .operand2 	( wallace_treeout1[63:0]  ),
        .c0       	( 0                       ),
        .result   	( result_l                ),
        .carry    	( add_l64_c               )
    );

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            add_l_vld        = 0;
            add_l_iid        = 0;
            add_l_op64       = 0;
            add_l_funct3     = 0;
            add_l_pdst       = 0;
            add_l_treeout0_h = 0;
            add_l_treeout1_h = 0;
            add_l_result_l   = 0;
            add_l_c          = 0;
        end
        else if (rtu_global_flush) begin
            add_l_vld        = 0;
            add_l_iid        = 0;
            add_l_op64       = 0;
            add_l_funct3     = 0;
            add_l_pdst       = 0;
            add_l_treeout0_h = 0;
            add_l_treeout1_h = 0;
            add_l_result_l   = 0;
            add_l_c          = 0;
        end
        else if (wallace_vld) begin
            add_l_vld        = 1;
            add_l_iid        = wallace_iid;
            add_l_op64       = wallace_op64;
            add_l_funct3     = wallace_funct3;
            add_l_pdst       = wallace_pdst;
            add_l_treeout0_h = wallace_treeout0[127:64];
            add_l_treeout1_h = wallace_treeout1[127:64];
            add_l_result_l   = result_l;
            add_l_c          = add_l64_c;
        end
        else begin
            add_l_vld        = 0;
            add_l_iid        = 0;
            add_l_op64       = 0;
            add_l_funct3     = 0;
            add_l_pdst       = 0;
            add_l_treeout0_h = 0;
            add_l_treeout1_h = 0;
            add_l_result_l   = 0;
            add_l_c          = 0;
        end
    end

    add64 add64_h(
        .operand1 	( add_l_treeout0_h  ),
        .operand2 	( add_l_treeout1_h  ),
        .c0       	( add_l_c           ),
        .result   	( result_h          ),
        .carry    	( add_h64_c         )
    );

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            add_h_vld      <= 0;
            add_h_iid      <= 0;
            add_h_op64     <= 0;
            add_h_funct3   <= 0;
            add_h_pdst     <= 0;
            add_h_result_l <= 0;
            add_h_result_h <= 0;
        end
        else if (rtu_global_flush) begin
            add_h_vld      <= 0;
            add_h_iid      <= 0;
            add_h_op64     <= 0;
            add_h_funct3   <= 0;
            add_h_pdst     <= 0;
            add_h_result_l <= 0;
            add_h_result_h <= 0;
        end
        else if (add_l_vld) begin
            add_h_vld      <= 1;
            add_h_iid      <= add_l_iid;
            add_h_op64     <= add_l_op64;
            add_h_funct3   <= add_l_funct3;
            add_h_pdst     <= add_l_pdst;
            add_h_result_l <= add_l_result_l;
            add_h_result_h <= result_h;
        end
        else begin
            add_h_vld      <= 0;
            add_h_iid      <= 0;
            add_h_op64     <= 0;
            add_h_funct3   <= 0;
            add_h_pdst     <= 0;
            add_h_result_l <= 0;
            add_h_result_h <= 0;
        end
    end

    assign result_lh_sel = (add_h_funct3[1:0] == 2'b00) ? add_h_result_l
                                                        : add_h_result_h;

    assign exu_rtu_rob_mxu_complete = add_h_vld;
    assign exu_rtu_rob_mxu_iid      = add_h_iid;
    assign exu_idu_rf_mxu_wb_vld    = add_h_vld & (add_h_pdst != 0);
    assign exu_idu_rf_mxu_wb_preg   = add_h_pdst;
    assign exu_idu_rf_mxu_wb_data   = (add_h_op64) ? result_lh_sel
                                                   : {{32{result_lh_sel[31]}}, result_lh_sel[31:0]};


    assign exu_idu_is_mul1_forward_vld  = wallace_vld & (wallace_pdst != 0);
    assign exu_idu_is_mul1_forward_preg = wallace_pdst;
    assign exu_idu_is_mul2_forward_vld  = add_l_vld & (add_l_pdst != 0);
    assign exu_idu_is_mul2_forward_preg = add_l_pdst;

endmodule
