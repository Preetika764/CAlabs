`include "d_ff.v"

module program_counter(q,d,clock,reset);
	input [0:4] d;
	output [0:4] q;
	input reset,clock;
	genvar j;
	generate for (j = 0; j < 5; j = j+1)	begin:mux_loop
		DFF d1(q[j],d[j],clock,reset);
			end
	endgenerate
endmodule
	
/*	
module tb_pc;
	
	reg [0:4] d;
	wire [0:4] q;
	reg reset, clock;
	
	program_counter pc(q,d,clock,reset);
	
	initial
	begin
	clock = 0;
	end
	
	initial 
	$monitor($time, "  %b",q);
	
	initial
	begin
	reset = 0;
	#2 reset = 1'b1;
	#4 d = 5'b00100;
	#4 d = 5'b11111;
	#2 reset = 1'b0;
	#40 $finish;
	end
	
	always
	#2 clock = ~clock; 
	
	
endmodule
*/