library ieee;
use ieee.std_logic_1164.all;

entity maiorque is -- Realiza o teste para saber se A é maior que B
	port(
			A, B	: in std_logic_vector(3 downto 0);	-- A e B são entradas do multiplexador, as quais serão testadas
			y		: out std_logic							-- É a saída contendo o resultado do teste, se A for maior que B y será 1, caso contrário o retorno será 0
		);
end maiorque;
 
architecture archMaiorque of maiorque is
begin
-- Realização do teste bit a bit --
    y <= (A(3) and not(B(3))) or 
			((A(3) xnor B(3)) and (A(2) and not (B(2)))) or
			((A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) and not (B(1)))) or 
			((A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1) xnor B(1)) and (A(0) and not (B(0))));
					
end archMaiorque;