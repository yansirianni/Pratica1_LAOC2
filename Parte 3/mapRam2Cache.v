module mapRam2Cache (reset, clock, SW, data_out, LEDR, LEDG, whatVia);
	input reset;
	input clock;
	input [17:0]SW;
	output reg [17:0]LEDR;
	output reg [8:0] LEDG;
	output reg[7:0]data_out;
	output reg whatVia;

	
	wire [11:0] cache_via1_out_wire, cache_via2_out_wire;
	reg [11:0] cache_via1_out, cache_via2_out;

	wire [7:0] ram_data_read;
	
	reg cache_wren;
	reg ram_wren;

	reg [2:0] reset_address_cache;
	reg [12:0] reset_data_cache;
	reg reset_wren_cache;

	//module cache (input[2:0] address, input clock, input[11:0] data, input wren, input [11:0] q);
	cache via1((SW[2:0] || reset_address_cache), clock, reset_data_cache, (SW[7] && cache_wren) || reset_wren_cache, cache_via1_out_wire);
	cache via2((SW[2:0] || reset_address_cache), clock, reset_data_cache, (SW[7] && ~cache_wren) || reset_wren_cache, cache_via2_out_wire);

	ramlpm ram (SW[4:0], clock, SW[17:10], SW[7] && ram_wren, ram_data_read);

	always @(reset) begin
		
		if (reset == 1'b1) begin
			
			reset_wren_cache = 1'b1;
			reset_data_cache = 12'b0;
			reset_address_cache = 3'b0;

			reset_address_cache = 3'b001;
			reset_address_cache = 3'b010;
			reset_address_cache = 3'b011;
			reset_address_cache = 3'b100;
			reset_address_cache = 3'b101;
			reset_address_cache = 3'b110;
			reset_address_cache = 3'b111;
		end
	end

	always @(posedge clock) begin
		cache_via1_out = cache_via1_out_wire;
		cache_via2_out = cache_via2_out_wire;
		
		if (reset == 1'b1) begin
			cache_wren = 1'b0;
		end
		
		//WRITE
		if (SW[7] == 1'b1) begin
			ram_wren = 1'b1;
			if (cache_via1_out[10] == 1'b1) begin
				cache_wren = 1'b1;
				cache_via1_out[10] = 1'b0;
				cache_via2_out[10] = 1'b1;
				whatVia = 1'b0;
			end
			else begin
				cache_wren = 1'b0;
				cache_via1_out[10] = 1'b1;
				cache_via1_out[10] = 1'b0;
				whatVia = 1'b01;
			end
		end

		//READ
		if (cache_via1_out_wire[11] == 1) begin // checa se o bit de validade da via eh 1
			if (cache_via1_out_wire[9:8] == SW[4:3]) begin //confere se a tag gravada na via eh igual a tag do endereco solicitado
				//hit
				cache_via1_out[10] = 1'b0;
				cache_via2_out[10] = 1'b1;
				data_out = cache_via1_out[7:0];
				LEDG[8] = 1'b1;
				whatVia = 1'b0;
			end
			else begin
				//miss
				LEDG[8] = 1'b0;
				if (cache_via1_out[10] == 1'b1) begin
					cache_via1_out[11] = 1'b1;
					cache_via1_out[10]  = 1'b0;
					cache_via1_out[9:8] = SW[4:3];
					cache_via1_out[7:0] = ram_data_read;

					cache_via2_out[10]  = 1'b1;
					data_out = cache_via1_out[7:0];
					
					whatVia = 1'b0;
					
					//LEDG[8] = 1'b1;
					//LEDR[11] = 1'b0;
				end
				else begin
					cache_via2_out[11] = 1'b1;
					cache_via2_out[10]  = 1'b0;
					cache_via2_out[9:8] = SW[4:3];
					cache_via2_out[7:0] = ram_data_read;

					cache_via1_out[10] = 1'b1;
					data_out = cache_via2_out[7:0];
					
					whatVia = 1'b1;
					
					//LEDG[8] = 1'b1;
					//LEDR[11] = 1'b0;
				end
			end
		end

		if (cache_via2_out_wire[11] == 1'b1) begin // checa se o bit de validade da via eh 1
			if (cache_via2_out_wire[9:8] == SW[4:3]) begin //confere se a tag gravada na via eh igual a tag do endereco solicitado
				//hit
				cache_via1_out[10] = 1'b1;
				cache_via2_out[10] = 1'b0;
				data_out = cache_via2_out[7:0];
				
				LEDG[8] = 1'b1;
				whatVia = 1'b1;
			end
			else begin
				//miss
				LEDG[8] = 1'b0;
				if (cache_via1_out[10] == 1'b1) begin
					cache_via1_out[11] = 1'b1;
					cache_via1_out[10]  = 1'b0;
					cache_via1_out[9:8] = SW[4:3];
					cache_via1_out[7:0] = ram_data_read;

					cache_via2_out[10]  = 1'b1;
					
					data_out = cache_via1_out[7:0];
					
					whatVia = 1'b0;
					//LEDG[8] = 1'b1;
					//LEDR[11] = 1'b0;
					
				end
				else begin
					cache_via2_out[11] = 1'b1;
					cache_via2_out[10]  = 1'b0;
					cache_via2_out[9:8] = SW[4:3];
					cache_via2_out[7:0] = ram_data_read;

					cache_via1_out[10] = 1'b1;
					data_out = cache_via2_out[7:0];
					
					whatVia = 1'b1;
					
					//LEDG[8] = 1'b1;
					//LEDR[11] = 1'b0;
				end
			end
		end

		else begin
			//miss begin
			
			LEDG[8] = 1'b0;

			if (cache_via1_out[10] == 1'b1) begin
				cache_via1_out[11] = 1'b1;
				cache_via1_out[10]  = 1'b0;
				cache_via1_out[9:8] = SW[4:3];
				cache_via1_out[7:0] = ram_data_read;

				cache_via2_out[10]  = 1'b1;
				data_out = cache_via1_out[7:0];
				
				whatVia = 1'b0;
				//LEDG[8] = 1'b1;
				//LEDR[11] = 1'b0;
			end
			else begin
				cache_via2_out[11] = 1'b1;
				cache_via2_out[10]  = 1'b0;
				cache_via2_out[9:8] = SW[4:3];
				cache_via2_out[7:0] = ram_data_read;

				cache_via1_out[10] = 1'b1;
				
				data_out = cache_via2_out[7:0];
				
				whatVia = 1'b1;
				
				//LEDG[8] = 1'b1;
				//LEDR[11] = 1'b0;
			end
		end
	end
endmodule