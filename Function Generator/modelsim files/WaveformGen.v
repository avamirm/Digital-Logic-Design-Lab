module WaveformGen(output reg[7:0] out, input[1:0] sel, input clk, rst);
    reg [7:0] counter;
    always @(posedge clk,negedge rst)begin
	 if(~rst)
	   counter <= 8'd0;
        else
           counter <= counter + 1'b1;
     end

    always @(counter, sel) begin
        if (sel == 2'b00)begin
            if (counter < 8'd128)
                out <= 8'd0;
            else if (counter > 8'd127) 
                out <= 8'd255;
        end
        else if (sel == 2'b01)begin
            if (counter < 8'd128)
                out <= counter ;
            else if (counter > 8'd127)
                out <= 8'd255 - counter;
        end
        else if (sel == 2'b10)begin
            if (counter > 8'd1)
                out <= (8'd255/(8'd255 - counter));
            else
                out <= 8'd0;
        end
    end
endmodule
