module mapRam2Cache (reset, clock, SW, data_out);
	input [17:0]SW;
	input clock;
	input reset;
	output reg[7:0]data_out;
	reg [12:0] cache [2:0][1:0];

	// 1'b  1'b  1'b  2'b  8'b
	// V	 D	 LRU  Tag  Data
	
	wire [7:0] ram_out;
	
	reg [4:0]address_miss_read;
	
	//module ramlpm (input	[4:0] address,input clock,input	[7:0] data,input wren,output [7:0]q);
	ramlpm ram(address_miss_read[4:0], CLOCK_50, SW[17:10], SW[7], ram_out);
	// 00000000 00 0 00 00000dfadf

	always @(posedge reset, posedge clock) begin
	
	if (reset == 1'b1) 
	begin
		cache[0][0] = 13'b0; // no bloco 0 a via 0 recebe 13'b0
		cache[0][1] = 13'b0; // no bloco 0 a via 1 recebe 13'b0
		cache[1][0] = 13'b0; // no bloco 1 a via 0 recebe 13'b0
		cache[1][1] = 13'b0; // no bloco 1 a via 1 recebe 13'b0
		cache[2][0] = 13'b0;
		cache[2][1] = 13'b0;
		cache[3][0] = 13'b0;
		cache[3][1] = 13'b0;
		cache[4][0] = 13'b0;
		cache[4][1] = 13'b0;
		cache[5][0] = 13'b0;
		cache[5][1] = 13'b0;
		cache[6][0] = 13'b0;
		cache[6][1] = 13'b0;
		cache[7][0] = 13'b0;
		cache[7][1] = 13'b0; 
	end

	if ( cache[{SW[2:0]}][0][12] == 1) begin //verifica se bit de validade esta ativo

		if ( cache[{SW[2:0]}][0][9:8] == SW[4:3]) begin //verifica no index SW[2:0] na via 0, na parte da tag (9:8) se eh igual a tag do address
			data_out = cache[{SW[2:0]}][0][7:0];
		end
	end

	if ( cache[{SW[2:0]}][1][12] == 1) begin //verifica se bit de validade esta ativo

		if ( cache[{SW[2:0]}][1][9:8] == SW[4:3]) begin //verifica no index SW[2:0] na via 1, na parte da tag (9:8) se eh igual a tag do address
			data_out = cache[{SW[2:0]}][0][7:0];
		end
		else begin
	  		// MISS
		end
	end
	else begin
	  // MISS
	end  
	

	cache[{SW[2:0]}][0][10]= 1'b0;
	cache[{SW[2:0]}][1][10] = 1'b1;
	end
	
	

	
	
endmodule