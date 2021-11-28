module bcdToGray_df(Out, In);
  input [3:0]In;
  output [3:0]Out;
  assign Out[3] = In[3];
  genvar index;
  for(index=2;index>=0;index=index-1)
	begin
		assign Out[index] = In[index] + In[index+1];
	end
  
endmodule