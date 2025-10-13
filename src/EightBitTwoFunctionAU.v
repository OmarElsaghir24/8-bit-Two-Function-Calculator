module EightBitTwoFunctionAU (
  input [7:0] register, 
  //input [7:0] Aout, Bout,
  input Clear, loadA, loadB, loadR, OP, 
  //output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
  output [3:0] CCout,
  output [7:0] Rout,
  output Cout, OVR);
  
  wire [7:0] R;
  
  wire [3:0] CCL;
  
  wire [7:0] Aout, Bout;
  
NBitRegister NBitRegister_A 
(
    .D(register),
	 .CLK(loadA),
	 .CLR(Clear),
	 .Q(Aout)
);


NBitRegister NBitRegister_B 
(
     .D(register),
	  .CLK(loadB),
	  .CLR(Clear),
	  .Q(Bout)
);

RippleCarryAdderStructural RippleCarryAdderStructural_inst
(
    .A(Aout),
	 .B(Bout),
	 .D(OP),
	 .S(R),
	 .OVR(CCL[0]),
	 .NEG(CCL[1]),
	 .ZERO(CCL[2]),
	 .Cout(CCL[3])
);

NBitRegister NBitRegister_R 
(
     .D(R),
	  .CLK(loadR),
	  .CLR(Clear),
	  .Q(Rout)
);
  
NBitRegister NBitRegister_CC
(
    .D(CCL),
	 .CLK(loadR),
	 .CLR(Clear),
	 .Q(CCout)
);
/*
binary2seven binary2seven_HEX5
(
    .w(Aout[7]),
	 .x(Aout[6]),
	 .y(Aout[5]),
	 .z(Aout[4]),
	 .a(HEX5[0]),
	 .b(HEX5[1]),
	 .c(HEX5[2]),
	 .d(HEX5[3]),
	 .e(HEX5[4]),
	 .f(HEX5[5]),
	 .g(HEX5[6])
);

binary2seven binary2seven_HEX4
(
    .w(Aout[3]),
	 .x(Aout[2]),
	 .y(Aout[1]),
	 .z(Aout[0]),
	 .a(HEX4[0]),
	 .b(HEX4[1]),
	 .c(HEX4[2]),
	 .d(HEX4[3]),
	 .e(HEX4[4]),
	 .f(HEX4[5]),
	 .g(HEX4[6])
);

binary2seven binary2seven_HEX3
(
     .w(Bout[7]),
	  .x(Bout[6]),
	  .y(Bout[5]),
	  .z(Bout[4]),
	  .a(HEX3[0]),
	  .b(HEX3[1]),
	  .c(HEX3[2]),
	  .d(HEX3[3]),
	  .e(HEX3[4]),
	  .f(HEX3[5]),
	  .g(HEX3[6])
);

binary2seven binary2seven_HEX2
(
     .w(Bout[3]),
	  .x(Bout[2]),
	  .y(Bout[1]),
	  .z(Bout[0]),
	  .a(HEX2[0]),
	  .b(HEX2[1]),
	  .c(HEX2[2]),
	  .d(HEX2[3]),
	  .e(HEX2[4]),
	  .f(HEX2[5]),
	  .g(HEX2[6])
);

binary2seven binary2seven_HEX1
(
     .w(Rout[7]),
	  .x(Rout[6]),
	  .y(Rout[5]),
	  .z(Rout[4]),
	  .a(HEX1[0]),
	  .b(HEX1[1]),
	  .c(HEX1[2]),
	  .d(HEX1[3]),
	  .e(HEX1[4]),
	  .f(HEX1[5]),
	  .g(HEX1[6])
);

binary2seven binary2seven_HEX0
(
     .w(Rout[3]),
	  .x(Rout[2]),
	  .y(Rout[1]),
	  .z(Rout[0]),
	  .a(HEX0[0]),
	  .b(HEX0[1]),
	  .c(HEX0[2]),
	  .d(HEX0[3]),
	  .e(HEX0[4]),
	  .f(HEX0[5]),
	  .g(HEX0[6])
);*/

endmodule
 