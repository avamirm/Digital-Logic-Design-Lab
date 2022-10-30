module Counter8Bit(output co, input[5:0] in, input clk, rst, load);
    reg[7:0] out;
    always@(posedge clk,negedge rst)begin
	if(~rst)
	    out <=  8'd256 - {in, 2'b00};
	else if(load)
            out <= 8'd256 - {in, 2'b00};
        else
	    out <= out + 1'b1;
	end
    assign co = &out;
endmodule
