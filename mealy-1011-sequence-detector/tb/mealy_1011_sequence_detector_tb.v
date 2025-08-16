//Testbech for Melay FSM 1011 Sequence Generator
module mealy_1011_sequence_detector_tb;

  reg clk, rst, i;
  wire f;

  mealy_1011_sequence_detector DUT (
      clk,
      rst,
      i,
      f
  );

  task initialize;
    begin
      {clk, i} = 0;
      rst = 1;
    end
  endtask

  always #5 clk = ~clk;

  task in;
    input I;
    begin
      @(negedge clk) i = I;
    end
  endtask

  initial begin
    initialize;
    @(negedge clk) rst = 0;
    in(0);
    in(1);
    in(0);
    in(1);
    in(1);
    in(0);
    in(1);
    in(1);
    #20 $finish;
  end

endmodule
