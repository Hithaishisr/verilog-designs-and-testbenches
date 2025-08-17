//Testbench for SR Latch
module sr_latch_tb;

  reg s, r, control;
  wire q, qbar;
  integer i;

  sr_latch DUT (
      s,
      r,
      control,
      q,
      qbar
  );

  task initialize;
    begin
      {s, r, control} = 0;
    end
  endtask

  task stimulus;
    input integer i;
    begin
      {s, r} = i;
    end
  endtask

  task monitor;
    begin
      $monitor($time, "S=%b,R=%b,Q=%b,Qbar=%b", s, r, q, qbar);
    end
  endtask

  initial begin
    initialize;
    monitor;
    #5 control = 1;
    for (i = 0; i < 4; i = i + 1) begin
      stimulus(i);
      #1;
    end
    #1{s, r} = 2'b10;
    #1{s, r} = 2'b00;
    #1 $finish;
  end

endmodule
