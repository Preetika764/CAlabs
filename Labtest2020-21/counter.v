module RSFF(R,S,Q,Qbar,clock,reset);
	input R,S,clock,reset;
	output reg Q,Qbar;
	always @ (posedge clock)
		begin
		if((S == 1'b0 && R == 1'b1) | (reset == 1'b1))
			begin
			Q <= 1'b0;
			Qbar <= 1'b1;
			end
		else if (S == 1'b1 && R == 1'b0)
		 begin
		 Q <= 1'b1;
		 Qbar <= 1'b0;
		 end
		else if (S == 1'b1 && R == 1'b1)
			begin
			Q <= 1'b1;
			Qbar <= 1'b0;
			end
		else
			begin
			Q <= 1'bx;
			Qbar <= 1'bx;
			end
		end
endmodule
			
/*		
module tb_rsff;
	reg R,S,clock;
	wire Q,Qbar;
	
	RSFF myff(R,S,Q,Qbar,clock,reset);
	
	always 
	#1 clock = ~clock;

	initial
	begin
	#1 clock = 1'b1; reset = 1'b0;
	#5 R = 1'b0; S = 1'b0;
	#5 R = 1'b0; S = 1'b1;
	#5 R = 1'b1; S = 1'b0;
	#5 R = 1'b1; S = 1'b1;
	#10 $finish;
	end
	
	initial
	$monitor($time," %b %b %b %b", S , R ,Q, Qbar);
	
endmodule
*/

module DFF(D,clock,Q,Qbar,reset);
	input D,clock,reset;
	output Q,Qbar;
	buf (S,D);
	not (R,D);
	RSFF myff(R,S,Q,Qbar,clock,reset);
	
endmodule

/*
module tb_DFF;

	initial
	begin
    $dumpfile("counter.vcd");
    $dumpvars(0,tb_DFF);
	end
	reg D,clock,reset;
	wire Q,Qbar;
	DFF mydff(D,clock,Q,Qbar,reset);
	always 
	#1 clock = ~clock;

	initial
	begin
	#1 clock = 1'b1;	reset = 1'b0;
	#3 D = 1'b0;
	#6 D = 1'b1;
	#10 $finish;
	end
	
	initial
	$monitor($time," %b %b %b", D ,Q, Qbar);
	
endmodule
*/

module Ripple_Counter(clock,reset,Q);
	output [3:0] Q;
	input clock,reset;
	wire [0:3] Qbar;
	
	DFF dff1(Qbar[0],clock,Q[0],Qbar[0],reset);
	DFF dff2(Qbar[1],Qbar[0],Q[1],Qbar[1],reset);
	DFF dff3(Qbar[2],Qbar[1],Q[2],Qbar[2],reset);
	DFF dff4(Qbar[3],Qbar[2],Q[3],Qbar[3],reset);
	
endmodule

/*
module tb_counter;
	
	reg clock, reset;
	wire [0:3]Q;
	Ripple_Counter mycounter(clock,reset,Q);
	initial
	begin
    $dumpfile("counter.vcd");
    $dumpvars(0,tb_counter);
	end
	
	initial
	begin
	#0 clock = 1'b1;	reset = 1'b1;
	#1 reset = 1'b0;
	#100 $finish;
	end
	
	always 
	#1 clock = ~clock;
	initial
	$monitor($time," %b", Q);
	
endmodule
*/