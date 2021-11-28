module testbench;

	reg cin = 1'b0;
	reg[0:7] in1,in2;
	wire cout;
	wire[0:7] out;
	adder_8bits myadder(in1,in2,cin,out,cout);
	initial 
		begin
			$monitor($time, "in1 = %b | in2 = %b | out = %b | out = %d | cout = %b",in1,in2,out,out,cout);
			#0 in1 = 8'd0;	in2 = 8'd45;
			#4 in1 = 8'd32;	in2 = 8'd45;
			#4 in1 = 8'd9;	in2 = 8'd5;
			#4 in1 = 8'd23;	in2 = 8'd44;
			#4 in1 = 8'd12;	in2 = 8'd4;
			#4 in1 = 8'd22;	in2 = 8'd43;
			#4 in1 = 8'd16;	in2 = 8'd45;
			#4 in1 = 8'd62;	in2 = 8'd11;
		end
endmodule