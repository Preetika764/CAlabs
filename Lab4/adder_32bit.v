module adder_32bit (Cout, Sum,In1,In2,Cin);
 input[0:31] In1,In2;
 input Cin;
 output Cout;
 output[0:31] Sum; 
 assign {Cout,Sum}=In1+In2+Cin;
endmodule


	