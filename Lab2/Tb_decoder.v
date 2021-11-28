module testbench;

	reg x,y,z;
	wire s,c;
	fulladder myadder(s,c,x,y,z);
	initial 
		begin
			$monitor($time, "x = %b | y = %b | z = %b | c = %b | s = %b",x,y,z,c,s);
			#0 x = 1'b0;	y = 1'b0;	z = 1'b0;
			#4 x = 1'b0;	y = 1'b0;	z = 1'b1;
			#4 x = 1'b0;	y = 1'b1;	z = 1'b0;
			#4 x = 1'b0;	y = 1'b1;	z = 1'b1;
			#4 x = 1'b1;	y = 1'b0;	z = 1'b0;
			#4 x = 1'b1;	y = 1'b0;	z = 1'b1;
			#4 x = 1'b1;	y = 1'b1;	z = 1'b0;
			#4 x = 1'b1;	y = 1'b1;	z = 1'b1;
		end
endmodule