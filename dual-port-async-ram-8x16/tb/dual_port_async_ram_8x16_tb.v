//Testbench Dual Port Asynchronous RAM

module dual_port_async_ram_8x16_tb;

  reg we, en, rst, clk_w, clk_r;
  reg [2:0] addr_w, addr_r;
  reg [15:0] data_w;
  wire [15:0] data_r;
  integer i;

  dual_port_async_ram_8x16 DUT (
      we,
      en,
      rst,
      clk_w,
      clk_r,
      addr_w,
      addr_r,
      data_w,
      data_r
  );

  task initialize;
    begin
      {we, en, rst, clk_w, clk_r, addr_w, data_w} = 0;
      addr_r = 3'bzz;
    end
  endtask

  always #5 clk_w = ~clk_w;
  always #10 clk_r = ~clk_r;

  task reset_mem;
    begin
      rst = 1;
      @(negedge clk_w) rst = 0;
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

  task stimulus;
    input integer i, j;
    begin
      if (we && ~en) begin
        addr_w = i;
        data_w = j;
      end else if (~we && en) begin
        addr_r = i;
        addr_w = 3'bzz;
        data_w = 16'bzz;
      end
    end
  endtask

  initial begin
    initialize;
    reset_mem;
    write;
    for (i = 0; i < 8; i = i + 1) begin
      @(negedge clk_w) stimulus(i, {$random} % 256);
    end
    read;
    for (i = 0; i < 8; i = i + 1) begin
      @(negedge clk_r) stimulus(i, 0);
    end
    #20 $finish;
  end

endmodule

