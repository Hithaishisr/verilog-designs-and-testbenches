// Generates a clock divided by 3 with ~50% duty cycle

module clk_div3_50pct (
    input  clk,
    rst,
    output f
);

  reg [1:0] d1;
  reg d2;

  always @(posedge clk) begin
    if (rst) d1 = 0;
    else if (d1 == 0) d1 = 1;
    else if (d1 == 1) d1 = 3;
    else d1 = 0;
  end

  always @(negedge clk) begin
    if (rst) d2 = 0;
    else d2 = d1[0];
  end

  assign f = d2 & d1[0];

endmodule
