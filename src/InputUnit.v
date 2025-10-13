module InputUnit 
(
   input clk,
	input reset,
	input [3:0] row,
	output [3:0] col,
	output [7:0] out
);

   wire [15:0] wire1;
	
	wire [7:0] wire2;
	
	keypad_input keypad_input_inst
	(
	    .clk(clk),
		 .reset(reset),
		 .row(row),
		 .col(col),
		 .out(wire1)
	);
		 
	
	BCD2BinarySM BCD2BinarySM_inst
	(
	      .BCD(wire1),
			.binarySM(wire2)
	);
	
	assign out[7] = wire2[7]; 
	
	twoSIGN twoSIGN_inst
	(
	     .A(wire2),
		  .B(out[6:0])
	);
	
endmodule
      