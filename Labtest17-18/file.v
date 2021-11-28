module MUX_SMALL(out, select, in1, in2);
  input in1, in2, select;
  output  out;
  assign out = select ? in2 : in1;
endmodule

module MUX_BIG(out, select, in1, in2);
	input [0:7] in1, in2;
	input select;
	output [0:7] out;
	
	MUX_SMALL m0(out[0],select,in1[0],in2[0]);
	MUX_SMALL m1(out[1],select,in1[1],in2[1]);
	MUX_SMALL m2(out[2],select,in1[2],in2[2]);
	MUX_SMALL m3(out[3],select,in1[3],in2[3]);
	MUX_SMALL m4(out[4],select,in1[4],in2[4]);
	MUX_SMALL m5(out[5],select,in1[5],in2[5]);
	MUX_SMALL m6(out[6],select,in1[6],in2[6]);
	MUX_SMALL m7(out[7],select,in1[7],in2[7]);

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
	

module COUNTER_3BIT(input clock, input clearb, input y, output [0:2] Q);

	wire [0:3] Q1;
	COUNTER_4BIT mycounter(clock, clearb, y,Q1);
	assign Q = Q1[1:3];
endmodule

module MEMORY(address,out);
	input [3:0] address;
	output reg[7:0] out;
	reg [7:0] memory [0:15];
	integer add;
	initial begin
    memory[0] = 8'hCC;
    memory[1] = 8'hAA;  
    memory[2] = 8'hCC;
	memory[3] = 8'hAA;
	memory[4] = 8'hCC;
	memory[5] = 8'hAA;
	memory[6] = 8'hCC;
	memory[7] = 8'hAA;
	memory[8] = 8'hCC;
    memory[9] = 8'hAA;  
    memory[10] = 8'hCC;
	memory[11] = 8'hAA;
	memory[12] = 8'hCC;
	memory[13] = 8'hAA;
	memory[14] = 8'hCC;
	memory[15] = 8'hAA;
	end
	always @ (address) begin
	add = address[3:0];
	out = memory[add];
	end 
endmodule


module counter_tb;
	
	reg clock,clearb,y;
	wire [0:2] Q;
	
	COUNTER_3BIT counter(clock, clearb, y,Q);
	
	initial
	begin
	#0 clock = 1'b1; clearb = 1'b0; y = 1'b1;
	#2 clearb = 1'b1;
	#50 $finish;
	end
	
	always
	#2 clock = ~clock;
	
	initial
	$monitor($time, " %b", Q);

endmodule
	
	