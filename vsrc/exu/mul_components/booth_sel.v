module booth_sel #(
    parameter WIDTH = 32
) (
    x,
    sel,
    psum,
    carry
);

    // &Ports;
    input  [WIDTH-1:0] x;
    input  [2      :0] sel;
    output [WIDTH  :0] psum;
    output             carry;

    // &Regs;;

    // &Wires;
    wire [WIDTH-1:0] x;
    wire [2      :0] sel;
    wire [WIDTH  :0] psum;
    wire             carry;
    wire             sel_neg;
    wire             sel_pos;
    wire             sel_dneg;
    wire             sel_dpos;

    assign sel_neg  =  sel[2] & (sel[1] ^ sel[0]);
    assign sel_pos  = ~sel[2] & (sel[1] ^ sel[0]);
    assign sel_dneg =  sel[2] & ~sel[1] & ~sel[0];
    assign sel_dpos = ~sel[2] &  sel[1] &  sel[0];

    assign psum  = sel_neg  ? ~{x[WIDTH-1], x} :
                   sel_pos  ?  {x[WIDTH-1], x} :
                   sel_dneg ? ~{x, 1'b0}       :
                   sel_dpos ?  {x, 1'b0}       :
                               {(WIDTH+1){1'b0}};
    assign carry = sel[2] & ~(sel[1] & sel[0]);

endmodule
