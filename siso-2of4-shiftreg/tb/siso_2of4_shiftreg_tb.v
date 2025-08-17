//Testbench code for SISO n bit shift register which shifts only first 2 clock cycles within every 4 clock cycles

module siso_2of4_shiftreg_tb;

  reg clk, rst, I;
  wire F;
  integer j;

  SISO_2cycles DUT (
      clk,
      rst,
      I,
      F
  );

  task initialize;
    begin
      {clk, I} = 0;
      rst = 1;
    end
  endtask

  always #5 clk = ~clk;

  task stimulus;
    input integer i;
    begin
      @(negedge clk) I = i;
    end
  endtask

  initial begin
    initialize;
    @(negedge clk) rst = 0;
    for (j = 0; j < 32; j = j + 1) begin
      stimulus({$random} % 2);
    end
    #30 $finish;
  end

endmodule
