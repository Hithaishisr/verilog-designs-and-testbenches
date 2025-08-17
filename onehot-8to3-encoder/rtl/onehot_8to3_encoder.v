//8:3 Normal Encoder RTL

module onehot_8to3_encoder (
    input [7:0] I,
    output reg [2:0] F
);

  always @(I) begin
    if (I == 1) F = 3'd0;
    else if (I == 2) F = 3'd1;
    else if (I == 4) F = 3'd2;
    else if (I == 8) F = 3'd3;
    else if (I == 16) F = 3'd4;
    else if (I == 32) F = 3'd5;
    else if (I == 64) F = 3'd6;
    else if (I == 128) F = 3'd7;
    else F = 3'bzz;
  end

endmodule
