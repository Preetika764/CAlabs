module mux32(ReadData,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,ReadReg);
	output reg[31:0] ReadData;
	input [31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;
	input [4:0] ReadReg;
	
	always @ (ReadReg or q0 or q1 or q2 or q3 or q4 or q5 or q6 or q7 or q8 or q9 or q10 or q11 or q12 or q13 or q14 or q15 or q16 or q17 or q18 or q19 or q20 or q21 or q22 or q23 or q24 or q25 or q26 or q27 or q28 or q29 or q30 or q31)
	begin
	case (ReadReg)
	5'b00000 : ReadData = q0;
	5'b00001 : ReadData = q1;
	5'b00010 : ReadData = q2;
	5'b00011 : ReadData = q3;
	5'b00100 : ReadData = q4;
	5'b00101 : ReadData = q5;
	5'b00110 : ReadData = q6;
	5'b00111 : ReadData = q7;
	5'b01000 : ReadData = q8;
	5'b01001 : ReadData = q9;
	5'b01010 : ReadData = q10;
	5'b01011 : ReadData = q11;
	5'b01100 : ReadData = q12;
	5'b01101 : ReadData = q13;
	5'b01110 : ReadData = q14;
	5'b01111 : ReadData = q15;
	5'b10000 : ReadData = q16;
	5'b10001 : ReadData = q17;
	5'b10010 : ReadData = q18;
	5'b10011 : ReadData = q19;
	5'b10100 : ReadData = q20;
	5'b10101 : ReadData = q21;
	5'b10110 : ReadData = q22;
	5'b10111 : ReadData = q23;
	5'b11000 : ReadData = q22;
	5'b11001 : ReadData = q25;
	5'b11010 : ReadData = q26;
	5'b11011 : ReadData = q27;
	5'b11100 : ReadData = q28;
	5'b11101 : ReadData = q29;
	5'b11110 : ReadData = q30;
	5'b11111 : ReadData = q31;
	endcase
	end

endmodule
/*
module tb_32mux;
	
	wire[31:0] ReadData;
	reg [31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;
	reg [4:0] ReadReg;
	mux32 mymux(ReadData,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,ReadReg);
	
	initial
	begin
	#1 q0 = 32'd33;
	#1 q3 = 32'd7;
	#1 q4 = 32'd4;
	#2 ReadReg = 5'b00011;
	#2 ReadReg = 5'b00110;
	#2 ReadReg = 5'b00100;	
	end
	
	initial
	$monitor($time," %b %b", ReadData, ReadReg);
endmodule
*/	