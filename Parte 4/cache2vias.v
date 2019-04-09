module cache2vias(input[4:0] addr,
                  input clock,
				      input wren,
                  input [7:0] data_in,
                  output hit,
                  output miss,
                  output [7:0] data_out);
						
						wire [11:0] data_write1, data_write2, data_out1, data_out2;

						
  via via1(addr[3:0], clock, data_write1, (wren &&  data_out1[10]), data_out1);
  via via2(addr[3:0], clock, data_write2, (wren && ~data_out1[10]), data_out2);

  assign hit =   (data_out1[11] && ((data_out1[9:8] == addr[4:3]) || (data_out2[9:8] == addr[4:3])));
  assign miss = ~(data_out1[11] && ((data_out1[9:8] == addr[4:3]) || (data_out2[9:8] == addr[4:3])));
  
  assign data_write1 = (({1'b1,~data_out1[10],addr[4:3],data_in} && (wren && data_out1[10])) || ({data_out1[11], ~data_out1[10], data_out1[9:0]} && ~(wren &&  data_out1[10])	)	);
  assign data_write2 = (({1'b1,data_out1[10],addr[4:3],data_in} && (wren &&  ~data_out1[10])) || ({data_out1[11], ~data_out1[10], data_out1[9:0]} && ~(wren &&  ~data_out1[10])));
  
endmodule
