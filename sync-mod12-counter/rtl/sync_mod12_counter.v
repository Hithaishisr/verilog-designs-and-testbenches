//4 bit Synchronous MOD-12 UP Counter RTL

module sync_mod12_counter (
    input clk,
    rst,
    load,
    input [3:0] i,
    output reg [3:0] q
);

  always @(posedge clk) begin
    if (rst) begin
      q <= 4'd0;
    end else if (load && i < 12) begin  //Ignores the input loading if value is more than 11.
      q <= i;
    end else if (q >= 4'd11) begin
      q <= 4'd0;
    end else q <= q + 1;
  end

endmodule
