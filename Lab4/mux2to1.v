module mux2to1(out,sel,in2,in1);
	input in1,in2,sel;
	output out;
	wire not_sel, a1,a2;
	not (not_sel,sel);
	and (a1,not_sel,in2);
	and (a2, sel,in1);
	or (out, a1,a2);
endmodule