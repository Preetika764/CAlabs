module fulladder(a,b,sum,cout,overflow,cin);
	input [3:0] a,b;
	input cin;
	output [3:0] sum;
	reg sum;
	output reg cout,overflow;
	reg c3;
	reg [2:0] temp;
	
	always @ (a or b or cin)
		begin
		
		{cout,sum} = a + b + cin;
		{c3,temp} = a[2:0] + b[2:0] + cin;
		overflow = c3^cout;
		end
endmodule
			
		
		
	