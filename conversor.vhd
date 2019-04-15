library ieee;
use ieee.std_logic_1164.all;

entity conversor is		-- Realiza a conversão do resultado de 4 bits para o displays de 7 segmentos
	port(
			I     : in std_logic_vector(3 downto 0); 		-- Entrada de 4 bits, mesma saída do multiplexador
			Y		: out std_logic_vector(6 downto 0);		-- Saída convertida de 4 bits para 7 bits
			ctrl	: in std_logic_vector(1 downto 0)		-- Seletor de controle para casos específicos (erro e desligado)
		);
end conversor;
 
architecture archConversor of conversor is

signal Yconversor : std_logic_vector(6 downto 0);

begin
 
  WITH I SELECT
    Yconversor <= not("1111110") WHEN "0000", -- Recebe todos os valores possíveis de 4 bits da saída do multiplexador e converte para o display de 7 segmentos negado por causa de uma particularidade da placa utilizada
                  not("0110000") WHEN "0001",
                  not("1101101") WHEN "0010",
                  not("1111001") WHEN "0011",
                  not("0110011") WHEN "0100",
                  not("1011011") WHEN "0101",
                  not("1011111") WHEN "0110",
                  not("1110000") WHEN "0111",
                  not("1111111") WHEN "1000",
                  not("1111011") WHEN "1001",
					   not("1110111") WHEN "1010",
					   not("0011111") WHEN "1011",
					   not("1001110") WHEN "1100",
					   not("0111101") WHEN "1101",
					   not("1001111") WHEN "1110",
					   not("1000111") WHEN "1111",
					   not("0000000") WHEN OTHERS;
			
	WITH ctrl SELECT -- Recebe os valores do seletor de controle
		Y <=  Yconversor 		 WHEN "00", 	-- Quando o seletor de controle receber 00, nada será alterado e será exibido a saída do multiplexador
				not("1101111")	 WHEN "01", 	-- Quando o seletor de controle receber 01, será exibido um erro no display
				not("0000000")	 WHEN "10", 	-- Quando o seletor de controle receber 10, ou seja, botão de desligar ativido, nada será exibido no display
				not("0000000")	 WHEN OTHERS;	-- Para outras combinações, nada será exibido no display
				
end archConversor;