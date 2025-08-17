//Testbench for Synchonous FIFO 16x8

module sync_fifo_16x8_tb;

  reg clk, rst, read_n, write_n;
  reg [7:0] data_in;
  wire full, empty;
  wire [7:0] data_out;
  integer i;

  sync_fifo_16x8 DUT (
      clk,
      rst,
      data_in,
      read_n,
      write_n,
      data_out,
      full,
      empty
  );

  task initialize;
    begin
      {clk, data_in, read_n, write_n} = 0;
      rst = 1;
    end
  endtask

  always #5 clk = ~clk;

  task reset_mem;
    begin
      #5 rst = 0;
      #5 rst = 1;
    end
  endtask

  task stimulus;
    input integer i;
    begin
      @(negedge clk) data_in = i;
    end
  endtask

  initial begin
    initialize;
    fork
      reset_mem;
      {write_n, read_n} = 2;
      for (i = 0; i < 16; i = i + 1) begin
        stimulus({$random} % 256);
      end
    join
    #20 read_n = 1;
    #200 $finish;
  end

endmodule

