module Parte_3 (HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, SW, CLOCK_50, reset);
	input [17:0]SW;
	input CLOCK_50, reset;
	output [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

	wire [7:0] mem_data_read;
	
	//module mapRam2Cache (reset, clock, SW, data_out);
	mapRam2Cache map(reset, CLOCK_50, SW, cache_data_read);
	
	//module decoder (input [3:0]entrada, output reg[6:0]saida);
	
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	
	decoder dec0(SW[3:0], HEX0);
	decoder dec1({3'b0,SW[4]}, HEX1);
		
	decoder dec2(SW[13:10], HEX4);
	decoder dec3(SW[17:14], HEX5);
	
	decoder dec4(cache_data_read[3:0], HEX6);
	decoder dec5(cache_data_read[7:4], HEX7);
	
	
	
endmodule