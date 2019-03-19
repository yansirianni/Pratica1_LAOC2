module Parte_1 (HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, SW, CLOCK_50);
	input [17:0]SW;
	input CLOCK_50;
	output [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	wire [7:0]q;
	
	//module decoder (input [3:0]entrada, output reg[6:0]saida);
	decoder dec0(SW[3:0], HEX0);
	decoder dec1({3'b0,SW[4]}, HEX1);
	
	decoder dec2(SW[13:10], HEX4);
	decoder dec3(SW[17:14], HEX5);
	
	decoder dec4(q[3:0], HEX6);
	decoder dec5(q[7:4], HEX7);
	
	
	//module ramlpm (input	[4:0] address,input clock,input	[7:0] data,input wren,output [7:0]q);
	ramlpm ram(SW[4:0], CLOCK_50, SW[17:10], SW[7], q);
endmodule