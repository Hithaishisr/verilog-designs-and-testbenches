module full_adder_df (
    a_in,
    b_in,
    c_in,
    sum_out,
    carry_out
);

  input a_in, b_in, c_in;
  output sum_out, carry_out;

  assign sum_out   = a_in ^ b_in ^ c_in;
  assign carry_out = a_in & b_in | c_in & (a_in ^ b_in);

endmodule
