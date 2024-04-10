module compressor_4to2 (
    a,
    b,
    c,
    d,
    cin,
    s,
    co,
    cout
);
    // &Ports;
    input         a;
    input         b;
    input         c;
    input         d;
    input         cin;
    output        s;
    output        co;
    output        cout;

    // &Regs;

    // &Wires;
    wire        a;
    wire        b;
    wire        c;
    wire        d;
    wire        cin;
    wire        s;
    wire        co;
    wire        cout;
    wire        tmp1;
    wire        tmp2;

    assign tmp1 = (a & b) | (c & d);
    assign tmp2 = (a ^ b) ^ (c ^ d);

    assign cout = (a | b) & (c | d);
    assign co   = ~(~tmp1 | tmp2) | (tmp2 & cin);
    assign s    = tmp2 ^ cin;
endmodule
