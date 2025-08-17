//RTL code for designing Vending machine

module vending_machine (
    input clk,
    rst,
    i,
    j,
    output reg X,
    Y
);

  parameter RST = 3'd0, Rs1 = 3'd1, Rs2 = 3'd2, Rs3 = 3'd3, Rs4 = 3'd4;

  reg [2:0] state, next_state;

  always @(posedge clk) begin
    if (rst) state <= RST;
    else state <= next_state;
  end

  always @(*) begin
    case (state)
      RST: begin
        if ({i, j} == 2'b10) next_state = Rs1;
        else if ({i, j} == 2'b11) next_state = Rs2;
        else next_state = state;
      end
      Rs1: begin
        if ({i, j} == 2'b10) next_state = Rs2;
        else if ({i, j} == 2'b11) next_state = Rs3;
        else next_state = state;
      end
      Rs2: begin
        if ({i, j} == 2'b10) next_state = Rs3;
        else if ({i, j} == 2'b11) next_state = Rs4;
        else next_state = state;
      end
      Rs3: next_state = RST;
      Rs4: next_state = RST;
      default: next_state = RST;
    endcase
  end

  always @(*) begin
    if (state == Rs4) {X, Y} = 2'b11;
    else if (state == Rs3) {X, Y} = 2'b10;
    else {X, Y} = 2'b00;
  end

endmodule
