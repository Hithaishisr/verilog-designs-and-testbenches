// Moore Finite State Machine (FSM) to detect the 0101 input sequence

module moore_seq0101_detector (
    input clk,
    rst,
    i,
    output reg f
);

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

  reg [2:0] present_state, next_state;

  always @(posedge clk) begin
    if (rst) {f, present_state} = 0;
    else present_state = next_state;
  end

  always @(*) begin
    case (present_state)
      S0:
      if (i == 0) next_state = S1;
      else next_state = present_state;
      S1:
      if (i == 0) next_state = present_state;
      else next_state = S2;
      S2:
      if (i == 0) next_state = S3;
      else next_state = S0;
      S3:
      if (i == 0) next_state = S1;
      else next_state = S4;
      S4:
      if (i == 0) next_state = S3;
      else next_state = S0;
      default: next_state = S0;
    endcase
  end

  always @(*) begin
    if (present_state == S4) f = 1;
    else f = 0;
  end

endmodule
