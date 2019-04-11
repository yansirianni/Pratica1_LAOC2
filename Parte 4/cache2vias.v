module mux2_1_12bits (A, B, Control, DataOut);

	input [11:0] A, B;
	input Control;
	output reg [11:0] DataOut;

	always @(A, B, Control)
	begin
	  case (Control)
		  1'b0: DataOut <= A;
		  1'b1: DataOut <= B;
	  endcase
	end
endmodule

module cache2vias(input[4:0] addr,
                  input clock,
				      input wren,
                  input [7:0] data_in,
                  output hit,
                  output miss,
                  output [7:0] data_out);
						
						wire lru_via1, lru_via2;
						wire [11:0] data_out_via1, data_out_via2, d_out_mux1, d_out_mux2;
						
						reg [11:00] reg_data_out_via1, reg_data_out_via2;

	//seleciona o dado de entrada para escrita na cache. Dado / Mod LRU  - VIA 1
  mux2_1_12bits d_write_mux1({data_out_via1[11],~data_out_via1[10],data_out_via1[9:0]}, {1'b1,data_out_via2[10],addr[4:3],data_in}, (wren || miss) && data_out_via1[10], d_out_mux1);
  //seleciona o dado de entrada para escrita na cache. Dado / Mod LRU - VIA 2
  mux2_1_12bits d_write_mux2({data_out_via2[11],~data_out_via2[10],data_out_via2[9:0]}, {1'b1,data_out_via1[10],addr[4:3],data_in}, (wren || miss) && ~data_out_via1[10], d_out_mux2);
  
/*
	input	[11:0]  data;
	input	[2:0]  rdaddress;
	input	  rdclock;
	input	[2:0]  wraddress;
	input	  wrclock;
	input	  wren;
	output	[11:0]  q;
*/
	
	cache_test via1(d_out_mux1, addr[2:0], clock, addr[2:0], ~clock, (wren || miss), data_out_via1);
	cache_test via2(d_out_mux2, addr[2:0], clock, addr[2:0], ~clock, (wren || miss), data_out_via2);
  //via via1(addr[2:0], clock, d_out_mux1, ((wren || miss) && (~clock)), data_out_via1);
  //via via2(addr[2:0], clock, d_out_mux2, ((wren || miss) && (~clock)), data_out_via2);
  
  assign lru_via1 = data_out_via1[10];
  assign lru_via2 = data_out_via2[10];
  
  
  assign hit =   ((data_out_via1[11] || data_out_via2[11]) && ((data_out_via1[9:8] == addr[4:3]) || (data_out_via2[9:8] == addr[4:3]))); //verifica se deu hit
  assign miss = ~hit; //verifica se deu miss
  
  //assign miss = ~(data_out_via1[11] && ((data_out_via1[9:8] == addr[4:3]) || (data_out_via2[9:8] == addr[4:3]))); //verifica se deu miss
  
  //assign data_write1 = ((({1'b1,~data_out_via1[10],addr[4:3],data_in}) && (wren && data_out_via1[10])) || (({data_out_via1[11], ~data_out_via1[10], data_out_via1[9:0]}) && ~(wren &&  data_out_via1[10])));
  //assign data_write2 = (({1'b1,data_out_via1[10],addr[4:3],data_in} && (wren &&  ~data_out_via1[10])) || ({data_out_via2[11], ~data_out_via2[10], data_out_via2[9:0]} && ~(wren &&  ~data_out_via1[10])));

endmodule
