module stimulus;

	reg [3:0] in;
	wire [3:0] out;
	
	bcdToGray_gate myconverter(out, in);
	
	initial
	begin
		$monitor($time," in = %4b, out = %4b\n",in,out);
		#0 in = 4'd0;
			repeat(9)
		#10 in = in + 4'b0001; 
		
	end
	
endmodule
		