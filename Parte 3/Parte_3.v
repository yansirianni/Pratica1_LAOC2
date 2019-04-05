module Parte_3 (HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, SW, KEY, reset, LEDR, LEDG);
	input [17:0]SW;
	input [3:0]KEY, reset;
	output [17:0]LEDR;
	output [8:0] LEDG;
	output [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	wire [7:0] mem_data_read;
	wire whatVia;
	
	//module mapRam2Cache (reset, clock, SW, data_out);
	mapRam2Cache map(reset, KEY[2], SW, mem_data_read, LEDR, LEDG, whatVia);
	
	assign HEX2 = 7'b1111111;
	
	decoder dec0(SW[3:0], HEX0);
	decoder dec1({3'b0,SW[4]}, HEX1);
	
	decoder dec6({3'b0,whatVia}, HEX3);
		
	decoder dec2(SW[13:10], HEX4);
	decoder dec3(SW[17:14], HEX5);
	
	decoder dec4(mem_data_read[3:0], HEX6);
	decoder dec5(mem_data_read[7:4], HEX7);
	
endmodule