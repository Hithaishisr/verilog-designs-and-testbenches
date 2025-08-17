module full_adder (
    a_in,
    b_in,
    c_in,
    sum_out,
    carry_out
);

  input a_in, b_in, c_in;
  output sum_out, carry_out;

  wire w1, w2, w3;

  half_adder H1 (
      a_in,
      b_in,
      w1,
      w2
  );

  half_adder H2 (
      w1,
      c_in,
      sum_out,
      w3
  );

  assign carry_out = w2 | w3;

endmodule

