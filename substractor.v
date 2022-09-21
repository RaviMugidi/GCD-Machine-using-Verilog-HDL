`timescale 1ns / 1ps

module substractor(s1,a,b);

input [31:0] a,b;
output reg [31:0]s1;

always @(a or b)
     begin
	   s1=a-b;
	  end
endmodule
