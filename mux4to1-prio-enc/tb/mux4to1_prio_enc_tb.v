//Testbench for 4:1 MUX which takes 8 bits input and gives Priority Encoded output

module mux4to1_prio_enc_tb;

  reg [7:0] I0, I1, I2, I3;
  reg [1:0] S;
  wire [2:0] F;

  integer i;

  mux4to1_prio_enc DUT (
      I0,
      I1,
      I2,
      I3,
      S,
      F
  );

  task initialize;
    begin
      {I0, I1, I2, I3, S} = 34'd0;
    end
  endtask

  task select;
    input integer i;
    begin
      S = i;
      #5;
    end
  endtask

  task I_input;
    begin
      I0 = 8'd156;
      I1 = 8'd23;
      I2 = 8'd56;
      I3 = 8'd7;
    end
  endtask

  initial begin
    initialize;
    I_input;
    for (i = 0; i < 4; i = i + 1) begin
      select(i);
    end
    $finish;
  end

endmodule
