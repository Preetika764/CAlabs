`include "reg_32bit.v"
`include "mux32.v"
`include "decoder5_32.v"

module RegFile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteRegNo,RegWrite,ReadData1,ReadData2);
	input clk, reset, RegWrite;
	input [4:0] ReadReg1, ReadReg2, WriteRegNo;
	input [31:0] WriteData;
	output [31:0] ReadData1, ReadData2;
	wire [31:0] q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31;
	wire [31:0] Decode,clock;
	
	decoder5_32 mydecoder(Decode,WriteRegNo);
	
	genvar j;
	generate
    for(j = 0; j < 32; j = j + 1) begin:  and_loop
      and g(clock[j], RegWrite, Decode[j], clk);
    end
  endgenerate
	
	reg_32bit x0(q0,WriteData,clock[0],reset);
	reg_32bit x1(q1,WriteData,clock[1],reset);
	reg_32bit x2(q2,WriteData,clock[2],reset);
	reg_32bit x3(q3,WriteData,clock[3],reset);
	reg_32bit x4(q4,WriteData,clock[4],reset);
	reg_32bit x5(q5,WriteData,clock[5],reset);
	reg_32bit x6(q6,WriteData,clock[6],reset);
	reg_32bit x7(q7,WriteData,clock[7],reset);
	reg_32bit x8(q8,WriteData,clock[8],reset);
	reg_32bit x9(q9,WriteData,clock[9],reset);
	reg_32bit x10(q10,WriteData,clock[10],reset);
	reg_32bit x11(q11,WriteData,clock[11],reset);
	reg_32bit x12(q12,WriteData,clock[12],reset);
	reg_32bit x13(q13,WriteData,clock[13],reset);
	reg_32bit x14(q14,WriteData,clock[14],reset);
	reg_32bit x15(q15,WriteData,clock[15],reset);
	reg_32bit x16(q16,WriteData,clock[16],reset);
	reg_32bit x17(q17,WriteData,clock[17],reset);
	reg_32bit x18(q18,WriteData,clock[18],reset);
	reg_32bit x19(q19,WriteData,clock[19],reset);
	reg_32bit x20(q20,WriteData,clock[20],reset);
	reg_32bit x21(q21,WriteData,clock[21],reset);
	reg_32bit x22(q22,WriteData,clock[22],reset);
	reg_32bit x23(q23,WriteData,clock[23],reset);
	reg_32bit x24(q24,WriteData,clock[24],reset);
	reg_32bit x25(q25,WriteData,clock[25],reset);
	reg_32bit x26(q26,WriteData,clock[26],reset);
	reg_32bit x27(q27,WriteData,clock[27],reset);
	reg_32bit x28(q28,WriteData,clock[28],reset);
	reg_32bit x29(q29,WriteData,clock[29],reset);
	reg_32bit x30(q30,WriteData,clock[30],reset);
	reg_32bit x31(q31,WriteData,clock[31],reset);
		
	
	mux32 mux1(ReadData1,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,ReadReg1);
	mux32 mux2(ReadData2,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31,ReadReg2);
	
endmodule;

module tb32reg;
	
	reg clk,reset;
	reg [4:0] ReadReg1, ReadReg2;
	reg [31:0] WriteData;
	reg [4:0] WriteReg;
	reg RegWrite;
	wire [31:0] ReadData1, ReadData2;
	
	RegFile myfile(clk,reset,ReadReg1,ReadReg2,WriteData,WriteReg,RegWrite,ReadData1,ReadData2);
	
	initial
	begin
	clk = 0;
	#1 reset = 0;
	WriteData = 32'd1234;
	#4 reset = 1'b1;
	#1 WriteReg = 5'b00001; 	ReadReg1 = 32'd09; ReadReg2 = 32'd31; RegWrite = 1;
	#6 RegWrite = 0;
	#2 $display(" %b", myfile.q20);
	#15 $finish;
	end
	
	always 
	#1 clk = ~clk;
	
	initial
	$monitor(" %b %b %b %b %b",myfile.Decode[20],myfile.clock[20], RegWrite, clk,myfile.q20);
	
endmodule
	