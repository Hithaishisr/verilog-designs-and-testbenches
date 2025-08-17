//8:3 Priority Encoder Testbench
module priority_encoder8x3_tb;
  reg  [7:0] I;
  wire [2:0] F;

  priority_encoder8x3 DUT (
      I,
      F
  );

  initial begin
    I = 0;
  end

  initial begin
    I = 8'b00000000;
    #5 I = 8'b00000001;
    #5 I = 8'b0000001x;
    #5 I = 8'b000001xx;
    #5 I = 8'b00001xxx;
    #5 I = 8'b0001xxxx;
    #5 I = 8'b001xxxxx;
    #5 I = 8'b01xxxxxx;
    #5 I = 8'b1xxxxxxx;
    #5 I = 8'b01011010;
    #5 I = 8'b11110011;
    #5 $finish;
  end

  initial $monitor("I=%b,F=%b", I, F);

endmodule

