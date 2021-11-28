module decoder5_32 (register,WriteReg);

	input [4:0] WriteReg;
	output reg[31:0] register;
	always @ (WriteReg)

	case (WriteReg)
	5'b00000 : register = 32'd1;
	5'b00001 : register = 32'd2;
	5'b00010 : register = 32'd4;
	5'b00011 : register = 32'd8;
	5'b00100 : register = 32'd16;
	5'b00101 : register = 32'd32;
	5'b00110 : register = 32'd64;
	5'b00111 : register = 32'd128;
	5'b01000 : register = 32'd256;
	5'b01001 : register = 32'd512;
	5'b01010 : register = 32'd1024;
	5'b01011 : register = 32'd2048;
	5'b01100 : register = 32'd4096;
	5'b01101 : register = 32'd8192;
	5'b01110 : register = 32'd16384;
	5'b01111 : register = 32'd32768;
	5'b10000 : register = 32'd65536;
	5'b10001 : register = 32'd131072;
	5'b10010 : register = 32'd262144;
	5'b10011 : register = 32'd524288;
	5'b10100 : register = 32'd1048576;
	5'b10101 : register = 32'd2097152;
	5'b10110 : register = 32'd4194304;
	5'b10111 : register = 32'd8388608;
	5'b11000 : register = 32'd16777216;
	5'b11001 : register = 32'd33554432;
	5'b11010 : register = 32'd67108864;
	5'b11011 : register = 32'd134217728;
	5'b11100 : register = 32'd268435456;
	5'b11101 : register = 32'd536870912;
	5'b11110 : register = 32'b01000000000000000000000000000000;
	5'b11111 : register = 32'b10000000000000000000000000000000;
	default  : register = 32'd0;
	endcase

	
endmodule
	
/*
module tb_decoder;
	
	reg [4:0] WriteReg;
	wire [0:31] register;
	decoder5_32 mydecoder(register,WriteReg);
	initial
	begin
	
	#1 WriteReg = 5'd3;
	#1 WriteReg = 5'd6;
	#1 WriteReg = 5'd31;
	end
	
	initial
	$monitor($time," %b %b",WriteReg,register);
endmodule
*/