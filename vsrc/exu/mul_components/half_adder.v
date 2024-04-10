module half_adder (
    a,
    b,
    s,
    cout
);
    // &Ports;
    input         a;
    input         b;
    output        s;
    output        cout;

    // &Regs;

    // &Wires;
    wire        a;
    wire        b;
    wire        s;
    wire        cout;

    assign cout = a & b;
    assign s    = a ^ b;
endmodule
