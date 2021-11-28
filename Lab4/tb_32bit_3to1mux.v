`include "bit32_3to1mux.v"
module tb_32bit_3to1mux;
	reg [31:0] INP1, INP2, INP3;
	reg [0:1] SEL;
	wire [31:0] out;
	bit32_3to1mux M1(out,SEL,INP1,INP2,INP3);
	initial
	begin
	INP1 = 32'd3;
	INP2 = 32'd4;
	INP3 = 32'd2;
	SEL = 2'b00;
	#10 $display("%b %b",SEL,out);
	SEL = 2'b01;
	#10 $display("%b %b",SEL,out);
	SEL = 2'b10;
	#10 $display("%b %b",SEL,out);
	#100 $finish;
	
	end
endmodule