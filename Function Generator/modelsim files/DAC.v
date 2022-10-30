module DAC(output reg out,input[7:0]in,input clk,rst);
	reg[7:0] counter;
	always @(posedge clk, negedge rst) begin
    	    if(~rst)
      		  counter <= 8'd0;
    	    else 
      		  counter <= counter + 1'b1;
	end
	always@(counter,in)begin
             if(counter > in)
		  out = 1'b0;
	     else 
                  out = 1'b1;
	end
endmodule
