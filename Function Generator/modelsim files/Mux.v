module Mux(output [7:0] out, input[7:0] in1, in2, input sel);
    assign out = (sel) ? in2 : in1;
endmodule
