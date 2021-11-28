module jumptarget(lsuout,pcincrem);
	input [27:0] lsuout;
	input [3:0] pcincrem;
	output reg [31:0] jumptarget;
	always @ (lsuout or pcincrem)
	begin
	jumptarget [31:28] = pcincrem[3:0];
	jumptarget [27:0] = lsuout[27:0];
	end
endmodule