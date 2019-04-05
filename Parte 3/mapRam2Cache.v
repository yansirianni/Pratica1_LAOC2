module mapRam2Cache (reset, clock, SW, data_out);
	input reset;
	input clock;
	input [17:0]SW;
	output reg[7:0]data_out;
	
	wire [11:0] cache_via1_out_wire, cache_via2_out_wire;
	reg [11:0] cache_via1_out, cache_via2_out;

	wire [7:0] ram_data_read;
	
	reg cache_wren;
	reg ram_wren;

	//module cache (input[2:0] address, input clock, input{12:0] data, input wren, input [11:0] q);
	cache via1(SW[2:0], clock, SW[17:10], SW[7] && cache_wren, cache_via1_out_wire);
	cache via2(SW[2:0], clock, SW[17:10], SW[7] && ~cache_wren, cache_via2_out_wire);

	ramlpm ram (SW[4:0], clock, SW[17:10], SW[7] && ram_wren, ram_data_read);

	always @(reset) begin
		integer i;
		if (reset == 1'b1) begin
			for (i=0; i < 8; i=i+1) begin
            	via1[i] <= 11'b0; //reset cache
				via2[i] <= 12'b0; //reset cache
			end
		end
	end

	always @(posedge clock) begin
		cache_via1_out = cache_via1_out_wire;
		cache_via2_out = cache_via2_out_wire;
		
		if (reset == 1'b1) begin
			cache_wren = 1'b0;
		end
		
		if (SW[7] == 1'b1) begin
			ram_wren = 1'b1;
			if (cache_via1_out[10] == 1'b1) begin
				cache_wren = 1'b1;
				cache_via1_out[10] = 1'b0;
				cache_via2_out[10] = 1'b1;
			end
			else begin
				cache_wren = 1'b0;
				cache_via1_out[10] = 1'b1;
				cache_via1_out[10] = 1'b0;
			end
		end

		if (cache_via1_out_wire[11] == 1) begin // checa se o bit de validade da via eh 1
			if (cache_via1_out_wire[9:8] == SW[4:3]) begin //confere se a tag gravada na via eh igual a tag do endereco solicitado
				//hit
				cache_via1_out[10] = 1'b0;
				cache_via2_out[10] = 1'b1;
				data_out = cache_via1_out_wire[7:0];
			end
			else begin
				//miss
				if (cache_via1_out[10] == 1'b1) begin
					cache_via1_out[11] = 1'b1;
					cache_via1_out[10]  = 1'b0;
					cache_via1_out[9:8] = SW[4:3];
					cache_via1_out[7:0] = ram_data_read;

					cache_via2_out[10]  = 1'b1;
				end
				else begin
					cache_via2_out[11] = 1'b1;
					cache_via2_out[10]  = 1'b0;
					cache_via2_out[9:8] = SW[4:3];
					cache_via2_out[7:0] = ram_data_read;

					cache_via1_out[10] = 1'b1;
				end
			end
		end

		if (cache_via2_out_wire[11] == 1'b1) begin // checa se o bit de validade da via eh 1
			if (cache_via2_out_wire[9:8] == SW[4:3]) begin //confere se a tag gravada na via eh igual a tag do endereco solicitado
				//hit
				cache_via1_out[10] = 1'b1;
				cache_via2_out[10] = 1'b0;
				data_out = cache_via2_out_wire[7:0];
			end
			else begin
				//miss
				if (cache_via1_out[10] == 1'b1) begin
					cache_via1_out[11] = 1'b1;
					cache_via1_out[10]  = 1'b0;
					cache_via1_out[9:8] = SW[4:3];
					cache_via1_out[7:0] = ram_data_read;

					cache_via2_out[10]  = 1'b1;
				end
				else begin
					cache_via2_out[11] = 1'b1;
					cache_via2_out[10]  = 1'b0;
					cache_via2_out[9:8] = SW[4:3];
					cache_via2_out[7:0] = ram_data_read;

					cache_via1_out[10] = 1'b1;
				end
			end
		end

		else begin
			//miss
			if (cache_via1_out[10] == 1'b1) begin
				cache_via1_out[11] = 1'b1;
				cache_via1_out[10]  = 1'b0;
				cache_via1_out[9:8] = SW[4:3];
				cache_via1_out[7:0] = ram_data_read;

				cache_via2_out[10]  = 1'b1;
			end
			else begin
				cache_via2_out[11] = 1'b1;
				cache_via2_out[10]  = 1'b0;
				cache_via2_out[9:8] = SW[4:3];
				cache_via2_out[7:0] = ram_data_read;

				cache_via1_out[10] = 1'b1;
			end
		end
	end
endmodule