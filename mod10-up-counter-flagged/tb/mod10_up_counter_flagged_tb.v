// Testbench for MOD-10 Up Counter with flag-based control (counter resets at 9, uses flag to manage increment/hold)

module mod10_up_counter_flagged_tb;

  reg clk, rst;
  wire [7:0] F;

  mod10_up_counter_flagged DUT (
      clk,
      rst,
      F
  );

  task initialize;
    begin
      {clk, rst} = 2'd1;
    end
  endtask

  always #5 clk = ~clk;

  initial begin
    initialize;
    @(negedge clk) rst = 1'b0;
    #1100 $finish;
  end

endmodule
