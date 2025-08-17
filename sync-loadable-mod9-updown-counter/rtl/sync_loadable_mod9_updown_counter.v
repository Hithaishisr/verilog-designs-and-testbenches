// Synchronous, loadable MOD-9 Up-Down Counter
// - Counts from 0 to 8 in up or down direction based on 'control' signal
// - Can be synchronously loaded with a 4-bit input 'I' when 'load' is high
// - Resets to 0 when 'rst' is high
// - Output 'q' holds the current count

module sync_loadable_mod9_updown_counter (
    input clk,
    rst,
    load,
    control,
    input [3:0] I,
    output reg [3:0] q
);

  always @(posedge clk) begin
    if (rst) q <= 4'd0;
    else if (load && I < 9) q <= I;
    else if (control && q < 8) q <= q + 1;
    else if (control && q == 8) q <= 0;
    else if (~control && q == 4'd0) q <= 8;
    else q <= q - 1;
  end

endmodule
