`include "mux.v"

module MEM1(address,data,parity);
	
	input [2:0] address;
	reg [8:0] bank1[0:7];
	output reg[7:0] data;
	output reg parity;
	integer loc;
	
	initial 
	begin
	bank1[0] = 9'b000111111;
	bank1[1] = 9'b001100011;
	bank1[2] = 9'b010100111;
	bank1[3] = 9'b011101011;
	bank1[4] = 9'b100101111;
	bank1[5] = 9'b101110011;
	bank1[6] = 9'b110110111;
	bank1[7] = 9'b111111011;
	end
	
	always @ (address)
	begin
	loc = address[2:0];
	data = bank1[loc][8:1];
	parity = bank1[loc][0];
	end
endmodule
	
	
module MEM2(address,data,parity);
	
	input [2:0] address;
	reg [8:0] bank2[0:7];
	output reg[7:0] data;
	output reg parity;
	integer loc;
	
	initial 
	begin
	bank2[0] = 9'b000000000;
	bank2[1] = 9'b001000100;
	bank2[2] = 9'b010001000;
	bank2[3] = 9'b011001100;
	bank2[4] = 9'b100010000;
	bank2[5] = 9'b101010100;
	bank2[6] = 9'b110011000;
	bank2[7] = 9'b111011100;
	end
	
	always @ (address)
	begin
	loc = address[2:0];
	data = bank2[loc][8:1];
	parity = bank2[loc][0];
	end
endmodule

module Fetch_data(address, data, parity);
	
	input [3:0] address;
	output [0:7] data;
	output parity;
	wire [7:0] data1,data2;
	wire parity1,parity2;
	
	MEM1 m1(address[2:0],data1,parity1);
	MEM2 m2(address[2:0],data2,parity2);
	mux16to8 m8(data1,data2,address[3],data);
	mux2to1 m(parity1,parity2,address[3],parity);
endmodule
	