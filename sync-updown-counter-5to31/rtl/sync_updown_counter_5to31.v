// RTL for a Synchronous Up-Down Counter (Range: 5 to 31, Wrap-Around Enabled)

module sync_updown_counter_5to31 (
    clk,
    rst,
    i,
    load,
    mode,
    q
);

  input clk, rst, load, mode;
  input [4:0] i;
  output reg [4:0] q;

  always @(posedge clk) begin
    if (rst) q <= 5;
    else if (load && i >= 5 && i <= 31) q <= i;
    else if (mode) begin
      if (q == 31) q <= 5;
      else q <= q + 1;
    end else begin
      if (q == 5) q <= 31;
      else q <= q - 1;
    end
  end

endmodule
