module adder_8bits(in1,in2,cin,out,cout);
	
	input[0:7] in1,in2;
	input cin;
	output cout;
	output[0:7] out;
	wire[0:7] carry;
	fulladder bit7(out[7],carry[7],in1[7],in2[7],cin);
	fulladder bit6(out[6],carry[6],in1[6],in2[6],carry[7]);
	fulladder bit5(out[5],carry[5],in1[5],in2[5],carry[6]);
	fulladder bit4(out[4],carry[4],in1[4],in2[4],carry[5]);
	fulladder bit3(out[3],carry[3],in1[3],in2[3],carry[4]);
	fulladder bit2(out[2],carry[2],in1[2],in2[2],carry[3]);
	fulladder bit1(out[1],carry[1],in1[1],in2[1],carry[2]);
	fulladder bit0(out[0],carry[0],in1[0],in2[0],carry[1]);
	buf(cout,carry[0]);
endmodule;
	