# Relação dos displays de 7 segmentos:
* HEX7 e HEX6 são os displays que mostram o dado que está sendo lido da RAM (em hexadecimal).
* HEX5 e HEX4 são os displays que mostram o dado que será escrito na RAM (em hexadecimal).
* HEX1 e HEX0 são os displays que mostram o endereço da RAM que será lido ou escrito (em hexadecimal).

Foi utilizado nessa prática um arquivo .mif de inicialização da memória RAM.

# Do instante 0ps até o 200ps:
SW = 8'b0 5'b0 5'b0

Como o writeEnable NÂO está habilitado, será mostrado o numero 1 no endereço 0 da RAM, pois já foi declarado no arquivo de inicialização da memória.
### Nesse momento é mostrado:
* 01 nos displays HEX7 e HEX6.
* 00 nos displays HEX5 e HEX4.
* 00 nos displays HEX1 e HEX0.

# Do instante 200ps até o 400ps:
SW = 8'b0 5'b0 5'b01

Como o writeEnable NÂO está habilitado, será mostrado o numero 2 no endereço 1 da RAM, pois já foi declarado no arquivo de inicialização da memória.
#### Nesse momento é mostrado:
* 02 nos displays HEX7 e HEX6.
* 00 nos displays HEX5 e HEX4.
* 01 nos displays HEX1 e HEX0.
 
# Do instante 400ps até o 600ps:
SW = 8'b0 5'b0 5'b000010

Como o writeEnable NÂO está habilitado, será mostrado o numero 3 no endereço 2 da RAM, pois já foi declarado no arquivo de inicialização da memória.
#### Nesse momento é mostrado:
* 03 nos displays HEX7 e HEX6.
* 00 nos displays HEX5 e HEX4.
* 10 nos displays HEX1 e HEX0.

# Do instante 600ps até o 800ps:
SW = 8'b0 5'b0 5'b000011

Como o writeEnable NÂO está habilitado, será mostrado o numero 4 no endereço 3 da RAM, pois já foi declarado no arquivo de inicialização da memória.
#### Nesse momento é mostrado:
* 04 nos displays HEX7 e HEX6.
* 00 nos displays HEX5 e HEX4.
* 11 nos displays HEX1 e HEX0.
