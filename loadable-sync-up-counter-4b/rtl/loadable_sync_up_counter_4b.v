//4-bit synchronous and loadable binary up counter RTL

module loadable_sync_up_counter_4b (
    input clk,
    rst,
    load,
    input [3:0] i,
    output reg [3:0] q
);

  always @(posedge clk, posedge rst) begin
    if (rst) begin
      q <= 4'd0;
    end else if (load) begin
      q <= i;
    end else begin
      q <= q + 1;
    end
  end

endmodule
