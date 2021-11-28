module instrmem(address,instruction);
	input [0:4] address;
	output reg [31:0] instruction;
	
	always @ (address)
		begin
		case(address) 
			5'b00000: instruction = 32'h00000000;
			5'b00001: instruction = 32'h00000000;
			5'b00010: instruction = 32'h00000000;
			5'b00011: instruction = 32'b00000010001100100100000000100000;  //add $t0, $s1, $s2 
			5'b00100: instruction = 32'b00000010001100100100000000100001;  //addu $t0, $s1, $s2 
			5'b00101: instruction = 32'b00000010001100100100000000100100;  //and $t0, $s1, $s2 
			5'b00110: instruction = 32'b00000010001100100100000000100111;  //nor $t0, $s1, $s2 
			5'b00111: instruction = 32'b00000010001100100100000000100101;  //or $t0, $s1, $s2 
			5'b01000: instruction = 32'b00000010001100100100000000100010;  //sub $t0, $s1, $s2 
			5'b01001: instruction = 32'b00000010001100100100000000100011;  //subu $t0, $s1, $s2 
			5'b01010: instruction = 32'h00000000;
			5'b01011: instruction = 32'h00000000;
			5'b01100: instruction = 32'h00000000;
			5'b01101: instruction = 32'h00000000;
			5'b01110: instruction = 32'h00000000;
			5'b01111: instruction = 32'h00000000;
			5'b10000: instruction = 32'h00000000;
			5'b10001: instruction = 32'h00000000;
			5'b10010: instruction = 32'h00000000;
			5'b10011: instruction = 32'h00000000;
			5'b10100: instruction = 32'h00000000;
			5'b10101: instruction = 32'h00000000;
			5'b10110: instruction = 32'h00000000;
			5'b10111: instruction = 32'h00000000;
			5'b11000: instruction = 32'h00000000;
			5'b11001: instruction = 32'h00000000;
			5'b11010: instruction = 32'h00000000;
			5'b11011: instruction = 32'h00000000;
			5'b11100: instruction = 32'h00000000;
			5'b11101: instruction = 32'h00000000;
			5'b11110: instruction = 32'h00000000;
			5'b11111: instruction = 32'h11110000;
		endcase
		end
endmodule
			
/*
module tb_instrmem;
	reg [0:4] address;
	wire [31:0] instruction;
	instrmem im(address,instruction);
	
	
	initial
	begin
	#2 address = 5'b00011;
	#2 address = 5'b00000;
	#2 address = 5'b11111;
	end
	
	initial
	$monitor($time, " %b" , instruction);
	
endmodule
*/