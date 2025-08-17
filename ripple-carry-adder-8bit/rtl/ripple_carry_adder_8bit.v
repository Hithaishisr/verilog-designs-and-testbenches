// RTL for an 8-bit Ripple Carry Adder (RCA) using generate loops for full adders

module ripple_carry_adder_8bit (
    A,
    B,
    Cin,
    S,
    Cout
);

  input [7:0] A, B;
  input Cin;
  output [7:0] S;
  output Cout;

  wire [6:0] w;
  genvar i;

  full_adder FA1 (
      A[0],
      B[0],
      Cin,
      S[0],
      w[0]
  );
  generate
    for (i = 1; i < 7; i = i + 1) begin : rippler
      full_adder FA2 (
          A[i],
          B[i],
          w[i-1],
          S[i],
          w[i]
      );
    end
  endgenerate
  full_adder FA3 (
      A[7],
      B[7],
      w[6],
      S[7],
      Cout
  );

endmodule
