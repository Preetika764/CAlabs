`include "bit8_2to1mux.v"

module bit32_8to1mux(out,sel,in1,in2);
	input[31:0] in1,in2;
	output[31:0] out;
	input sel;
	
	genvar j;
	generate for(j=4;j>=1;j=j-1) begin:mux_loop
		bit8_2to1mux m1(out[(8*j)-1:(8*j)-8],sel,in1[(8*j)-1:(8*j)-8],in2[(8*j)-1:(8*j)-8]); 
		end
	endgenerate

endmodule

