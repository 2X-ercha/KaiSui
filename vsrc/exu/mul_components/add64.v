module add64 (
    operand1,
    operand2,
    c0,
    result,
    carry
);
    // &Ports;
    input  [63:0] operand1;
    input  [63:0] operand2;
    input         c0;
    output [63:0] result;
    output        carry;

    // &Regs;

    // &Wires;
    wire [63:0] operand1;
    wire [63:0] operand2;
    wire        c0;
    wire [63:0] result;
    wire        carry;
    wire [63:0] g;
    wire [63:0] p;
    wire [64:0] c;
    wire [15:0] P4;
    wire [15:0] G4;
    wire [3 :0] P16;
    wire [3 :0] G16;

    assign g = operand1 & operand2;
    assign p = operand1 | operand2;
    assign c[0] = c0;

    // 进位计算
    // 从pi和gi输入到所有进位输出的最长路径的延迟为10级门
    // 16 个 4位先行进位加法器并行计算：
    add4_PG add4_PG_63_60 (.g(g[63:60]), .p(p[63:60]), .c0(c[60]), .c(c[63:61]), .P(P4[15]), .G(G4[15]));
    add4_PG add4_PG_59_56 (.g(g[59:56]), .p(p[59:56]), .c0(c[56]), .c(c[59:57]), .P(P4[14]), .G(G4[14]));
    add4_PG add4_PG_55_52 (.g(g[55:52]), .p(p[55:52]), .c0(c[52]), .c(c[55:53]), .P(P4[13]), .G(G4[13]));
    add4_PG add4_PG_51_48 (.g(g[51:48]), .p(p[51:48]), .c0(c[48]), .c(c[51:49]), .P(P4[12]), .G(G4[12]));

    add4_PG add4_PG_47_44 (.g(g[47:44]), .p(p[47:44]), .c0(c[44]), .c(c[47:45]), .P(P4[11]), .G(G4[11]));
    add4_PG add4_PG_43_40 (.g(g[43:40]), .p(p[43:40]), .c0(c[40]), .c(c[43:41]), .P(P4[10]), .G(G4[10]));
    add4_PG add4_PG_39_36 (.g(g[39:36]), .p(p[39:36]), .c0(c[36]), .c(c[39:37]), .P(P4[9 ]), .G(G4[9 ]));
    add4_PG add4_PG_35_32 (.g(g[35:32]), .p(p[35:32]), .c0(c[32]), .c(c[35:33]), .P(P4[8 ]), .G(G4[8 ]));

    add4_PG add4_PG_31_28 (.g(g[31:28]), .p(p[31:28]), .c0(c[28]), .c(c[31:29]), .P(P4[7 ]), .G(G4[7 ]));
    add4_PG add4_PG_27_24 (.g(g[27:24]), .p(p[27:24]), .c0(c[24]), .c(c[27:25]), .P(P4[6 ]), .G(G4[6 ]));
    add4_PG add4_PG_23_20 (.g(g[23:20]), .p(p[23:20]), .c0(c[20]), .c(c[23:21]), .P(P4[5 ]), .G(G4[5 ]));
    add4_PG add4_PG_19_16 (.g(g[19:16]), .p(p[19:16]), .c0(c[16]), .c(c[19:17]), .P(P4[4 ]), .G(G4[4 ]));

    add4_PG add4_PG_15_12 (.g(g[15:12]), .p(p[15:12]), .c0(c[12]), .c(c[15:13]), .P(P4[3 ]), .G(G4[3 ]));
    add4_PG add4_PG_11_08 (.g(g[11:8 ]), .p(p[11:8 ]), .c0(c[8 ]), .c(c[11:9 ]), .P(P4[2 ]), .G(G4[2 ]));
    add4_PG add4_PG_07_04 (.g(g[7 :4 ]), .p(p[7 :4 ]), .c0(c[4 ]), .c(c[7 :5 ]), .P(P4[1 ]), .G(G4[1 ]));
    add4_PG add4_PG_03_00 (.g(g[3 :0 ]), .p(p[3 :0 ]), .c0(c[0 ]), .c(c[3 :1 ]), .P(P4[0 ]), .G(G4[0 ]));

    // 4 个 4位先行进位加法器：
    add4_PG add4_PG_63_48 (.g(G4[15:12]), .p(P4[15:12]), .c0(c[48]), .c({c[60], c[56], c[52]}), .P(P16[3]), .G(G16[3]));
    add4_PG add4_PG_47_32 (.g(G4[11:8 ]), .p(P4[11:8 ]), .c0(c[32]), .c({c[44], c[40], c[36]}), .P(P16[2]), .G(G16[2]));
    add4_PG add4_PG_31_16 (.g(G4[7 :4 ]), .p(P4[7 :4 ]), .c0(c[16]), .c({c[28], c[24], c[20]}), .P(P16[1]), .G(G16[1]));
    add4_PG add4_PG_15_00 (.g(G4[3 :0 ]), .p(P4[3 :0 ]), .c0(c[0 ]), .c({c[12], c[8 ], c[4 ]}), .P(P16[0]), .G(G16[0]));

    // 1 个 4位先行进位加法器，这个不需要输出P、G
    add4    add4_63_00    (.g(G16[3:0]), .p(P16[3:0]), .c0(c[0 ]), .c({c[64], c[48], c[32], c[16]}));

    // 求结果
    assign carry  = c[64];
    assign result = (~operand1 & ~operand2 & c[63:0]) | (~operand1 & operand2 & ~c[63:0]) | operand1 & ~operand2 & ~c[63:0] | (operand1 & operand2 & c[63:0]);

endmodule
