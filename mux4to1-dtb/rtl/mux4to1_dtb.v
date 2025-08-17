//4:1 MUX using Decoder and Tristate Buffer RTL

module mux4to1_dtb (
    input [1:0] s,
    input [3:0] I,
    output f
);

  wire [3:0] w;

  decoder_2to4 D1 (
      s[1],
      s[0],
      w[3:0]
  );

  tristate_buffer T1 (
      I[0],
      w[0],
      f
  );

  tristate_buffer T2 (
      I[1],
      w[1],
      f
  );

  tristate_buffer T3 (
      I[2],
      w[2],
      f
  );

  tristate_buffer T4 (
      I[3],
      w[3],
      f
  );

endmodule
