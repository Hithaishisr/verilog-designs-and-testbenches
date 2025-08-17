//Testbench for Synchronous loadable MOD-8 Up-Down Counter

module sync_loadable_mod9_updown_counter_tb;

  reg clk, rst, load, control;
  reg  [3:0] I;
  wire [3:0] q;

  sync_loadable_mod9_updown_counter DUT (
      clk,
      rst,
      load,
      control,
      I,
      q
  );

  task initialize;
    begin
      {clk, load, control, I} = 0;
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
      #120 control = 1;
    join
    #300 $finish;
  end

endmodule
