//8x3 priority encoder using structural model RTL

module priority_encoder8x3 (
    input  [7:0] I,
    output [2:0] F
);

  wire [7:0] W;

  priority_to_onehot P (
      I[7:0],
      W[7:0]
  );
  priority_to_onehot E (
      W[7:0],
      F[2:0]
  );

endmodule

