//Testbench for Moore FSM 0101 sequence detector

module moore_seq0101_detector_tb;

  reg clk, rst, i;
  wire f;

  moore_seq0101_detector DUT (
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
    in(0);
    in(1);
    in(1);
    in(0);
    in(1);
    in(0);
    in(1);
    #10 $finish;
  end

endmodule
