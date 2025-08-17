//RTL for SR Latch

module sr_latch (
    input  s,
    r,
    output q,
    qbar
);

  //Behavioural Model
  // always @(*) begin
  //   case ({
  //     s, r
  //   })
  //     0: ;
  //     1: begin
  //       q = 0;
  //       qbar = 1;
  //     end
  //     2: begin
  //       q = 1;
  //       qbar = 0;
  //     end
  //     3: begin
  //       q = 1'bx;
  //       qbar = 1'bx;
  //     end
  //   endcase
  // end

  //Gate level model using nor
  // nor g1 (q, r, qbar);
  // nor g2 (qbar, s, q);

  //Gate level model using nand
  nand g1 (q, ~s, qbar);
  nand g2 (qbar, ~r, q);

endmodule
