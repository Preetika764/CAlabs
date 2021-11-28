module adder_subtractor(a,b1,sum,carry,signal);

	input [3:0] a;
	input [3:0] b1;
	wire [3:0] b;
	input signal;
	output [3:0] sum;
	output carry;
	xor(b[3],b1[3],signal);
	xor(b[2],b1[2],signal);
	xor(b[1],b1[1],signal);
	xor(b[0],b1[0],signal);
	full_adder_4bit myadder(a,b,sum,carry,signal);
endmodule