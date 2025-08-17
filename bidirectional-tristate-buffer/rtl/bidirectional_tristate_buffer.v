//Bidirectional Buffer using two Tristate Buffer RTL
module bidirectional_tristate_buffer (
    inout a,
    b,
    input s
);

  TristateBuffer T1 (
      a,
      ~s,
      b
  );
  TristateBuffer T2 (
      b,
      s,
      a
  );

endmodule
