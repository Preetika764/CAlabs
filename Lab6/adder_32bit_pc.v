module adder_32bitPC(address);
	input [31:0] address;
	output reg[31:0] result;
	always @ (address)
		result = address + 32'd4;
endmodule

