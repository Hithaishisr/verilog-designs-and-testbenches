//Priority checker for Decoder block RTL

module priority_to_onehot (
    input [7:0] I,
    output reg [7:0] F
);

  always @(I) begin
    if (I[7] == 1'b1) F = 8'd128;
    else if (I[6] == 1'b1) F = 8'd64;
    else if (I[5] == 1'b1) F = 8'd32;
    else if (I[4] == 1'b1) F = 8'd16;
    else if (I[3] == 1'b1) F = 8'd8;
    else if (I[2] == 1'b1) F = 8'd4;
    else if (I[1] == 1'b1) F = 8'd2;
    else if (I[0] == 1'b1) F = 8'd1;
    else F = 8'd0;
  end

endmodule
