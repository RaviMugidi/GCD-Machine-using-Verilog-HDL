`timescale 1ns / 1ps

module GCD(out,done,clk,rst,in1,in2,go);

input [31:0]in1,in2;
input clk,rst,go;

output [31:0]out;
output done;

wire a_gt_b,a_lt_b,a_eq_b; 
wire a_ld,b_ld,a_sel,b_sel; 
wire output_en;

controller c1(a_ld,b_ld,a_sel,b_sel,output_en,done,clk,rst,go,a_gt_b,a_lt_b,a_eq_b);
datapath d1(a_gt_b,a_lt_b,a_eq_b,out,output_en,clk,rst,a_ld,b_ld,a_sel,b_sel,in1,in2);
 
endmodule
 