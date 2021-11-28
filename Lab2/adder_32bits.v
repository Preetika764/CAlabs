module adder_32bits(in1,in2,cin,out,cout);
	input[0:31] in1,in2;
	input cin;
	output cout;
	output[0:31] out;
	wire[0:4] carry;
	
	adder_8bits adder1(in1[24:31],in2[24:31],cin,out[24:31],carry[4]);
	adder_8bits adder2(in1[16:23],in2[16:23],carry[4],out[16:23],carry[3]);
	adder_8bits adder3(in1[8:15],in2[8:15],carry[3],out[8:15],carry[2]);
	adder_8bits adder4(in1[0:7],in2[0:7],carry[2],out[0:7],carry[1]);
	buf(cout,carry[1]);
endmodule

