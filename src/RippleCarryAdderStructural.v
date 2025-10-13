module RippleCarryAdderStructural (
    input [7:0] A, B,
	 input D,
	 output [7:0] S,
	 output Cout,
	 output OVR,
	 output ZERO,
	 output NEG);
	 wire [8:0] C;
			 assign Cout = C[8];
			 assign C[0] = D;
	 FAbehav s0 (.ai(A[0]), .bi(C[0]^B[0]), .cini(C[0]), .si(S[0]), .couti(C[1]));
	 FAbehav s1 (.ai(A[1]), .bi(C[0]^B[1]), .cini(C[1]), .si(S[1]), .couti(C[2]));
	 FAbehav s2 (.ai(A[2]), .bi(C[0]^B[2]), .cini(C[2]), .si(S[2]), .couti(C[3]));
	 FAbehav s3 (.ai(A[3]), .bi(C[0]^B[3]), .cini(C[3]), .si(S[3]), .couti(C[4]));
	 FAbehav s4 (.ai(A[4]), .bi(C[0]^B[4]), .cini(C[4]), .si(S[4]), .couti(C[5]));
	 FAbehav s5 (.ai(A[5]), .bi(C[0]^B[5]), .cini(C[5]), .si(S[5]), .couti(C[6]));
	 FAbehav s6 (.ai(A[6]), .bi(C[0]^B[6]), .cini(C[6]), .si(S[6]), .couti(C[7]));
	 FAbehav s7 (.ai(A[7]), .bi(C[0]^B[7]), .cini(C[7]), .si(S[7]), .couti(C[8]));
	 assign OVR = C[8]^C[7];
	 assign ZERO = !(S[0]|S[1]|S[2]|S[3]|S[4]|S[5]|S[6]|S[7]);
	 assign NEG = S[7];
endmodule 