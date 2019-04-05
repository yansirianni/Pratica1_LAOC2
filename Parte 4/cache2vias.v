module cache2vias(input[4:0] addr,
                  input clock,
				          input wren,
                  input [12:0] data_in,
                  output hit,
                  output miss,
                  output [12:0] data_out);

  via via1(cache_index, clock, data_in, wren, data_out1);

  assign hit =   (data_in[12:8] == addr);
  assign miss = ~(data_in[12:8] == addr);

endmodule
