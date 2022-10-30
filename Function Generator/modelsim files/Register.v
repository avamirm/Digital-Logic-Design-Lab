module Register8bit(output reg [7:0]out,input [7:0]in,input clk,rst);
	always@(posedge clk,negedge rst)begin
		if(~rst) 
                    out <= 8'b0;
		else 
                    out <= in;
	end
endmodule
