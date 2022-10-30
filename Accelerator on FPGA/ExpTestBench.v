`timescale 1ns/1ns

module ExpTB();
    wire [15:0] fractionalPart;
    wire [1:0] integerPart;
    wire done;

    reg [15:0] x;
    reg clk = 1'b0, rst = 1'b0, start = 1'b0;
    
    exponential Exp(.x(x), .start(start), .clk(clk), .rst(rst), .done(done), .intpart(integerPart), .fracpart(fractionalPart));

    always #5 clk = ~clk;

    initial begin
        #3 rst = 1'b1;
        #3 rst = 1'b0;
        #10 x = 16'h8000;
        #0 start = 1'b1;
        #10 start = 1'b0;
        while (~done) #10;
        #100;
        #10 x = 16'hCCCC;
        #0 start = 1'b1;
        #10 start = 1'b0;
        while (~done) #10;
        #100;
        #10 x = 16'h3333;
        #0 start = 1'b1;
        #10 start = 1'b0;
        while (~done) #10;
        #100;
        #10 x = 16'hFD70;
        #0 start = 1'b1;
        #10 start = 1'b0;
        while (~done) #10;
        #100;
        #10 x = 16'h028F;
        #0 start = 1'b1;
        #10 start = 1'b0;
        while (~done) #10;
        #100;
        #100 $stop;
    end
endmodule

