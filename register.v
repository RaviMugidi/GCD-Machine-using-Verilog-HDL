`timescale 1ns / 1ps
module register(rnout,clk,rst,load,rin);

input [31:0] rin;
input clk,rst,load;

output reg [31:0] rnout;

always @(posedge clk)
     begin
	  if(rst==1)
	    rnout<=0;
	  else if(load==1)
	    rnout<=rin;
	  //else 
	   // rnout <= 0;////edited
	  end
	  
endmodule
