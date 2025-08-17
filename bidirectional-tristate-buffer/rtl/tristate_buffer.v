//Tristate Buffer RTL
module tristate_buffer (
    input i,
    s,
    output reg f
);

  always @(*) begin
    if (s == 1) f = i;
    else f = 1'bz;
  end

endmodule

