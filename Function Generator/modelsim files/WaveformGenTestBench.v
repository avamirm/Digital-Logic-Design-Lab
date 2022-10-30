`timescale 1ns/1ns
module waveformGenTestBench();
    wire [7:0] waveGenOut;
    reg [1:0] sel = 2'b00;
    reg clk = 1'b0, rst = 1'b1;
    WaveformGenerator waveGen(out, sel, clk, rst);
always #5 clk = ~clk;
 /*FunctionGenerator FG(
waveGenOut,
	clk,
	rst,
	sel);*/
    initial begin
        #15 rst = 1'b0;
        #20 rst = 1'b1;
        #45000 sel = 2'b01;
        #45000 sel = 2'b10;
        #45000 $stop;
    end
endmodule
