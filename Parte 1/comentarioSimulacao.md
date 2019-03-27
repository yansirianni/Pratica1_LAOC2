# Relação dos displays de 7 segmentos:
* HEX7 e HEX6 são os displays que mostram o dado que está sendo lido da RAM (em hexadecimal).
* HEX5 e HEX4 são os displays que mostram o dado que será escrito na RAM (em hexadecimal).
* HEX1 e HEX0 são os displays que mostram o endereço da RAM que será lido ou escrito (em hexadecimal).

# Do instante 0ps até o 200ps:
SW = 8'b0 5'b0 5'b0
Nada foi escrito e somente foi lido do endereço 0 da RAM. Nesse momento todos os displays estão marcando 0.

# Do instante 200ps até o 400ps:
SW = 8'b00001000 5'b00100 5'b0
Como o writeEnable está habilitado, será escrito o numero 8 no endereço 0 da RAM.
#### Nesse momento é mostrado:
* 08 nos displays HEX7 e HEX6.
* 08 nos displays HEX5 e HEX4.
* 00 nos displays HEX1 e HEX0.
 
# Do instante 400ps até o 600ps:
SW = 8'b00001100 5'b00100 5'b00001
Como o writeEnable está habilitado, será escrito o numero 12 no endereço 1 da RAM.
#### Nesse momento é mostrado:
* 0C nos displays HEX7 e HEX6.
* 0C nos displays HEX5 e HEX4.
* 01 nos displays HEX1 e HEX0.
