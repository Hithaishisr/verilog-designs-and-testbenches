// Mealy finite state machine (FSM) to detect the sequence "1011"

module mealy_1011_sequence_detector (
    input clk,
    rst,
    i,
    output reg f
);

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

  reg [1:0] present_state, next_state;

  always @(posedge clk) begin
    if (rst) {f, present_state} = 0;
    else begin
      present_state = next_state;
    end
  end

  always @(*) begin
    case (present_state)
      S0:
      if (i == 0) next_state = present_state;
      else next_state = S1;
      S1:
      if (i == 0) next_state = S2;
      else next_state = present_state;
      S2:
      if (i == 0) next_state = S0;
      else next_state = S3;
      S3:
      if (i == 0) next_state = S2;
      else next_state = S1;
      default: next_state = S0;
    endcase
  end

  always @(*) begin
    if (present_state == S3) begin
      @(posedge clk) f = (i == 1);
    end else f = 0;
  end

endmodule
