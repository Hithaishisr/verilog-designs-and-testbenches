//Synchonous FIFO 16x8 RTL

module sync_fifo_16x8 (
    clk,
    rst,
    data_in,
    read_n,
    write_n,
    data_out,
    full,
    empty
);

  input clk, rst, read_n, write_n;
  input [7:0] data_in;
  output reg full, empty;
  output reg [7:0] data_out;
  integer i;

  reg [7:0] mem[0:15];
  reg [4:0] write_ptr, read_ptr;

  always @(posedge clk or negedge rst) begin
    if (~rst) begin
      for (i = 0; i < 16; i = i + 1) begin
        mem[i] <= 8'd0;
      end
      data_out  <= 0;
      write_ptr <= 0;
      read_ptr  <= 0;
    end else begin
      if (write_n && ~full) begin
        mem[write_ptr[3:0]] <= data_in;
        write_ptr <= write_ptr + 1'b1;
      end
      if (read_n && ~empty) begin
        data_out <= mem[read_ptr[3:0]];
        read_ptr <= read_ptr + 1'b1;
      end
    end
  end

  always @(*) begin
    if (write_ptr == read_ptr) begin
      full  = 0;
      empty = 1;
    end else if ((write_ptr[3:0] == read_ptr[3:0]) && (write_ptr[4] != read_ptr[4])) begin
      full  = 1;
      empty = 0;
    end else begin
      full  = 0;
      empty = 0;
    end
  end

endmodule
