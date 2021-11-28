module testbench;
	
	reg [3:0] a,b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	wire overflow;
	fulladder myadder(a,b,sum,cout,overflow,cin);
	
	initial
	begin
	$monitor($time, "a = %b | b = %b | sum = %b | carry = %b | overflow=%b",a,b,sum,cout,overflow);
	cin = 1'b0;
	#0 a = 4'd5; b = 4'd15;
	#4 a = 4'd6; b = 4'd10;
	#4 a = 4'd8; b = 4'd8;
	#4 a = 4'd8; b = 4'd1;
	end
endmodule