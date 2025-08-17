//RTL code for 4:1 MUX using Functions

module mux4to1_func_select (
    input [3:0] I,
    input [1:0] S,
    output reg F
);

  function Select;
    input i;
    begin
      Select = i;
    end
  endfunction


  always @(*) begin
    case (S)
      0: F = Select(I[0]);
      1: F = Select(I[1]);
      2: F = Select(I[2]);
      3: F = Select(I[3]);
    endcase
  end

endmodule
