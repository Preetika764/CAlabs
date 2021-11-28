module ALUcontrol(F,ALUOp0,ALUOp1,Operation);
	output [0:2] Operation;
	input [5:0] F;
	output ALUOp0,ALUOp1;
	assign Operation[0] = (F[3]||F[0]) && ALUOp1;
	assign Operation[1] = ~(ALUOp1||F[2]);
	assign Operation[2] = ALUOp0 || (ALUOp1 && F[1]);
endmodule
	
