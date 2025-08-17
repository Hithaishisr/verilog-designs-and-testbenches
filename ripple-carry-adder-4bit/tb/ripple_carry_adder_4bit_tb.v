//Testbench for RCA 4bit

module ripple_carry_adder_4bit_tb;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire carry;
  integer i, j, k;

  ripple_carry_adder_4bit DUT (
      a,
      b,
      cin,
      sum,
      carry
  );

  initial begin
    {a, b, cin} = 0;
  end

  initial begin
    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          a   = i;
          b   = j;
          cin = k;
          #1;
        end
      end
    end
    $finish;
  end

  initial $monitor("a=%d,b=%d,cin=%b,sum=%d,carry=%b", a, b, cin, sum, carry);

endmodule
