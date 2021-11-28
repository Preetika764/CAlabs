module decoder2_4 (register,reg_no);

	input [1:0] reg_no;
	output [0:3] register;
	
	wire [1:0] reg_not;
	
	not(reg_not[0],reg_no[0]);
	not(reg_not[1],reg_no[1]);
	and(register[0],reg_not[1],reg_not[0]);
	and(register[1],reg_not[1],reg_no[0]);
	and(register[2],reg_no[1],reg_not[0]);
	and(register[3],reg_no[1],reg_no[0]);
	
endmodule

/*
module tb_decoder;
	
	reg [1:0] reg_no;
	wire [3:0] register;
	
	decoder2_4 mydecoder(register,reg_no);
	
	initial
	begin
	#5 reg_no = 2'b00;
	#5 reg_no = 2'b01;
	#5 reg_no = 2'b10;
	#5 reg_no = 2'b11;
	end
	
	initial
	$monitor("%b %b",register,reg_no);
	
endmodule
*/

	
