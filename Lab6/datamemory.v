module datamemory(address,WriteData,MemRead,MemWrite,ReadData,clock);
	input [31:0] address,WriteData;
	input MemRead,MemWrite;
	output reg[31:0] ReadData;
	input clock;
	
	integer i;
	reg [31:0] dm[127:0];
	initial
	begin
		for(i = 0; i < 128; i= i+1)
		dm[i] <= 32'd0;
	end
	
	always @ (posedge clock)
			if (MemWrite == 1)
				dm[address] = WriteData;
	always @ (posedge MemRead)
		ReadData = dm[address];
		
endmodule

/*
module tb_datamem;

	reg [31:0] address,WriteData;
	reg MemRead,MemWrite;
	wire [31:0] ReadData;
	reg clock;
	datamemory dm(address,WriteData,MemRead,MemWrite,ReadData,clock);
	initial
	clock = 1'b0;
	
	always
	#2 clock = ~clock;
	
	initial
	begin
	MemRead = 1'b0;
	MemWrite = 1'b0;
	
	#1 $display("Reading a register");
	#1 address = 32'd7; MemRead = 1'b1;
	#4 $display("%b %b", ReadData, MemRead);
	#1 MemRead = 1'b0;
	
	#1 $display("Writing a register");
	#1 MemWrite = 1'b1; WriteData = 32'd5;
	#4 MemWrite = 1'b0;
	
	#2 MemRead = 1'b1;
	#4 $display("%b %b", ReadData, MemRead);
	#4 $finish;
	end
	
endmodule
*/