//Testbench for Moore 100 & 010 Overlapping Toggle

module moore_seq_detector_100_010_tb;

  reg clk, rst, i;
  wire f;

  moore_seq_detector_100_010 DUT (
      clk,
      rst,
      i,
      f
  );

  task initialize;
    begin
      {clk} = 0;
      rst   = 1;
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
    in(1);
    in(0);
    in(0);
    in(1);
    in(0);
    in(0);
    in(1);
    in(1);
    in(0);
    in(1);
    in(0);
    in(1);
    in(0);
    in(0);
    #20 $finish;
  end

endmodule
