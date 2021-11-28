`include "d_ff.v"

module reg_32bit(q,d,clk,reset); // Register
	input [31:0] d;
	output [31:0] q;
	input clk,reset;
	
	genvar j;
	
	generate for (j = 0; j < 32; j = j+1)	begin:mux_loop
		DFF d1(q[j],d[j],clk,reset);
			end
		endgenerate
endmodule 

/*
module tb32reg;
	reg [31:0] d;
	reg clk,reset;
	wire [31:0] q;
	reg_32bit R(q,d,clk,reset);
	always @(clk)
	#5 clk<=~clk;
	initial
	begin
	clk= 1'b1;
	reset=1'b0;//reset the register
	#20 reset=1'b1;
	#20 d=32'hAFAFAFAF;
	#200 $finish;
	end
	initial 
	$monitor("%d %b %b",reset, q,d);
endmodule
*/