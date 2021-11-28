module mux4to1(out,in,sel);
	input[0:3] in;
	input[0:1] sel;
	output out;
	
	wire n,nn;
	not(n,sel[0]);
	not(nn,sel[1]);
	wire[0:3] intermediate;
	and(intermediate[0],in[0],n,nn);
	and(intermediate[1],in[1],n,sel[1]);
	and(intermediate[2],in[2],sel[0],nn);
	and(intermediate[3],in[3],sel[0],sel[1]);
	or(out, intermediate[0],intermediate[1],intermediate[2],intermediate[3]);
endmodule