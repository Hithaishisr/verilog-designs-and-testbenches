//4:1 MUX RTL

module mux4x1 (
    input [1:0] s,
    input [3:0] I,
    output f
);

  wire [1:0] w;

  mux2x1 M1 (
      s[0],
      I[1:0],
      w[0]
  );
  mux2x1 M2 (
      s[0],
      I[3:2],
      w[1]
  );
  mux2x1 M3 (
      s[1],
      w[1:0],
      f
  );

endmodule
