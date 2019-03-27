module topLevel (Leitura1, Leitura0, Dado_escrita1, Dado_escrita0, Endereco_ram1, Endereco_ram0, Endereco, CLOCK);
	input [17:0]Endereco;
	input CLOCK;
	output [6:0] Leitura1, Leitura0, Dado_escrita1, Dado_escrita0, Endereco_ram1, Endereco_ram0;	
	
	Parte_1 main(Leitura1, Leitura0, Dado_escrita1, Dado_escrita0, Endereco_ram1, Endereco_ram0, Endereco, CLOCK);
	
endmodule