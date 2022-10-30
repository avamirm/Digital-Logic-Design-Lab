`timescale 1ns/1ns
module functionGenTB();
    wire [7:0] out;
    wire dacOut;
    reg [9:0] sel = 10'd3;
    reg clk = 1'b0, rst = 1'b1;
always #5 clk = ~clk;
//DAC dac(dacOut,out, clk,rst);
 FunctionGenerator FG(
	dacOut,
	clk,
	rst,
	sel,
	out);
    initial begin
        #15 rst = 1'b0;
        #20 rst = 1'b1;
        #450000 
        #450000 sel = 10'b0000001000;
        #600000 //sel = 10'd2;
        #450000000 $stop;
    end
endmodule
