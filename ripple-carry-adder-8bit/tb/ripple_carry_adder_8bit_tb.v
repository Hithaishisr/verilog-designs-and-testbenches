// Testbench for an 8-bit Ripple Carry Adder (RCA) using generate loops for full adders

module ripple_carry_adder_8bit_tb;

  // Inputs
  reg [7:0] A;
  reg [7:0] B;
  reg Cin;

  // Outputs
  wire [7:0] S;
  wire Cout;

  // Instantiate the DUT
  ripple_carry_adder_8bit DUT (
      .A(A),
      .B(B),
      .Cin(Cin),
      .S(S),
      .Cout(Cout)
  );

  integer i, j, k;
  reg [8:0] expected_sum;  // 8 bits + carry

  initial begin
    $display("Starting exhaustive test...");
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          A   = i;
          B   = j;
          Cin = k;
          #1;  // small delay for propagation

          expected_sum = A + B + Cin;

          if ({Cout, S} !== expected_sum) begin
            $display("ERROR: A=%0d B=%0d Cin=%0d => S=%0d Cout=%0d, Expected=%0d", A, B, Cin, S,
                     Cout, expected_sum);
          end
        end
      end
    end
    $display("Exhaustive test completed!");
    $stop;
  end

endmodule
