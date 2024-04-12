module exu_mxu_div (
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
    exu_idu_is_div_stall_ctrl,
    exu_rtu_rob_div_complete,
    exu_rtu_rob_div_iid,
    exu_idu_rf_div_wb_vld,
    exu_idu_rf_div_wb_preg,
    exu_idu_rf_div_wb_data,
    exu_idu_is_div1_forward_vld,
    exu_idu_is_div1_forward_preg,
    exu_idu_is_div2_forward_vld,
    exu_idu_is_div2_forward_preg
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
    output        exu_idu_is_div_stall_ctrl;
    output        exu_rtu_rob_div_complete;
    output [4 :0] exu_rtu_rob_div_iid;
    output        exu_idu_rf_div_wb_vld;
    output [5 :0] exu_idu_rf_div_wb_preg;
    output [63:0] exu_idu_rf_div_wb_data;
    output        exu_idu_is_div1_forward_vld;
    output [5 :0] exu_idu_is_div1_forward_preg;
    output        exu_idu_is_div2_forward_vld;
    output [5 :0] exu_idu_is_div2_forward_preg;

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
    reg [5 :0] cnt;
    reg [127:0] x;
    reg        run;

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
    wire        exu_idu_is_div_stall_ctrl;
    wire        exu_rtu_rob_div_complete;
    wire [4 :0] exu_rtu_rob_div_iid;
    wire        exu_idu_rf_div_wb_vld;
    wire [5 :0] exu_idu_rf_div_wb_preg;
    wire [63:0] exu_idu_rf_div_wb_data;
    wire        exu_idu_is_div1_forward_vld;
    wire [5 :0] exu_idu_is_div1_forward_preg;
    wire        exu_idu_is_div2_forward_vld;
    wire [5 :0] exu_idu_is_div2_forward_preg;
    wire        R_alu64;
    wire [63:0] operand1;
    wire [63:0] operand2;
    wire [63:0] s;
    wire [64:0] r0;
    wire [64:0] r1;
    wire [64:0] r2;
    wire [64:0] r3;
    wire [64:0] r4;
    wire [64:0] r5;
    wire [64:0] r6;
    wire [64:0] r7;
    wire [64:0] r8;
    wire [64:0] r9;
    wire [64:0] r10;
    wire [64:0] r11;
    wire [64:0] r12;
    wire [64:0] r13;
    wire [64:0] r14;
    wire [64:0] r15;
    wire [64:0] r16;
    wire [64:0] r17;
    wire [64:0] r18;
    wire [64:0] r19;
    wire [64:0] r20;
    wire [64:0] r21;
    wire [64:0] r22;
    wire [64:0] r23;
    wire [64:0] r24;
    wire [64:0] r25;
    wire [64:0] r26;
    wire [64:0] r27;
    wire [64:0] r28;
    wire [64:0] r29;
    wire [64:0] r30;
    wire [64:0] r31;
    wire [64:0] r32;
    wire [64:0] r33;
    wire [64:0] r34;
    wire [64:0] r35;
    wire [64:0] r36;
    wire [64:0] r37;
    wire [64:0] r38;
    wire [64:0] r39;
    wire [64:0] r40;
    wire [64:0] r41;
    wire [64:0] r42;
    wire [64:0] r43;
    wire [64:0] r44;
    wire [64:0] r45;
    wire [64:0] r46;
    wire [64:0] r47;
    wire [64:0] r48;
    wire [64:0] r49;
    wire [64:0] r50;
    wire [64:0] r51;
    wire [64:0] r52;
    wire [64:0] r53;
    wire [64:0] r54;
    wire [64:0] r55;
    wire [64:0] r56;
    wire [64:0] r57;
    wire [64:0] r58;
    wire [64:0] r59;
    wire [64:0] r60;
    wire [64:0] r61;
    wire [64:0] r62;
    wire [64:0] r63;
    wire        sign;
    wire        sign_quo;
    wire        sign_rem;
    wire [127:0] result_quo_rem;

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
        else if (idu_exu_mxu_vld & idu_exu_mxu_funct3[2] & (cnt == 0)) begin
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
        else if (run) begin
            vld         <= vld;
            iid         <= iid;
            opcode      <= opcode;
            funct7      <= funct7;
            funct3      <= funct3;
            psrc1_vld   <= psrc1_vld;
            psrc1_value <= psrc1_value;
            psrc2_vld   <= psrc2_vld;
            psrc2_value <= psrc2_value;
            pdst_vld    <= pdst_vld;
            pdst        <= pdst;
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
    assign sign     = ~funct3[0];
    assign sign_quo = operand1[63] ^ operand2[63];
    assign sign_rem = operand1[63];
    assign r63      = {64'b0, operand1[63]} - {1'b0, operand2[63:0]};
    assign r62      = x[126:62] - {1'b0, operand2[63:0]};
    assign r61      = x[125:61] - {1'b0, operand2[63:0]};
    assign r60      = x[124:60] - {1'b0, operand2[63:0]};
    assign r59      = x[123:59] - {1'b0, operand2[63:0]};
    assign r58      = x[122:58] - {1'b0, operand2[63:0]};
    assign r57      = x[121:57] - {1'b0, operand2[63:0]};
    assign r56      = x[120:56] - {1'b0, operand2[63:0]};
    assign r55      = x[119:55] - {1'b0, operand2[63:0]};
    assign r54      = x[118:54] - {1'b0, operand2[63:0]};
    assign r53      = x[117:53] - {1'b0, operand2[63:0]};
    assign r52      = x[116:52] - {1'b0, operand2[63:0]};
    assign r51      = x[115:51] - {1'b0, operand2[63:0]};
    assign r50      = x[114:50] - {1'b0, operand2[63:0]};
    assign r49      = x[113:49] - {1'b0, operand2[63:0]};
    assign r48      = x[112:48] - {1'b0, operand2[63:0]};
    assign r47      = x[111:47] - {1'b0, operand2[63:0]};
    assign r46      = x[110:46] - {1'b0, operand2[63:0]};
    assign r45      = x[109:45] - {1'b0, operand2[63:0]};
    assign r44      = x[108:44] - {1'b0, operand2[63:0]};
    assign r43      = x[107:43] - {1'b0, operand2[63:0]};
    assign r42      = x[106:42] - {1'b0, operand2[63:0]};
    assign r41      = x[105:41] - {1'b0, operand2[63:0]};
    assign r40      = x[104:40] - {1'b0, operand2[63:0]};
    assign r39      = x[103:39] - {1'b0, operand2[63:0]};
    assign r38      = x[102:38] - {1'b0, operand2[63:0]};
    assign r37      = x[101:37] - {1'b0, operand2[63:0]};
    assign r36      = x[100:36] - {1'b0, operand2[63:0]};
    assign r35      = x[99 :35] - {1'b0, operand2[63:0]};
    assign r34      = x[98 :34] - {1'b0, operand2[63:0]};
    assign r33      = x[97 :33] - {1'b0, operand2[63:0]};
    assign r32      = x[96 :32] - {1'b0, operand2[63:0]};
    assign r31      = x[95 :31] - {1'b0, operand2[63:0]};
    assign r30      = x[94 :30] - {1'b0, operand2[63:0]};
    assign r29      = x[93 :29] - {1'b0, operand2[63:0]};
    assign r28      = x[92 :28] - {1'b0, operand2[63:0]};
    assign r27      = x[91 :27] - {1'b0, operand2[63:0]};
    assign r26      = x[90 :26] - {1'b0, operand2[63:0]};
    assign r25      = x[89 :25] - {1'b0, operand2[63:0]};
    assign r24      = x[88 :24] - {1'b0, operand2[63:0]};
    assign r23      = x[87 :23] - {1'b0, operand2[63:0]};
    assign r22      = x[86 :22] - {1'b0, operand2[63:0]};
    assign r21      = x[85 :21] - {1'b0, operand2[63:0]};
    assign r20      = x[84 :20] - {1'b0, operand2[63:0]};
    assign r19      = x[83 :19] - {1'b0, operand2[63:0]};
    assign r18      = x[82 :18] - {1'b0, operand2[63:0]};
    assign r17      = x[81 :17] - {1'b0, operand2[63:0]};
    assign r16      = x[80 :16] - {1'b0, operand2[63:0]};
    assign r15      = x[79 :15] - {1'b0, operand2[63:0]};
    assign r14      = x[78 :14] - {1'b0, operand2[63:0]};
    assign r13      = x[77 :13] - {1'b0, operand2[63:0]};
    assign r12      = x[76 :12] - {1'b0, operand2[63:0]};
    assign r11      = x[75 :11] - {1'b0, operand2[63:0]};
    assign r10      = x[74 :10] - {1'b0, operand2[63:0]};
    assign r9       = x[73 :9 ] - {1'b0, operand2[63:0]};
    assign r8       = x[72 :8 ] - {1'b0, operand2[63:0]};
    assign r7       = x[71 :7 ] - {1'b0, operand2[63:0]};
    assign r6       = x[70 :6 ] - {1'b0, operand2[63:0]};
    assign r5       = x[69 :5 ] - {1'b0, operand2[63:0]};
    assign r4       = x[68 :4 ] - {1'b0, operand2[63:0]};
    assign r3       = x[67 :3 ] - {1'b0, operand2[63:0]};
    assign r2       = x[66 :2 ] - {1'b0, operand2[63:0]};
    assign r1       = x[65 :1 ] - {1'b0, operand2[63:0]};
    assign r0       = x[64 :0 ] - {1'b0, operand2[63:0]};
    assign s[63]    = ~r63[64];
    assign s[62]    = ~r62[64];
    assign s[61]    = ~r61[64];
    assign s[60]    = ~r60[64];
    assign s[59]    = ~r59[64];
    assign s[58]    = ~r58[64];
    assign s[57]    = ~r57[64];
    assign s[56]    = ~r56[64];
    assign s[55]    = ~r55[64];
    assign s[54]    = ~r54[64];
    assign s[53]    = ~r53[64];
    assign s[52]    = ~r52[64];
    assign s[51]    = ~r51[64];
    assign s[50]    = ~r50[64];
    assign s[49]    = ~r49[64];
    assign s[48]    = ~r48[64];
    assign s[47]    = ~r47[64];
    assign s[46]    = ~r46[64];
    assign s[45]    = ~r45[64];
    assign s[44]    = ~r44[64];
    assign s[43]    = ~r43[64];
    assign s[42]    = ~r42[64];
    assign s[41]    = ~r41[64];
    assign s[40]    = ~r40[64];
    assign s[39]    = ~r39[64];
    assign s[38]    = ~r38[64];
    assign s[37]    = ~r37[64];
    assign s[36]    = ~r36[64];
    assign s[35]    = ~r35[64];
    assign s[34]    = ~r34[64];
    assign s[33]    = ~r33[64];
    assign s[32]    = ~r32[64];
    assign s[31]    = ~r31[64];
    assign s[30]    = ~r30[64];
    assign s[29]    = ~r29[64];
    assign s[28]    = ~r28[64];
    assign s[27]    = ~r27[64];
    assign s[26]    = ~r26[64];
    assign s[25]    = ~r25[64];
    assign s[24]    = ~r24[64];
    assign s[23]    = ~r23[64];
    assign s[22]    = ~r22[64];
    assign s[21]    = ~r21[64];
    assign s[20]    = ~r20[64];
    assign s[19]    = ~r19[64];
    assign s[18]    = ~r18[64];
    assign s[17]    = ~r17[64];
    assign s[16]    = ~r16[64];
    assign s[15]    = ~r15[64];
    assign s[14]    = ~r14[64];
    assign s[13]    = ~r13[64];
    assign s[12]    = ~r12[64];
    assign s[11]    = ~r11[64];
    assign s[10]    = ~r10[64];
    assign s[9]     = ~r9[64];
    assign s[8]     = ~r8[64];
    assign s[7]     = ~r7[64];
    assign s[6]     = ~r6[64];
    assign s[5]     = ~r5[64];
    assign s[4]     = ~r4[64];
    assign s[3]     = ~r3[64];
    assign s[2]     = ~r2[64];
    assign s[1]     = ~r1[64];
    assign s[0]     = ~r0[64];

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk) begin
            cnt <= 0;
            x   <= 0;
        end
        else if (rtu_global_flush) begin
            cnt <= 0;
            x   <= 0;
        end
        else if (run) begin
            cnt <= cnt - 1;
            case (cnt)
                6'd0 : x <= (s[63]) ? {            1'b1, r63[63:0], operand1[62:0]} : {64'b0, operand1};
                6'd63: x <= (s[62]) ? {x[127]    , 1'b1, r62[63:0], operand1[61:0]} : x;
                6'd62: x <= (s[61]) ? {x[127:126], 1'b1, r61[63:0], operand1[60:0]} : x;
                6'd61: x <= (s[60]) ? {x[127:125], 1'b1, r60[63:0], operand1[59:0]} : x;
                6'd60: x <= (s[59]) ? {x[127:124], 1'b1, r59[63:0], operand1[58:0]} : x;
                6'd59: x <= (s[58]) ? {x[127:123], 1'b1, r58[63:0], operand1[57:0]} : x;
                6'd58: x <= (s[57]) ? {x[127:122], 1'b1, r57[63:0], operand1[56:0]} : x;
                6'd57: x <= (s[56]) ? {x[127:121], 1'b1, r56[63:0], operand1[55:0]} : x;
                6'd56: x <= (s[55]) ? {x[127:120], 1'b1, r55[63:0], operand1[54:0]} : x;
                6'd55: x <= (s[54]) ? {x[127:119], 1'b1, r54[63:0], operand1[53:0]} : x;
                6'd54: x <= (s[53]) ? {x[127:118], 1'b1, r53[63:0], operand1[52:0]} : x;
                6'd53: x <= (s[52]) ? {x[127:117], 1'b1, r52[63:0], operand1[51:0]} : x;
                6'd52: x <= (s[51]) ? {x[127:116], 1'b1, r51[63:0], operand1[50:0]} : x;
                6'd51: x <= (s[50]) ? {x[127:115], 1'b1, r50[63:0], operand1[49:0]} : x;
                6'd50: x <= (s[49]) ? {x[127:114], 1'b1, r49[63:0], operand1[48:0]} : x;
                6'd49: x <= (s[48]) ? {x[127:113], 1'b1, r48[63:0], operand1[47:0]} : x;
                6'd48: x <= (s[47]) ? {x[127:112], 1'b1, r47[63:0], operand1[46:0]} : x;
                6'd47: x <= (s[46]) ? {x[127:111], 1'b1, r46[63:0], operand1[45:0]} : x;
                6'd46: x <= (s[45]) ? {x[127:110], 1'b1, r45[63:0], operand1[44:0]} : x;
                6'd45: x <= (s[44]) ? {x[127:109], 1'b1, r44[63:0], operand1[43:0]} : x;
                6'd44: x <= (s[43]) ? {x[127:108], 1'b1, r43[63:0], operand1[42:0]} : x;
                6'd43: x <= (s[42]) ? {x[127:107], 1'b1, r42[63:0], operand1[41:0]} : x;
                6'd42: x <= (s[41]) ? {x[127:106], 1'b1, r41[63:0], operand1[40:0]} : x;
                6'd41: x <= (s[40]) ? {x[127:105], 1'b1, r40[63:0], operand1[39:0]} : x;
                6'd40: x <= (s[39]) ? {x[127:104], 1'b1, r39[63:0], operand1[38:0]} : x;
                6'd39: x <= (s[38]) ? {x[127:103], 1'b1, r38[63:0], operand1[37:0]} : x;
                6'd38: x <= (s[37]) ? {x[127:102], 1'b1, r37[63:0], operand1[36:0]} : x;
                6'd37: x <= (s[36]) ? {x[127:101], 1'b1, r36[63:0], operand1[35:0]} : x;
                6'd36: x <= (s[35]) ? {x[127:100], 1'b1, r35[63:0], operand1[34:0]} : x;
                6'd35: x <= (s[34]) ? {x[127:99 ], 1'b1, r34[63:0], operand1[33:0]} : x;
                6'd34: x <= (s[33]) ? {x[127:98 ], 1'b1, r33[63:0], operand1[32:0]} : x;
                6'd33: x <= (s[32]) ? {x[127:97 ], 1'b1, r32[63:0], operand1[31:0]} : x;
                6'd32: x <= (s[31]) ? {x[127:96 ], 1'b1, r31[63:0], operand1[30:0]} : x;
                6'd31: x <= (s[30]) ? {x[127:95 ], 1'b1, r30[63:0], operand1[29:0]} : x;
                6'd30: x <= (s[29]) ? {x[127:94 ], 1'b1, r29[63:0], operand1[28:0]} : x;
                6'd29: x <= (s[28]) ? {x[127:93 ], 1'b1, r28[63:0], operand1[27:0]} : x;
                6'd28: x <= (s[27]) ? {x[127:92 ], 1'b1, r27[63:0], operand1[26:0]} : x;
                6'd27: x <= (s[26]) ? {x[127:91 ], 1'b1, r26[63:0], operand1[25:0]} : x;
                6'd26: x <= (s[25]) ? {x[127:90 ], 1'b1, r25[63:0], operand1[24:0]} : x;
                6'd25: x <= (s[24]) ? {x[127:89 ], 1'b1, r24[63:0], operand1[23:0]} : x;
                6'd24: x <= (s[23]) ? {x[127:88 ], 1'b1, r23[63:0], operand1[22:0]} : x;
                6'd23: x <= (s[22]) ? {x[127:87 ], 1'b1, r22[63:0], operand1[21:0]} : x;
                6'd22: x <= (s[21]) ? {x[127:86 ], 1'b1, r21[63:0], operand1[20:0]} : x;
                6'd21: x <= (s[20]) ? {x[127:85 ], 1'b1, r20[63:0], operand1[19:0]} : x;
                6'd20: x <= (s[19]) ? {x[127:84 ], 1'b1, r19[63:0], operand1[18:0]} : x;
                6'd19: x <= (s[18]) ? {x[127:83 ], 1'b1, r18[63:0], operand1[17:0]} : x;
                6'd18: x <= (s[17]) ? {x[127:82 ], 1'b1, r17[63:0], operand1[16:0]} : x;
                6'd17: x <= (s[16]) ? {x[127:81 ], 1'b1, r16[63:0], operand1[15:0]} : x;
                6'd16: x <= (s[15]) ? {x[127:80 ], 1'b1, r15[63:0], operand1[14:0]} : x;
                6'd15: x <= (s[14]) ? {x[127:79 ], 1'b1, r14[63:0], operand1[13:0]} : x;
                6'd14: x <= (s[13]) ? {x[127:78 ], 1'b1, r13[63:0], operand1[12:0]} : x;
                6'd13: x <= (s[12]) ? {x[127:77 ], 1'b1, r12[63:0], operand1[11:0]} : x;
                6'd12: x <= (s[11]) ? {x[127:76 ], 1'b1, r11[63:0], operand1[10:0]} : x;
                6'd11: x <= (s[10]) ? {x[127:75 ], 1'b1, r10[63:0], operand1[9 :0]} : x;
                6'd10: x <= (s[9 ]) ? {x[127:74 ], 1'b1, r9[63:0] , operand1[8 :0]} : x;
                6'd9 : x <= (s[8 ]) ? {x[127:73 ], 1'b1, r8[63:0] , operand1[7 :0]} : x;
                6'd8 : x <= (s[7 ]) ? {x[127:72 ], 1'b1, r7[63:0] , operand1[6 :0]} : x;
                6'd7 : x <= (s[6 ]) ? {x[127:71 ], 1'b1, r6[63:0] , operand1[5 :0]} : x;
                6'd6 : x <= (s[5 ]) ? {x[127:70 ], 1'b1, r5[63:0] , operand1[4 :0]} : x;
                6'd5 : x <= (s[4 ]) ? {x[127:69 ], 1'b1, r4[63:0] , operand1[3 :0]} : x;
                6'd4 : x <= (s[3 ]) ? {x[127:68 ], 1'b1, r3[63:0] , operand1[2 :0]} : x;
                6'd3 : x <= (s[2 ]) ? {x[127:67 ], 1'b1, r2[63:0] , operand1[1 :0]} : x;
                6'd2 : x <= (s[1 ]) ? {x[127:66 ], 1'b1, r1[63:0] , operand1[0]   } : x;
                6'd1 : x <= (s[0 ]) ? {x[127:65 ], 1'b1, r0[63:0]                 } : x;
                default: x <= 0;
            endcase
        end
        else begin
            cnt <= 0;
            x   <= 0;
        end
    end

    always @(posedge clk or negedge rst_clk)
    begin
        if (!rst_clk)
            run <= 0;
        else if (rtu_global_flush)
            run <= 0;
        else if (idu_exu_mxu_vld & idu_exu_mxu_funct3[2] & (cnt == 0))
            run <= 1;
        else if (cnt == 1)
            run <= 0;
        else
            run <= run;
    end

    assign result_quo_rem           = (sign) ? {sign_quo, x[126:64], sign_rem, x[62:0]}
                                             : x;

    assign exu_rtu_rob_div_complete = vld & (cnt == 0) & ~run;
    assign exu_rtu_rob_div_iid      = iid;
    assign exu_idu_rf_div_wb_vld    = pdst_vld & vld & (cnt == 0) & ~run;
    assign exu_idu_rf_div_wb_preg   = pdst;
    assign exu_idu_rf_div_wb_data   = (funct3[1]) ? result_quo_rem[63:0]
                                                  : result_quo_rem[127:64];

    assign exu_idu_is_div1_forward_vld  = vld & (cnt == 2);
    assign exu_idu_is_div1_forward_preg = pdst;
    assign exu_idu_is_div2_forward_vld  = vld & (cnt == 1);
    assign exu_idu_is_div2_forward_preg = pdst;

    assign exu_idu_is_div_stall_ctrl = ($unsigned(cnt) > 1) | (run & (cnt == 0));

endmodule
