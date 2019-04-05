module decoder (input [3:0]entrada, output reg[6:0]saida);
	always@(*)
	case(entrada)
	4'b0 : saida = 7'b1000000;
	4'd1 : saida = 7'b1111001;
	4'd2 : saida = 7'b0100100;
	4'd3 : saida = 7'b0110000;
	4'd4 : saida = 7'b0011001;
	4'd5 : saida = 7'b0010010;
	4'd6 : saida = 7'b0000010;
	4'd7 : saida = 7'b1111000;
	4'd8 : saida = 7'b0000000;
	4'd9 : saida = 7'b0010000;
	4'd10 : saida = 7'b0001000;
	4'd11 : saida = 7'b0000011;
	4'd12 : saida = 7'b1000110;
	4'd13 : saida = 7'b0100001;
	4'd14 : saida = 7'b0000110;
	4'd15 : saida = 7'b0001110;
	endcase
endmodule

module Parte3(input[17:0] SW,
              input[3:0] Key,
              output[17:0] LEDR,
              output[8:0] LEDG,
              output[12:0] Data_out,
              output [6:0] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

	cache2vias cache(SW[4:0], Key[2], SW[7], SW[17:5], LEDG[0], LEDR[17], Data_out);

  assign HEX2 = 7'b1111111;
  assign HEX3 = 7'b1111111;
  assign HEX4 = 7'b1111111;
  assign HEX5 = 7'b1111111;

  decoder H0(SW[3:0], HEX0);
  decoder H1({3'b0,SW[4]}, HEX1);
  // decoder H4();
  // decoder H5();
  decoder H6(Data_out[3:0], HEX6);
  decoder H7(Data_out[7:4], HEX7);

endmodule
