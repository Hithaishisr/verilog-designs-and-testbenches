//Testbench for 16x8 Dual port Synchronous RAM

module sync_dual_port_sram_16x8_tb;

  parameter TP = 10;

  reg we, en, rst, clk;
  reg [3:0] w_addr, r_addr;
  reg  [7:0] data_w;
  wire [7:0] data_r;

  integer i, j;

  sync_dual_port_sram_16x8 DUT (
      we,
      en,
      rst,
      clk,
      w_addr,
      r_addr,
      data_w,
      data_r
  );

  always begin
    #(TP / 2) clk = ~clk;
  end

  task initialize;
    begin
      {we, en, rst, clk, w_addr} = 0;
      r_addr = 4'bzz;
    end
  endtask

  task reset_mem;
    begin
      @(negedge clk) rst = 1;
      @(negedge clk) rst = 0;
    end
  endtask

  task stimulus;
    input integer i, j;
    begin
      if (we && ~en) begin
        w_addr = i;
        data_w = j;
      end else if (~we && en) begin
        r_addr = i;
        w_addr = 4'bzz;
        data_w = 8'bzz;
      end
    end
  endtask

  task write;
    begin
      {we, en} = 2'b10;
    end
  endtask

  task read;
    begin
      {we, en} = 2'b01;
    end
  endtask

  initial begin
    initialize;
    reset_mem;
    write;
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge clk);
      stimulus(i, {$random} % 256);
    end
    #10;
    read;
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge clk);
      stimulus(i, 0);
    end
    #10 $finish;
  end

endmodule
