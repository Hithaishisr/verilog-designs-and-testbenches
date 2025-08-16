// ============================================================
// Module: mod100_up_counter
// Function: 00 → 99 decimal up-counter
// Built using two cascaded mod-10 up counters
// Output: [7:4] = Tens digit, [3:0] = Ones digit
// ============================================================

module mod100_up_counter (
    input clk,
    rst,
    output [7:0] F
);

  mod10_up_counter_flagged M1 (
      clk,
      rst,
      F[3:0]
  );
  mod10_up_counter_flagged M2 (
      (F[3:0] == 4'd0),
      rst,
      F[7:4]
  );

endmodule
