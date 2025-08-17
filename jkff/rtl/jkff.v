//RTL code for JK Flip Flop

module jkff (
    input clk,
    rst,
    j,
    k,
    output reg q,
    qbar
);

  parameter HOLD = 2'd0, RESET = 2'd1, SET = 2'd2, TOGGLE = 2'd3;

  always @(posedge clk) begin
    if (rst) begin
      q <= 0;
      qbar <= 1;
    end else begin
      case ({
        j, k
      })
        HOLD: ;
        RESET: begin
          q <= 1'b0;
          qbar <= 1'b1;
        end
        SET: begin
          q <= 1'b1;
          qbar <= 1'b0;
        end
        TOGGLE: begin
          q <= ~q;
          qbar <= ~qbar;
        end
        default: begin
          q <= 1'bz;
          qbar <= 1'bz;
        end
      endcase
    end
  end

endmodule
