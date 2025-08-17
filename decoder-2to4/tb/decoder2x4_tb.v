//Testbench for 2x4 Decoder

module decoder_2to4_tb;
  reg a, b, en;
  wire [3:0] I;
  integer i;

  decoder_2to4 DUT (
      a,
      b,
      en,
      I
  );

  initial begin
    a  = 1'b0;
    b  = 1'b0;
    en = 1'b0;
  end

  initial begin
    #10 en = 1'b1;
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end
    $finish;
  end

  initial $monitor("a=%b, b=%b, I=%b", a, b, I);

endmodule
