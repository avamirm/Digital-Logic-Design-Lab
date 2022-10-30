module Final(input [15:0] in, output [6:0] HEX0, HEX1, HEX2, HEX3);
	Hexdisplay HD1 (in[3:0], HEX0);
	Hexdisplay HD2 (in[7:4], HEX1);
	Hexdisplay HD3 (in[11:8], HEX2);
	Hexdisplay HD4 (in[15:12], HEX3);
endmodule
