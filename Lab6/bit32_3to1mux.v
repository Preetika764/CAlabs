`include "mux3to1.v"
module bit32_3to1mux(out,sel,in1,in2,in3);
	output[31:0] out;
	input[31:0] in1,in2,in3;
	input[0:1] sel;
	
	genvar j;
	
	generate for(j=0;j<=31;j=j+1) begin:mux_loop
		mux3to1 m1(out[j],sel,in1[j],in2[j],in3[j]);
		end
	endgenerate
endmodule