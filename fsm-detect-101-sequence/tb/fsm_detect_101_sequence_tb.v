module fsm_detect_101_sequence_tb;

  // Inputs
  reg clk, rst, I;

  // Output
  wire F;

  // Instantiate the FSM module
  fsm_detect_101_sequence DUT (
    .clk(clk),
    .rst(rst),
    .I(I),
    .F(F)
  );

  // Clock generation: 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    $display("Time\t rst I  -> F");

    // Initialize inputs
    rst = 1; I = 0;
    #10;

    // Deassert reset
    rst = 0;
    #10;

    // Apply all input combinations to test transitions
    // Format: [S0] --1--> S1 --0--> S2 --1--> S3 (F = 1)

    I = 1; #10;  // S0 -> S1
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 0; #10;  // S1 -> S2
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 1; #10;  // S2 -> S3 (F = 1)
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 0; #10;  // S3 -> S2
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 1; #10;  // S2 -> S3 (F = 1 again)
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 1; #10;  // S3 -> S1
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 0; #10;  // S1 -> S2
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    I = 0; #10;  // S2 -> S0
    $display("%0t\t %b   %b  -> %b", $time, rst, I, F);

    // Apply reset in the middle
    rst = 1; #10;
    $display("%0t\t %b   %b  -> %b (Reset applied)", $time, rst, I, F);
    rst = 0; #10;

    I = 1; #10;  // S0 -> S1
    I = 1; #10;  // S1 -> S1 (hold)
    I = 0; #10;  // S1 -> S2
    I = 1; #10;  // S2 -> S3 (F = 1)

    $display("Test complete.");
    $finish;
  end

endmodule
