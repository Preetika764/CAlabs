`timescale 1ms/1ms

module MUX_2x1(out, select, in1, in2);
  input in1, in2, select;
  output  out;
  assign out = select ? in2 : in1;
endmodule

module MUX_8x1(out, select, in);
	input [0:7] in;
	input [2:0] select;
	output out;
	assign out = select[2] ? (select[1] ? (select[0] ? in[7] : in[6]) : (select[0] ? in[5] : in[4])) :  
							 (select[1] ? (select[0] ? in[3] : in[2]) : (select[0] ? in[1] : in[0]));
endmodule

module MUX_ARRAY(C,E,F,D);
	input [0:7] C,F,D;
	output [0:7] E;

  genvar  j;
  generate  for(j = 0; j < 8; j = j + 1)  
    begin:  mux_loop
      MUX_2x1 m(E[j], F[j], D[j], C[j]);
    end
  endgenerate
  
 endmodule
 
module COUNTER_3BIT(CLEAR,CLK,Q);
	input CLEAR,CLK;
	output reg [2:0] Q;
	
	initial 
	Q = 3'b000;
	
	always @ (posedge CLK)
		Q = Q+1;
	always @ (CLEAR)
		if (CLEAR)
			Q = 0;
endmodule;

module MEMORY(address,out);
	input [2:0] address;
	output reg[0:7] out;
	reg [0:7] memory [0:7];
	integer add;
	initial begin
    memory[0] = 8'h01;
    memory[1] = 8'h03;  
    memory[2] = 8'h07;
	memory[3] = 8'h0F;
	memory[4] = 8'h1F;
	memory[5] = 8'h3F;
	memory[6] = 8'h7F;
	memory[7] = 8'hFF;
	end
	always @ (address) begin
	add = address[2:0];
	out = memory[add];
	end 
endmodule

module DECODER(A,B,EN);

	input EN;
	input [2:0] A;
	output reg [7:0] B;
	always @ (A)	begin 
		if(EN)
		begin
	case (A)
	3'b000 : B = 8'b00000001;
	3'b001 : B = 8'b00000010;
	3'b010 : B = 8'b00000100;
	3'b011 : B = 8'b00001000;
	3'b100 : B = 8'b00010000;
	3'b101 : B = 8'b00100000;
	3'b110 : B = 8'b01000000;
	3'b111 : B = 8'b10000000;
	
	default  : B = 8'd0;
	endcase
	end
	end
	
endmodule
	
module TOP_MODULE(input CLEAR, input CLOCK, input EN, output O,input [2:0] address);	
	
	wire [2:0] Q;
	wire [7:0] B;
	wire [0:7] out;
	wire [0:7] E,F;
	reg [0:7] D;
	initial 
	D = 8'd0;
	
	COUNTER_3BIT m0(CLEAR,CLOCK,Q);
	DECODER m1(Q,B,EN);
	MUX_ARRAY m3(B,E,F,D);
	MEMORY m2(address,F);
	MUX_8x1 m4(O, Q, E);

endmodule;

module TB_TOPMODULE;

	initial begin
		 $dumpfile("file.vcd");
		$dumpvars(0,TB_TOPMODULE);
	end
	
	reg CLEAR,CLOCK,EN;
	wire O;
	reg [2:0] address;
	
	TOP_MODULE mod(CLEAR, CLOCK, EN, O, address);
	
	
	
	initial begin
	#0	CLOCK = 1'b1; EN = 1'b1; address = 3'b0;
	#1  CLEAR = 1'b1;
	#2	CLEAR = 1'b0;
	#30 $finish;
	end
	
	always
	#8	address = address+1;
	
	always	
	#1 CLOCK = ~CLOCK;
	
	initial
	$monitor($time,"  , CLOCK = %b, S = %b, CLEAR = %b, O = %b", CLOCK, address, CLEAR, O);
	
	
endmodule