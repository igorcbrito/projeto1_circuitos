library ieee;
use ieee.std_logic_1164.all;

entity menorque is -- Realiza o teste para saber se A é maior que B
	port(
			A, B  : in std_logic_vector(3 downto 0); -- A e B são entradas do multiplexador, as quais serão testadas
			y		: out std_logic						  -- É a saída contendo o resultado do teste, se A for menor que B y será 1, caso contrário o retorno será 0
		);
end menorque;
 
architecture archMenorque of menorque is
begin
-- Realização do teste bit a bit --
    y <= (B(3) and not(A(3))) or 
			((B(3) xnor A(3)) and (B(2) and not A(2))) or
			((B(3) xnor A(3)) and (B(2) xnor A(2)) and (B(1) and not(A(1)))) or
			((B(3) xnor A(3)) and (B(2) xnor A(2)) and (B(1) xnor A(1)) and (B(0) and not(A(0))));
					
end archMenorque;
	