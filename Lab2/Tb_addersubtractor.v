module testbench;
	
	reg [3:0] a,b;
	reg signal;
	wire [3:0] sum;
	wire cout;
	wire overflow;
	fulladder myadder(a,b,sum,cout,overflow,signal);
	
	initial
	begin
	$monitor($time, "a = %b | b = %b | sum = %b | carry = %b | overflow=%b | signal = %b",a,b,sum,cout,overflow, signal);
	
	#0 a = 4'd5; b = 4'd15; signal = 1'b0;
	#4 a = 4'd6; b = 4'd10; signal = 1'b0;
	#4 a = 4'd8; b = 4'd8; signal = 1'b1;
	#4 a = 4'd8; b = 4'd1; signal = 1'b1;
	end
endmodule