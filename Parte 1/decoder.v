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
