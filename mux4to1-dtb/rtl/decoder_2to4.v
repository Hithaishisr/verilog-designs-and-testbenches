//2x4 decoder using Dataflow abstraction RTL

module decoder_2to4 (
    input a,
    b,
    output [3:0] I
);

  assign I[0] = (~a & ~b);
  assign I[1] = (~a & b);
  assign I[2] = (a & ~b);
  assign I[3] = (a & b);

endmodule
