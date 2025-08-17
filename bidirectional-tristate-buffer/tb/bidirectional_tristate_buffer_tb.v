//Bidirectional Tristate Buffer Testbench

module bidirectional_tristate_buffer_tb;

  wire a, b;
  reg i, j, s;
  integer k;

  bidirectional_tristate_buffer DUT (
      a,
      b,
      s
  );

  initial begin
    {i, j, s} = 0;
  end

  initial begin
    for (k = 0; k < 8; k = k + 1) begin
      {i, j, s} = k;
      #10;
    end
    $finish;
  end

  assign a = ~s ? i : 1'bz;
  assign b = s ? j : 1'bz;

  initial begin
    $monitor("a=%b,b=%b,i=%b,j=%b,s=%b", a, b, i, j, s);
  end

endmodule

