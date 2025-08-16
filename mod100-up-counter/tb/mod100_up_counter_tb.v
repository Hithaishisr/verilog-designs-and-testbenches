//Testbench for MOD 100 UP Counter

module mod100_up_counter_tb;

  reg clk, rst;
  wire [7:0] F;

  mod100_up_counter DUT (
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
