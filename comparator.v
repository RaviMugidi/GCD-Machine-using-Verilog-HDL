`timescale 1ns / 1ps

module comparator(a_gt_b,a_lt_b,a_eq_b,a,b);

input [31:0] a,b;

output reg a_gt_b,a_lt_b,a_eq_b;

always @(a or b)
     begin 
	    
		 if(a>b)
		   {a_gt_b,a_lt_b,a_eq_b}<=3'b100;
		 else if(a<b)
		   {a_gt_b,a_lt_b,a_eq_b}<=3'b010;
		 else
		   {a_gt_b,a_lt_b,a_eq_b}<=3'b001;
	  end
	  
endmodule
