//4:1 MUX Testbench

module mux4to1_task_select_tb;

  reg [1:0] s;
  reg [3:0] I;
  wire f;
  integer i, j;

  mux4to1_task_select DUT (
      I,
      s,
      f
  );

  initial begin
    {s, I} = 0;
  end

  initial begin
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        s = i;
        I = j;
        #10;
      end
    end
    $finish;
  end

  initial begin
    $monitor($time, "s=%b,I=%b,f=%b", s, I, f);
  end

endmodule
