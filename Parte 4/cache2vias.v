module cache2vias(input[4:0] addr,
                  input clock,
				      input wren,
                  input [11:0] data_in,
                  output hit,
                  output miss,
                  output [7:0] data_out);
						
						wire [11:0] data_out1, data_out2;
						
  via via1(addr[3:0], clock, data_in, (wren &&  data_out1[10]), data_out1);
  via via2(addr[3:0], clock, data_in, (wren && ~data_out1[10]), data_out2);

  assign hit =   (data_out1[11] && ((data_out1[9:8] == addr[4:3]) || (data_out2[9:8] == addr[4:3])));
  assign miss = ~(data_out1[11] && ((data_out1[9:8] == addr[4:3]) || (data_out2[9:8] == addr[4:3])));
  
endmodule
