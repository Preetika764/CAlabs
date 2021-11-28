module lsu(instruction_26,lsu_out);
	input[25:0] instruction_26;
	output reg[27:0] lsu_out;
	always @(instruction_26)
	begin
	lsu_out[27:2] = instruction_26;
	lsu_out[1:0] = 2'b00;
	end
endmodule

/*
module tb_lsu;
	reg[25:0] instruction_26;
	wire[27:0] lsu_out;
	lsu mylsu(instruction_26,lsu_out);
	initial
	begin
	#2 instruction_26 = 26'd4;
	#2 instruction_26 = 26'd7;
	end
	
	initial
	$monitor($time," %b %b",instruction_26,lsu_out);
	
endmodule
*/