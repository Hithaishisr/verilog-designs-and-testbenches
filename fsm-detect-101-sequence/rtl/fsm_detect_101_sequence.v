// RTL for a Moore FSM that detects the input sequence '101' without using explicit next_state logic

module fsm_detect_101_sequence (
    clk,
    rst,
    I,
    F
);

  input clk, rst, I;
  output F;

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

  reg [1:0] state;

  always @(posedge clk, posedge rst) begin
    if (rst) state <= S0;
    else begin
      case (state)
        S0:
        if (I) state <= S1;
        else state <= S0;
        S1:
        if (I) state <= S1;
        else state <= S2;
        S2:
        if (I) state <= S3;
        else state <= S0;
        S3:
        if (I) state <= S1;
        else state <= S2;
        default: state <= S0;
      endcase
    end
  end

  assign F = (state == S3) ? 1'b1 : 1'b0;

endmodule
