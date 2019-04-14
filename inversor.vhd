library ieee;
use ieee.std_logic_1164.all;

entity inversor is -- Realiza a inversão de uma entrada do multiplexador
	port(
			A  : in std_logic_vector(3 downto 0); -- Entrada do multiplexador que terá o valor invertido
			y	: out std_logic_vector(3 downto 0) -- Saída contendo o valor invertido
		);
end inversor;
 
architecture archInversor of inversor is
begin
-- Operação de inversão -- 
    WITH A SELECT
    y <= 	not("0000") WHEN "0000", -- Para todas as combinações da entrada A, o valor é negado, ou seja, invertido. Depois é atribuído a saída y.
            not("0001") WHEN "0001",
            not("0010") WHEN "0010",
            not("0011") WHEN "0011",
            not("0100") WHEN "0100",
            not("0101") WHEN "0101",
            not("0110") WHEN "0110",
            not("0111") WHEN "0111",
            not("1000") WHEN "1000",
            not("1001") WHEN "1001",
				not("1010") WHEN "1010",
				not("1011") WHEN "1011",
				not("1100") WHEN "1100",
				not("1101") WHEN "1101",
				not("1110") WHEN "1110",
				not("1111") WHEN "1111",
				not("0000") WHEN OTHERS;
end archInversor;