module full_adder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum, cout;
	xor(sum,a,b,cin);
	wire i1,i2,i3;
	and(i1,a,b);
	or(i2,a,b);
	and(i3,cin,i2);
	or(cout,i1,i3);
endmodule
	