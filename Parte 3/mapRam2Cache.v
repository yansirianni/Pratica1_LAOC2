module mapRam2Cache (SW, clock, cache);
	input [17:0]SW;
	input clock;
	output [7:0] cache [31:0];
	
	wire [7:0] ram_out;
	
	//module ramlpm (input	[4:0] address,input clock,input	[7:0] data,input wren,output [7:0]q);
	ramlpm ram(SW[4:0], CLOCK_50, SW[17:10], SW[7], ram_out);
	// 00000000 00 0 00 00000dfadf
	
	

	
	
endmodule