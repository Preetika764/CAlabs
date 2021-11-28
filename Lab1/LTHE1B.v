module full_adder_4bit(a,b,sum,carry,cin);

	input [3:0] a;
	input [3:0] b;
	output [3:0] sum;
	output carry;
	wire [4:0] c;
	//reg m = 1'b0;
	input cin;
	full_adder bit0(a[0],b[0],cin,sum[0],c[1]);
	full_adder bit1(a[1],b[1],c[1],sum[1],c[2]);
	full_adder bit2(a[2],b[2],c[2],sum[2],c[3]);
	full_adder bit3(a[3],b[3],c[3],sum[3],c[4]);
	buf(carry,c[4]);
endmodule