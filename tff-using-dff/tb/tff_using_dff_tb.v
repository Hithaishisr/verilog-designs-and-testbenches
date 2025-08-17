//Testbench for T Flip Flop

module tff_using_dff_tb;

  parameter TP = 10;

  reg clk, rst, t;
  wire q, qbar;

  tff_using_dff DUT (
      clk,
      rst,
      t,
      q,
      qbar
  );

  task initialize;
    begin
      {clk, rst, t} = 0;
    end
  endtask

  task stimulus;
    input integer i;
    @(negedge clk) begin
      t = i;
    end
  endtask

  task monitor;
    begin
      $monitor("clk=%b,T=%b,Q=%b,Qbar=%b", clk, t, q, qbar);
    end
  endtask

  always #(TP / 2) clk = ~clk;

  initial begin
    initialize;
    monitor;
    rst = 1;
    #10 rst = 0;
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    #10 $finish;
  end

endmodule
