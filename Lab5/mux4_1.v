module mux4_1(regData,q1,q2,q3,q4,reg_no);
	output [31:0] regData;
	input [31:0] q1,q2,q3,q4;
	input [0:1] reg_no;
	assign regData = reg_no[0] ? (reg_no[1] ? q4 : q3) : (reg_no[1] ? q2 : q1);
endmodule

	


	