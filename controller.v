`timescale 1ns / 1ps
module controller(a_ld,b_ld,a_sel,b_sel,output_en,done,clk,rst,go,a_gt_b,a_lt_b,a_eq_b);

input clk,rst,go;
input a_gt_b,a_lt_b,a_eq_b;

output reg a_ld,b_ld,a_sel,b_sel;
output reg output_en,done;

reg [2:0] cState,nState;


parameter a=3'b000;
parameter b=3'b001;
parameter c=3'b010;
parameter d=3'b011;
parameter e=3'b100;
parameter f=3'b101;
parameter g=3'b110;
parameter h=3'b111;

initial nState<=a;

always @(posedge clk)
    begin 
	   if(rst==1)
		  cState<=a;
		else
		  cState<=nState;
	 end
	 
always @(go or a_gt_b or a_lt_b or a_eq_b or cState)
    begin
	   case(cState)
		    a:begin
			     if(go==0) nState<=a;
				  else nState <=b;
				end
			 
			 b:nState<=c;
			 
			 c:nState <=d;
			 
			 d:begin
			      if({a_gt_b,a_lt_b,a_eq_b}==3'b100)
					   nState <=e;
					else if({a_gt_b,a_lt_b,a_eq_b}==3'b010)
					   nState <=f;
					else if({a_gt_b,a_lt_b,a_eq_b}==3'b001)
					   nState <= h;
					//else nState <= h;////edited
				end
				
			  e:nState <= g;
			  f:nState <= g;
			  g:nState <= d;
			  h:nState <= a;
			  
			  default : nState<=a;
		 endcase
				
	 end
always @(go or a_gt_b or a_lt_b or a_eq_b or cState)
    begin
	   case(cState)
		    a:
			  begin
			   a_sel<=0;
				b_sel<=0;
				a_ld<=0;
				b_ld<=0;
				output_en<=0;
				done<=0;
			  end
			 
			 b:
			  begin
			   a_sel<=0;
				b_sel<=0;
				a_ld<=1;
				b_ld<=1;
				output_en<=0;
				done<=0;
			  end
			 
			 c:
			  begin
			   a_sel<=1;
				b_sel<=1;
				a_ld<=0;
				b_ld<=0;
				output_en<=0;
				done<=0;
			  end
			 
			 d:             //compare state
			  begin
			   a_sel<=0;// a=0 b=0
				b_sel<=0;
				a_ld<=0;
				b_ld<=0;
				output_en<=0;
				done<=0;
			  end
			 
			 e:              //a=a-b state
			  begin
			   a_sel<=1;
				b_sel<=0;
				a_ld<=1;
				b_ld<=0;
				output_en<=0;
				done<=0;
			  end
			 
			 f:             //b=b-a state
			  begin
			   a_sel<=0;
				b_sel<=1;
				a_ld<=0;
				b_ld<=1;
				output_en<=0;
				done<=0;
			  end
			 
			 g:            //waiting state
			  begin
			   a_sel<=0;
				b_sel<=0;
				a_ld<=0;
				b_ld<=0;
				output_en<=0;//en=1
				done<=0;
			  end
			 
			 h:             //
			  begin
			   a_sel<=0;
				b_sel<=0;
				a_ld<=0;
				b_ld<=0;
 				output_en<=1; //en=0
				done<=1;
			  end
			 default:
			  begin
			   a_sel<=0;
				b_sel<=0;
				a_ld<=0;
				b_ld<=0;
				output_en<=0;
				done<=0;
			  end
			endcase
		end

endmodule
