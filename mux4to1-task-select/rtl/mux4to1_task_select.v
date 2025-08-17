//4:1 MUX using task RTL

module mux4to1_task_select (
    input [3:0] I,
    input [1:0] S,
    output reg F
);

  task Selector;
    input i;
    begin
      F = i;
    end
  endtask

  always @(*) begin
    case (S)
      0: Selector(I[0]);
      1: Selector(I[1]);
      2: Selector(I[2]);
      3: Selector(I[3]);
    endcase
  end

endmodule
