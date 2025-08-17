//4bit SISO right Shift Register RTL

module siso_4bit_rshift (
    input clk,
    rst,
    i,
    output reg f
);

  reg [2:0] w;

  always @(posedge clk) begin
    if (rst) begin
      {w, f} <= 0;
    end else begin
      f <= w[2];
      w[2] <= w[1];
      w[1] <= w[0];
      w[0] <= i;
    end
  end

endmodule
