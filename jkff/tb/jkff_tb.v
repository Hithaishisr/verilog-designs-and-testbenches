//Testbench for JK Flip Flop

module jkff_tb;

  parameter TP = 10;

  reg clk, rst, j, k;
  wire q, qbar;

  jkff DUT (
      clk,
      rst,
      j,
      k,
      q,
      qbar
  );

  task initialize;
    begin
      {clk, j, k} = 0;
      rst = 1;
    end
  endtask

  task stimulus;
    input integer i;
    @(negedge clk) begin
      {j, k} = i;
    end
  endtask

  task monitor;
    begin
      $monitor("clk=%b,J=%b,K=%b,Q=%b,Qbar=%b", clk, j, k, q, qbar);
    end
  endtask

  always #(TP / 2) clk = ~clk;

  initial begin
    initialize;
    monitor;
    #10 rst = 0;
    stimulus(0);
    stimulus(1);
    stimulus(2);
    stimulus(3);
    stimulus(0);
    #10 $finish;
  end

endmodule
