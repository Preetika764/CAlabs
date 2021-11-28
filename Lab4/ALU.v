`include "bit32AND.v"
`include "bit32OR.v"
`include "adder_32bit.v"
`include "bit32_3to1mux.v"

module ALU(a,b,Binvert,Carryin,Operation,Result,CarryOut);
	input Binvert, Carryin;
	input [1:0] Operation;
	input [31:0] a,b;
	output [31:0] Result;
	output CarryOut;
	wire [31:0] bxor;
	assign bxor = b^{32{Binvert}};
	
	wire [31:0] OUT1;
	bit32AND andgate(OUT1,a,b);
	wire [31:0] OUT2;
	bit32OR orgate(a,b,OUT2);
	wire [31:0] OUT3;
	adder_32bit myadder(CarryOut,OUT3,a,bxor,Binvert);
	bit32_3to1mux M1(Result,Operation,OUT1,OUT2,OUT3);

endmodule


module tbALU();
	reg Binvert, Carryin;
	reg [1:0] Operation;
	reg [31:0] a,b;
	wire [31:0] Result;
	wire CarryOut;
	ALU myALU(a,b,Binvert,Carryin,Operation,Result,CarryOut);
	initial
	begin
	a=32'ha5a5a5a5;
	b=32'h5a5a5a5a;
	Operation=2'b00;
	Binvert=1'b0;
	Carryin=1'b0; //must perform AND resulting in zero
	#100 Operation=2'b01; //OR
	#100 Operation=2'b10; //ADD
	#100 Binvert=1'b1;//SUB
	#200 $finish;
	end
	
	initial
	$monitor("%b %b %b %b %b %b %b",a,b,Operation,Result,CarryOut,Carryin,Binvert);
	
endmodule