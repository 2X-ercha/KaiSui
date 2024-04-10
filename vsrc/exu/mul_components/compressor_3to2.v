module compressor_3to2 (
    a,
    b,
    cin,
    s,
    cout
);
    // &Ports;
    input         a;
    input         b;
    input         cin;
    output        s;
    output        cout;

    // &Regs;

    // &WIres;
    wire        a;
    wire        b;
    wire        cin;
    wire        s;
    wire        cout;

    assign cout = (a & b) | (a & cin) | (b & cin);
    assign s    = a ^ b ^ cin;
endmodule
