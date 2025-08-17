//Dual Port Asynchronous RAM RTL

module dual_port_async_ram_8x16 (
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

  input we, en, rst, clk_w, clk_r;
  input [2:0] addr_w, addr_r;
  input [15:0] data_w;
  output reg [15:0] data_r;
  integer i;

  reg [15:0] mem[0:7];

  always @(posedge clk_w) begin
    if (rst) begin
      for (i = 0; i < 8; i = i + 1) begin
        mem[i] <= 16'd0;
      end
    end else if (we && ~en) mem[addr_w] <= data_w;
    else mem[addr_w] <= mem[addr_w];
  end

  always @(posedge clk_r) begin
    if (rst) data_r <= 0;
    else if (~we && en) data_r <= mem[addr_r];
    else data_r <= data_r;
  end

endmodule
