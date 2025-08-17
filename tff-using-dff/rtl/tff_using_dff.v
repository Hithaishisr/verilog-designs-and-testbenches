//T Flip Flop using D Flip Flop RTL

module tff_using_dff (
    input  clk,
    rst,
    t,
    output q,
    qbar
);

  dff d (
      clk,
      rst,
      (t ^ q),
      q,
      qbar
  );

endmodule
