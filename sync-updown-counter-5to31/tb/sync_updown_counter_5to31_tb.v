// Testbench for a Synchronous Up-Down Counter (Range: 5 to 31, Wrap-Around Enabled)

module sync_updown_counter_5to31_tb;

  reg clk, rst, load, mode;
  reg  [4:0] I;
  wire [4:0] q;

  MOD_5to31 DUT (
      clk,
      rst,
      I,
      load,
      mode,
      q
  );

  task initialize;
    begin
      {clk, load, mode, I} = 0;
      rst = 1;
    end
  endtask

  always #5 clk = ~clk;

  task load_in;
    input integer i;
    begin
      @(negedge clk) load = 1;
      I = i;
      @(negedge clk) load = 0;
    end
  endtask

  initial begin
    initialize;
    @(negedge clk) rst = 0;
    fork
      #30 load_in(8);
      #120 mode = 1;
    join
    #300 $finish;
  end

endmodule
