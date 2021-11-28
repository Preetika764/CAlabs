module DFF(input d, output reg q, input clearb, input clock);
	
	always @ (posedge clock)
		begin
		if(!clearb)
			q <= 1'b0;
		else
			q <= d;
		end
endmodule

module ControlLogic(input S, input Z, input X, input CLK, input clearb, output T0, output T1, output T2);

	wire dt0,dt1,dt2;
	assign dt0 = (T0 & ~S) | (T2 & Z);
	assign dt1 = (T0 & ~S) | (T2 & ~X & ~Z) | (T1 & ~X);
	assign dt2 = (T1 & X) | (T2 & ~Z & X);
	DFF d0(dt0,T0,clearb,CLK);
	DFF d1(dt1,T1,clearb,CLK);
	DFF d2(dt2,T2,clearb,CLK);
endmodule
	

module TFF(input t, output reg q, input clearb,input clock);

	always @ (posedge clock)
	begin
	if(!clearb)
		q <= 1'b0;
	else
		if(t)
			q <= ~q;
		else
			q <= q;
	end
endmodule

module COUNTER_4BIT(input clock, input clearb, input y, output [3:0] Q);

	wire y1,y2;
	assign y1 = Q[0] & Q[1];
	assign y2 = y1 & Q[2];
	TFF t0(y,Q[0],clearb,clock);
	TFF t1(Q[0],Q[1],clearb,clock);
	TFF t2(y1,Q[2],clearb,clock);
	TFF t3(y2,Q[3],clearb,clock);
	
endmodule

module INTG(input clock, input S, input X, input clearb, output [3:0] Q, output G);
	
	wire synclear, T0, T1, T2, EN, Z;
	assign synclear = (T0 & S);
	assign EN = (T1 & X) | (T2 & ~Z & X);
	assign Z = Q[0] & Q[1] & Q[2] & Q[3];
	COUNTER_4BIT counter(clock, synclear, EN, Q);
	ControlLogic controller(S, Z, X, clock, clearb, T0, T1, T2);
	wire yd;
	assign yd = Z & T2;
	DFF d(yd, G, clearb, clock);

endmodule

module Testbench;

	reg clock, clearb, S, X;
	wire [3:0] Q;
	wire G;
	INTG integrate(clock, S, X, clearb, Q, G);
	
	initial
	begin
	#0 clock = 1'b1;	clearb = 1'b0;
	#2 clearb = 1'b1; S = 1'b1; X = 1'b1;
	#100 $finish;
	end
	
	initial 
	$monitor($time, " %b %b", Q, G);
	
	always 
	#1 clock = ~clock;
	
endmodule