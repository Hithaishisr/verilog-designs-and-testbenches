// Moore FSM: Detects overlapping 100 and 010 sequences with toggle

module moore_seq_detector_100_010 (
    input clk,
    rst,
    i,
    output reg f
);

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9;

  reg [3:0] present_state, next_state;

  always @(posedge clk) begin
    if (rst) {f, present_state} = 0;
    else present_state = next_state;
  end

  always @(*) begin
    case (present_state)
      S0:
      if (i == 0) next_state = S1;
      else next_state = S2;
      S1:
      if (i == 0) next_state = present_state;
      else next_state = S3;
      S2:
      if (i == 0) next_state = S5;
      else next_state = present_state;
      S3:
      if (i == 0) next_state = S4;
      else next_state = S2;
      S4:
      if (i == 0) next_state = S1;
      else next_state = S7;
      S5:
      if (i == 0) next_state = S6;
      else next_state = S3;
      S6:
      if (i == 0) next_state = present_state;
      else next_state = S7;
      S7:
      if (i == 0) next_state = S5;
      else next_state = S8;
      S8:
      if (i == 0) next_state = S9;
      else next_state = present_state;
      S9:
      if (i == 0) next_state = S1;
      else next_state = S7;
      default: next_state = S0;
    endcase
  end

  always @(*) begin
    case (present_state)
      S4: f = 1;
      S6: f = 1;
      S7: f = 1;
      S8: f = 1;
      S9: f = 1;
      default: f = 0;
    endcase
  end

endmodule


