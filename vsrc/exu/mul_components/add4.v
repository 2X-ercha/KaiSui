module add4 (
    g,
    p,
    c0,
    c
);
    // &Ports;
    input  [3 :0] g;
    input  [3 :0] p;
    input         c0;
    output [3 :0] c;

    // &Regs;

    // &Wires;
    wire [3 :0] g;
    wire [3 :0] p;
    wire        c0;
    wire [3 :0] c;

    assign c[0] = g[0] | (p[0] & c0);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c0);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c0);
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c0);

endmodule

