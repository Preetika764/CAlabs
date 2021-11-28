`include "bit32_8to1mux.v"

module tb_bit32_8to1mux;
	reg [31:0] INP1, INP2;
	reg SEL;
	wire [31:0] out;
	bit32_8to1mux M1(out,SEL,INP1,INP2);
	initial
	begin
	INP1=32'd456;
	INP2=32'd1;
	SEL=1'b0;
	#10 $display("%b %b",out,SEL);
	#100 SEL=1'b1;
	#10 $display("%b %b",out,SEL);
	#1000 $finish;
	end
endmodule