//Testbench for MOD 3 50% Duty Cycle Clock generator

module clk_div3_50pct_tb;

  reg clk, rst;
  wire f;

  clk_div3_50pct DUT (
      clk,
      rst,
      f
  );

  task initialize;
    begin
      clk = 0;
      rst = 1;
    end
  endtask

  always #5 clk = ~clk;

  initial begin
    initialize;
    @(negedge clk) rst = 0;
    #100 $finish;
  end

endmodule
