library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
port (
	x0,x1,x2,x3,s1,s0: in std_logic;
	y: out std_logic
);
end multiplexador;

architecture seletor of multiplexador is
begin

		y <= (x0 and (not(s1)and not(s0))) or (x1 and (not(s1) and s0)) or (x2 and (s1 and not(s0))) or (x3 and (s1 and s0));
		
end seletor;