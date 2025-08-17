//Testbench for Synchronous UP Counter

module loadable_sync_up_counter_4b_tb;

  parameter TP = 10;

  reg clk, rst, load;
  reg  [3:0] I;
  wire [3:0] q;

  loadable_sync_up_counter_4b DUT (
      clk,
      rst,
      load,
      I,
      q
  );

  task initialize;
    begin
      {clk, I, load} = 0;
      rst = 1;
    end
  endtask

  task load_input;
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
    #10 rst = 0;
    #100 load_input(6);
    #200 $finish;
  end

endmodule
