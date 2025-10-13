module OutputUnit (
   input [7:0] SW,
	output [6:0] HEX0, HEX1, HEX2, HEX3);
	
   wire [7:0] cin;

   wire [3:0] in, in2;

   wire [1:0] out;
	
twoSIGN twoSIGN_inst
(
   .A(SW),
	.B(cin)
);

binary2bcd binary2bcd_inst
(
   .A(cin),
	.ONES(in),
	.TENS(in2),
	.HUNDREDS(out)
);

assign HEX3 = SW[7] ? 7'b0111111 : 7'b1111111;

binary2seven binary2seven_HEX2
(
   .w(0),
	.x(0),
	.y(out[1]),
	.z(out[0]),
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
   .w(in2[3]),
	.x(in2[2]),
	.y(in2[1]),
	.z(in2[0]),
	.a(HEX1[0]),
	.b(HEX1[1]),
	.c(HEX1[2]),
	.d(HEX1[3]),
	.e(HEX1[4]),
	.f(HEX1[5]),
	.g(HEX1[6]),
);

binary2seven binary2seven_HEX0
(
   .w(in[3]),
	.x(in[2]),
	.y(in[1]),
	.z(in[0]),
	.a(HEX0[0]),
	.b(HEX0[1]),
	.c(HEX0[2]),
	.d(HEX0[3]),
	.e(HEX0[4]),
	.f(HEX0[5]),
	.g(HEX0[6])
);

endmodule 