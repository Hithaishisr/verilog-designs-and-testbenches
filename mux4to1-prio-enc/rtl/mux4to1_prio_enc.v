//4:1 MUX which takes 8 bits input and gives Priority Encoded output RTL

module mux4to1_prio_enc (
    I0,
    I1,
    I2,
    I3,
    S,
    F
);

  input [7:0] I0, I1, I2, I3;
  input [1:0] S;
  output reg [2:0] F;

  task PrioEn;
    input [7:0] i;
    begin
      case (1'b1)
        i[7]: F = 3'd7;
        i[6]: F = 3'd6;
        i[5]: F = 3'd5;
        i[4]: F = 3'd4;
        i[3]: F = 3'd3;
        i[2]: F = 3'd2;
        i[1]: F = 3'd1;
        i[0]: F = 3'd0;
      endcase
    end
  endtask

  always @(*) begin
    case (S)
      2'd0: PrioEn(I0);
      2'd1: PrioEn(I1);
      2'd2: PrioEn(I2);
      2'd3: PrioEn(I3);
    endcase
  end

endmodule
