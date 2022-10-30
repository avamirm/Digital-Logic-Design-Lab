`timescale 1ns/1ns
module CounterTB();
   reg [5:0] in = 6'd9;
   wire co;
   reg clk = 1'b0;
   reg rst = 1'b1;
   Counter8Bit C( co,  in,  clk, rst, co);
   always #5 clk = ~clk;
   initial begin
   #7 rst = 1'b0;
   #7 rst = 1'b1;
   #50000 $stop;
   end
endmodule

