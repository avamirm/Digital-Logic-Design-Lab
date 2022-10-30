`timescale 1ns/1ns
module TestBench();
    wire [15:0] Res;
    wire [6:0] HEX0, HEX1, HEX2, HEX3;
    wire done;
    reg [7:0] in ;
    reg clk = 1'b1;
    reg  rst;
    reg putOut;
    reg getA = 1'b1;
    reg getB = 1'b1;
    reg start = 1'b0;
    Radix4Multiplier radix4(Res, HEX0, HEX1, HEX2, HEX3, done, in, start, getA, getB, putOut, clk, rst);
    always #10 clk = ~clk;
    initial begin
        #17 rst = 1'b1;
        #17 rst = 1'b0;
        #17 start = 1'b1;
        in = 8'b11111111;
        #26 getA = 1'b0;
        #23 in = 8'b11111111;
        #56 getA = 1'b1;
        #56 getA = 1'b0;
        #30 in = 8'd4;
        #26 getB = 1'b0;
        #30 in = 8'd0;
        #26 getB = 1'b1;
        #26 getB = 1'b0;
        #150 putOut = 1'b1;
        #30 putOut = 1'b0;
        #2000 $stop;
    end
endmodule