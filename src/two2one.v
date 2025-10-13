module two2one
(
   input [7:0] A, B,
	input S,
	output [7:0] Y
);

   assign Y = S==0 ? A : B;
endmodule 