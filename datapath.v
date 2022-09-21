`timescale 1ns / 1ps

module datapath(a_gt_b,a_lt_b,a_eq_b,out,output_en,clk,rst,a_ld,b_ld,a_sel,b_sel,in1,in2);

input clk,rst;
input a_ld,b_ld,a_sel,b_sel;
input [31:0]in1,in2;
input output_en;

output [31:0]out;
output a_gt_b,a_lt_b,a_eq_b;

wire [31:0] ta,tb,ts1,ts2,tm1,tm2;

substractor s1(ts1,ta,tb);
substractor s2(ts2,tb,ta);

mux m1(tm1,in1,ts1,a_sel);
mux m2(tm2,in2,ts2,b_sel);


register ra(ta,clk,rst,a_ld,tm1);
register rb(tb,clk,rst,b_ld,tm2);
register rout(out,clk,rst,output_en,tb);

comparator com(a_gt_b,a_lt_b,a_eq_b,ta,tb);

endmodule
