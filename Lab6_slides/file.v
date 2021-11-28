module d_ff(q, d, clock, reset);
  input d, clock, reset;
  output  q;
  reg q;
  always @ (posedge clock or negedge reset)
  if(~reset)
    q = 1'b0;
  else
    q = d;
endmodule

module ControlLogic(input S,input Z, input X, input CLK, input reset, output T0, output T1, output T2);
	
	wire x1,x2,x3;
	assign x1 = (T0 & ~S)|(T2 & Z);
	assign x2 = (T0 & S)|(T2 & ~X & ~Z)|(T1 & ~X);
	assign x3 = (T1 & X)|(T2 & ~Z & X);
	d_ff d1(T0, x1, CLK, reset);
	d_ff d2(T1, x2, CLK, reset);
	d_ff d3(T2, x3, CLK, reset);
endmodule
	
module TFF(q, t, clock, reset);
  input t, clock, reset;
  output  q;
  reg q;
  always @ (posedge clock or negedge reset)
  if(~reset)
    q = 1'b0;
  else
    if (t)
		q = ~q;
	else
		q = q;
endmodule

module COUNTER_4BIT(clock,reset,Q);
	output [3:0] Q;
	input clock,reset;
	wire y1,y2;
	assign y1 = Q[0] & Q[1];
	assign y2 = y1 & Q[2];
	
	reg ip;
	initial
	ip = 1'b1;
	
	TFF t1(Q[0],ip,clock,reset);
	TFF t2(Q[1],Q[0],clock,reset);
	TFF t3(Q[2],y1,clock,reset);
	TFF t4(Q[3],y2,clock,reset);
	
endmodule

module INTG(input S, input CLK, output G, output [3:0] Q);
	reg reset;
	initial
	#0 reset = 1'b0;
	#1 reset = 1'b1;
	
	wire syncclear;
	assign syncclear = T0 & S;
	COUNTER_4BIT counter(CLK,syncclear,Q);
	wire temp, T0, T1, T2, Z, X;
	assign temp = Q[0] & Q[1] & Q[2] & Q[3];
	ControlLogic(S,Z,X,CLK, reset, T0, T1, T2);