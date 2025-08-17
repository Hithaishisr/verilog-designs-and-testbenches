module onehot_8to3_encoder_tb;

  // Inputs
  reg  [7:0] I;

  // Outputs
  wire [2:0] F;

  // Instantiate the encoder
  onehot_8to3_encoder dut (
      .I(I),
      .F(F)
  );

  integer i;

  initial begin
    // Monitor signals
    $display("Time\tInput\t\tOutput");
    $monitor("%0t\t%b\t%b", $time, I, F);

    // Test all one-hot inputs
    for (i = 0; i < 8; i = i + 1) begin
      I = 8'b00000001 << i;  // Shift 1 through all positions
      #10;  // wait 10ns
    end

    // Test invalid inputs (multiple bits high)
    I = 8'b00000011;
    #10;
    I = 8'b10101010;
    #10;
    I = 8'b00000000;
    #10;

    $display("Testbench finished!");
    $stop;
  end

endmodule
