module adder(inputA,inputB,result);
	input [31:0] inputA,inputB;
	output reg[31:0] result;
	always @ (inputA or inputB)
		result = inputA + inputB;
endmodule

/*
module tb_adder;
	
	reg [31:0] inputA,inputB;
	wire [31:0] result;
	
	adder myadder(inputA,inputB,result);
	
	initial
	begin
	#1 inputA = 32'd4;	inputB = 32'd5;
	#1 inputA = 32'd10;	inputB = 32'd0;
	end
	
	initial
	$monitor($time," %d %d %d",inputA,inputB,result);
endmodule
*/