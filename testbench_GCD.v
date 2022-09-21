`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:28:28 09/11/2022
// Design Name:   GCD
// Module Name:   C:/Users/Ravi/GCD3/testbench_GCD.v
// Project Name:  GCD3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_GCD;

	reg clk;
	reg rst;
	reg [31:0] in1;
	reg [31:0] in2;
	reg go;

	wire [31:0] out;
	wire done;
	
	//integer i;
	
	initial clk=0;
	always@(clk) #20 clk <= ~clk;

	GCD uut (
		.out(out), 
		.done(done), 
		.clk(clk), 
		.rst(rst), 
		.in1(in1), 
		.in2(in2), 
		.go(go)
	);
   task initialize;
	begin
	  in1=0;
	  in2=0;
	  go=0;
	end
	endtask
	
	task reset;
	  begin
	    @(negedge clk)
		  rst <=1;
		  go<=0;
		  @(negedge clk)
		  rst <=0;
		  go <=1;
	  end
	  endtask
	task calculate(input [31:0]a,input [31:0]b);
	  begin
	    @(negedge clk)
		   go<=1;
		   in1 <= a;
			in2 <= b;
			#50 go<=0;
			#10000;
	  end
	  endtask
	initial begin
	 $monitor($time," %d %d %d",in1,in2,out);
    reset;
	 initialize;
	 calculate(48123,628163);
	 reset;
	 calculate(45,90);
	 reset;
	 calculate(2000,10000);
	 reset;
	 calculate(35,49);
		
	 end
      
endmodule

