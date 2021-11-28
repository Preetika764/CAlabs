module mux16to1(in,out,sel);
	
	input[0:15] in;
	output out;
	input[0:3] sel;
	
	wire[0:3] o;
	
	mux4to1 mux1(o[0],in[0:3],sel[2:3]);
	mux4to1 mux2(o[1],in[4:7],sel[2:3]);
	mux4to1 mux3(o[2],in[8:11],sel[2:3]);
	mux4to1 mux4(o[3],in[12:15],sel[2:3]);
	mux4to1 mux5(out, o, sel[0:1]);
endmodule