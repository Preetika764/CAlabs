`include "adder_32bit.v"

module tb_adder32bit;
	reg[0:31] In1,In2;
	reg Cin;
	wire Cout;
	wire [0:31] Sum;
	adder_32bit myadder(Cout,Sum,In1,In2,Cin);
	initial
	begin
	In1 = 32'b0001;
	In2 = 32'b1111;
	Cin = 0;
	#10 $display("%b %b %b %b %b",In1,In2,Cin,Cout,Sum);
	#40 $finish;
	end
endmodule