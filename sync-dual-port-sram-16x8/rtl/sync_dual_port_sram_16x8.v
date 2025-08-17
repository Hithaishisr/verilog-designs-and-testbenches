//8x16 Dual port Synchronous RAM(DRAM) RTL

module sync_dual_port_sram_16x8 (
    we,
    en,
    rst,
    clk,
    w_addr,
    r_addr,
    data_w,
    data_r
);

  input we, en, rst, clk;
  input [3:0] w_addr, r_addr;
  input [7:0] data_w;
  output reg [7:0] data_r;
  integer i;

  parameter width = 8, depth = 16;

  reg [(width-1):0] mem[0:(depth-1)];

  //SyncDRAM16x8 #(8,8) Mem1 (we,en,rst,clk,w_addr,r_addr,data_w,data_r);
  //SyncDRAM16x8 #(.depth(8)) Mem1 (we,en,rst,clk,w_addr,r_addr,data_w,data_r);

  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 16; i = i + 1) begin
        mem[i] <= 8'd0;
      end
      data_r <= 0;
    end else if (we && ~en) begin
      mem[w_addr] <= data_w;
    end else if (~we && en) begin
      data_r <= mem[r_addr];
    end else begin
      mem[w_addr] <= mem[w_addr];
      data_r <= data_r;
    end
  end

endmodule
