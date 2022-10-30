module AmplitudeSelector(output[7:0]out,input[1:0]division, input[7:0]in);
	assign out = in >>> division;
endmodule
