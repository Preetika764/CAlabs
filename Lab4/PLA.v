module ANDarray (RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp1,ALUOp2,Op);
	input [5:0] Op;
	output RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp1,ALUOp2;
	wire Rformat, lw,sw,beq;
	assign Rformat= (~Op[0])&& (~Op[1])&& (~Op[2])&& (~Op[3])&& (~Op[4])&& (~Op[5]);
	assign lw = (Op[0])&& (Op[1])&& (~Op[2])&& (~Op[3])&& (~Op[4])&& (Op[5]);
	assign sw = (Op[0])&& (Op[1])&& (~Op[2])&& (Op[3])&& (~Op[4])&&	(Op[5]);
	assign beq = (~Op[0])&& (~Op[1])&& (Op[2])&& (~Op[3])&& (~Op[4])&& (~Op[5]);
	// complete rest of the module
	assign RegDst=Rformat;
	assign ALUSrc = lw || sw;
	assign MemtoReg = lw;
	assign RegWrite = Rformat || lw;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign Branch = beq;
	assign ALUOp1 = Rformat;
	assign ALUOp2 = beq;
	
endmodule

module tb_pla;
	reg [5:0] Op;
	wire RegDst,ALUSrc,MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp1,ALUOp2;
	ANDarray myPLA (RegDst,ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite,Branch,ALUOp1,ALUOp2,Op);
	initial
	begin	
	Op = 6'b000000;
	#10 $display("%b %b %b %b %b %b %b %b %b %b",RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2,Op);
	#10 Op = 6'b100011;
	#10 $display("%b %b %b %b %b %b %b %b %b %b",RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2,Op);
	#10 Op = 6'b101011;
	#10 $display("%b %b %b %b %b %b %b %b %b %b",RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2,Op);
	#10 Op = 6'b000100;
	#10 $display("%b %b %b %b %b %b %b %b %b %b",RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2,Op);
	end
	
endmodule
	