//RTL code for SISO n bit shift register which shifts only first 2 clock cycles within every 4 clock cycles

module siso_2of4_shiftreg (
    input  clk,
    rst,
    I,
    output F
);

  parameter n_bit = 4;

  reg [(n_bit-1):0] temp;
  integer count;

  always @(posedge clk) begin
    if (rst) begin
      count <= 0;
    end else if (count == 3) begin
      count <= 0;
    end else begin
      count <= count + 1;
    end
  end

  always @(posedge clk) begin
    if (rst) begin
      temp <= 0;
    end else if (count <= 1) begin
      temp <= temp << 1;
      temp[0] <= I;
    end else begin
      temp <= temp;
    end
  end

  assign F = temp[n_bit-1];

endmodule
