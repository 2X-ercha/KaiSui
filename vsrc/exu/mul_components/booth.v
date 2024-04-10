module booth (
    x,
    y,
    psum0,
    psum1,
    psum2,
    psum3,
    psum4,
    psum5,
    psum6,
    psum7,
    psum8,
    psum9,
    psum10,
    psum11,
    psum12,
    psum13,
    psum14,
    psum15,
    psum16,
    psum17,
    psum18,
    psum19,
    psum20,
    psum21,
    psum22,
    psum23,
    psum24,
    psum25,
    psum26,
    psum27,
    psum28,
    psum29,
    psum30,
    psum31,
    psum32
);

    // &Ports;
    input  [65:0] x;
    input  [65:0] y;
    output [131:0] psum0;
    output [131:0] psum1;
    output [131:0] psum2;
    output [131:0] psum3;
    output [131:0] psum4;
    output [131:0] psum5;
    output [131:0] psum6;
    output [131:0] psum7;
    output [131:0] psum8;
    output [131:0] psum9;
    output [131:0] psum10;
    output [131:0] psum11;
    output [131:0] psum12;
    output [131:0] psum13;
    output [131:0] psum14;
    output [131:0] psum15;
    output [131:0] psum16;
    output [131:0] psum17;
    output [131:0] psum18;
    output [131:0] psum19;
    output [131:0] psum20;
    output [131:0] psum21;
    output [131:0] psum22;
    output [131:0] psum23;
    output [131:0] psum24;
    output [131:0] psum25;
    output [131:0] psum26;
    output [131:0] psum27;
    output [131:0] psum28;
    output [131:0] psum29;
    output [131:0] psum30;
    output [131:0] psum31;
    output [131:0] psum32;

    // &Regs;

    // &Wires
    wire [65:0] x;
    wire [65:0] y;
    wire [131:0] psum0;
    wire [131:0] psum1;
    wire [131:0] psum2;
    wire [131:0] psum3;
    wire [131:0] psum4;
    wire [131:0] psum5;
    wire [131:0] psum6;
    wire [131:0] psum7;
    wire [131:0] psum8;
    wire [131:0] psum9;
    wire [131:0] psum10;
    wire [131:0] psum11;
    wire [131:0] psum12;
    wire [131:0] psum13;
    wire [131:0] psum14;
    wire [131:0] psum15;
    wire [131:0] psum16;
    wire [131:0] psum17;
    wire [131:0] psum18;
    wire [131:0] psum19;
    wire [131:0] psum20;
    wire [131:0] psum21;
    wire [131:0] psum22;
    wire [131:0] psum23;
    wire [131:0] psum24;
    wire [131:0] psum25;
    wire [131:0] psum26;
    wire [131:0] psum27;
    wire [131:0] psum28;
    wire [131:0] psum29;
    wire [131:0] psum30;
    wire [131:0] psum31;
    wire [131:0] psum32;
    wire [131:0] psum [32:0];
    wire [66:0] psum_raw [32:0];
    wire        clow_raw [32:0];

    booth_sel #(.WIDTH(66)) b_sel_0(.x(x), .sel({y[1:0], 1'b0}), .psum(psum_raw[0]), .carry(clow_raw[0]));
    assign psum[0] = {{(66-1){psum_raw[0][66]}}, psum_raw[0]};

    generate
    for (genvar i = 1; i < 33; i++) begin
        booth_sel #(.WIDTH(66)) b_sel_(.x(x), .sel(y[2*i+1:2*i-1]), .psum(psum_raw[i]), .carry(clow_raw[i]));
        assign psum[i] = {{(66-1-2*i){psum_raw[i][66]}}, psum_raw[i], 1'b0, clow_raw[i-1], {(2*i-2){1'b0}}};
    end
    endgenerate

    assign psum0  = psum[0];
    assign psum1  = psum[1];
    assign psum2  = psum[2];
    assign psum3  = psum[3];
    assign psum4  = psum[4];
    assign psum5  = psum[5];
    assign psum6  = psum[6];
    assign psum7  = psum[7];
    assign psum8  = psum[8];
    assign psum9  = psum[9];
    assign psum10 = psum[10];
    assign psum11 = psum[11];
    assign psum12 = psum[12];
    assign psum13 = psum[13];
    assign psum14 = psum[14];
    assign psum15 = psum[15];
    assign psum16 = psum[16];
    assign psum17 = psum[17];
    assign psum18 = psum[18];
    assign psum19 = psum[19];
    assign psum20 = psum[20];
    assign psum21 = psum[21];
    assign psum22 = psum[22];
    assign psum23 = psum[23];
    assign psum24 = psum[24];
    assign psum25 = psum[25];
    assign psum26 = psum[26];
    assign psum27 = psum[27];
    assign psum28 = psum[28];
    assign psum29 = psum[29];
    assign psum30 = psum[30];
    assign psum31 = psum[31];
    assign psum32 = psum[32];
endmodule
