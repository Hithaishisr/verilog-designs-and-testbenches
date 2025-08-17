module seq_det_101 (
    seq_in,
    clock,
    reset,
    det_o
);

  //Step1 : Declare the states as parameter "S0","S1","S2","S3"
  localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

  //Step2 : Write down the ports direction
  input seq_in, clock, reset;
  output reg det_o;

  //Internal registers
  reg [1:0] state, next_state;

  //Step3 : Write down the sequential logic for present state with active high asychronous reset
  always @(posedge clock, posedge reset) begin
    if (reset) state <= S0;
    else state <= next_state;
  end

  //Understand the combinational logic for next state
  always @(state, seq_in) begin
    case (state)
      S0:      if (seq_in == 1) next_state = S1;
 else next_state = S0;
      S1:      if (seq_in == 0) next_state = S2;
 else next_state = S1;
      S2:      if (seq_in == 1) next_state = S3;
 else next_state = S0;
      S3:      if (seq_in == 1) next_state = S1;
 else next_state = S2;
      default: next_state = S0;
    endcase
  end

  //Step4 : Write down the logic for Moore output det_o
  always @(*) begin
    if (state == S3) det_o = 1'b1;
    else det_o = 1'b0;
  end

endmodule
