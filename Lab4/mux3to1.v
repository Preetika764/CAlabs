module mux3to1(out,sel,in1,in2,in3);
	input in1,in2,in3;
	input [0:1] sel;
	output out;
	wire [0:1] notsel;
	not(notsel[0],sel[0]);
	not(notsel[1],sel[1]);
	wire a1,a2,a3;
	and(a1,notsel[0],notsel[1],in1);
	and(a2,notsel[0],sel[1],in2);
	and(a3,sel[0],notsel[1],in3);
	or(out,a1,a2,a3);
endmodule