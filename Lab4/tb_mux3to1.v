`include "mux3to1.v"
module tb_mux3to1;
	reg in1,in2,in3;
	reg [0:1] sel;
	wire out;
	mux3to1 mymux(out,sel,in1,in2,in3);
	initial
	begin
	in1 = 1'b0;
	in2 = 1'b0;
	in3 = 1'b1;
	sel = 2'b00;
	#10 $display("%b %b",sel,out);
	sel = 2'b01;
	#10 $display("%b %b",sel,out);
	sel = 2'b10;
	#10 $display("%b %b",sel,out);
	#100 $finish;
	end
endmodule