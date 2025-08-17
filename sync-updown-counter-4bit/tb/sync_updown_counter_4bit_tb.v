//Testbench for Synchronous UP Counter

module sync_updown_counter_4bit_tb;

  parameter TP = 10;

  reg clk, rst, load, control;
  reg  [3:0] I;
  wire [3:0] q;

  sync_updown_counter_4bit DUT (
      clk,
      rst,
      load,
      control,
      I,
      q
  );

  task initialize;
    begin
      {clk, I, load} = 0;
      {control, rst} = 3;
    end
  endtask

  task monitor;
    begin
      $monitor("Clk=%b,I=%d,Q=%d", clk, I, q);
    end
  endtask

  task load_in;
    input integer i;
    begin
      @(negedge clk) load = 1;
      I = i;
      @(negedge clk) load = 0;
    end
  endtask

  always #(TP / 2) clk = ~clk;

  initial begin
    initialize;
    monitor;
    @(negedge clk) rst = 0;
    load_in(9);
    #100 control = 0;
    #200 $finish;
  end

endmodule
