module reg1(A,B,ctrl,Aout,Bout,clock,ctrlout);
	input [0:3] A,B;
	input [0:2] ctrl;
	input clock;
	output reg[0:3] Aout,Bout,ctrlout;
	always @ (negedge clock)
	begin
		Aout = A;
		Bout = B;
		ctrlout = ctrl;
	end
endmodule
	
	