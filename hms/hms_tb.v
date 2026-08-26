module tb;
reg clk = 0, rst = 1, sel = 0, inc = 0, dec = 0, rel = 0;
reg selnba = 0, incnba = 0, decnba = 0, relnba = 0;
wire [4:0] hrs;
wire [5:0] min, sec;

always @* begin 
	incnba <= inc;
	decnba <= dec;
	selnba <= sel;
	relnba <= rel;
end 

hms DEVARA (clk, rst, selnba, incnba, decnba, relnba, hrs, min, sec);

always #5 clk = !clk;

initial #2 rst = 0;

`include "tasks.v"

//test 0
initial begin 
	repeat (60*60*24) @(posedge clk);
	repeat (5) @(posedge clk);
	$finish;
end 

//`include "testcase1.v"
//`include "testcase2.v"
//`include "testcase3.v"
//`include "testcase4.v"
//`include "testcase5.v"
//`include "testcase6.v"
//`include "testcase7.v"
//`include "testcase8.v"
//`include "testcase9.v"
//`include "testcase10.v"
endmodule

