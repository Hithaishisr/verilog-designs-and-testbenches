//2:1 MUX RTL

module mux2x1 (
    input s,
    input [1:0] I,
    output reg f
);

  always @(*) begin
    if (s == 0) f = I[0];
    else f = I[1];
  end

endmodule
