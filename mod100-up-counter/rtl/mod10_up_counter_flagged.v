// RTL for MOD-10 Up Counter with flag-based control (counter resets at 9, uses flag to manage increment/hold)

module mod10_up_counter_flagged (
    input clk,
    rst,
    output reg [3:0] f
);

  reg flag;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      f <= 4'd0;
      flag <= 0;
    end else if (flag) begin
      f <= f + 1'b1;
      flag <= 0;
    end else if (f == 4'd9) begin
      f <= 4'd0;
      flag <= 1;
    end else f <= f + 1'b1;
  end

endmodule
