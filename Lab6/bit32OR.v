module bit32OR(in1,in2,out);
	input [31:0] in1,in2;
	output [31:0] out;
	assign {out} = in1|in2;
endmodule

/*
module tb_32bitOR;
	reg [31:0] in1,in2;
	wire[31:0] out;
	bit32OR mygate(in1,in2,out);
	initial
	begin
	in1 = 32'd15;
	in2 = 32'd40;
	#10 $display("%b %b %b",in1,in2,out);
	end
endmodule
	*/