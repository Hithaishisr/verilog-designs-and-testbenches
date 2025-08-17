//4-bit Synchronous UP-DOWN Counter RTL

module sync_updown_counter_4bit (
    input clk,
    rst,
    load,
    control,
    input [3:0] i,
    output reg [3:0] q
);

  always @(posedge clk) begin
    if (rst) q <= 0;
    else if (load) q <= i;
    else if (control) q <= q + 1;
    else q <= q - 1;
  end

endmodule
