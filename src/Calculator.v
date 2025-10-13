module Calculator(
    input enter, clear, clock, OP,
	 output[6:0] HEX3, HEX2, HEX1, HEX0,
	 input [3:0] row,
	 output[3:0] col,
	 output [3:0] CCout,
	 output Cout, OVR
);

wire reset, LoadA, LoadB, LoadR, IUAU;

wire clock2;

wire [7:0] wire1, SW;

wire [3:0] wire2;

wire [7:0] Aout, Bout, Rout;

divideByN #(2500000,32) divideByN_inst
(
   .CLK(clock),
	.CLEAR(clear),
	.COUNT(),
	.OUT(clock2)
);


ControlUnit ControlUnit_inst
(
    .clock(clock2),
	 .clear(clear),
	 .enter(enter),
	 .reset(reset),
	 .LoadA(LoadA),
	 .LoadB(LoadB),
	 .LoadR(LoadR),
	 .IUAU(IUAU)
);


InputUnit InputUnit_inst
(
    .clk(clock),
	 .reset(reset),
	 .row(row),
	 .col(col),
	 .out(wire1)
);


EightBitTwoFunctionAU EightBitTwoFunctionAU_inst
(
    .register(wire1),
	 .Clear(clear),
	 .loadA(LoadA),
	 .loadB(LoadB),
	 .loadR(LoadR),
	 .OP(OP),
	 .Rout(Rout),
	 .CCout(CCout),
	 .Cout(Cout),
	 .OVR(OVR)
);


two2one two2one_inst
(
   .A(wire1),
	.B(Rout),
	.S(IUAU),
	.Y(SW)
);


OutputUnit OutputUnit_inst
(
   .SW(SW),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3)
);

endmodule
