library ieee;
use ieee.std_logic_1164.all;

entity soma is
port
	(
		A, B : in std_logic_vector(3 downto 0);
		S : out std_logic_vector(3 downto 0);
		Co  : out std_logic
	);
end soma;

architecture archSoma of soma is

component somador is
	port
		(
			Ci, A, B : in std_logic;
			Co, S    : out std_logic
		);
end component;

signal carry : std_logic_vector(3 downto 0);
signal  S_resultado    : std_logic_vector(3 downto 0);

begin
	S0 : somador port map('0', A(0), B(0), carry(0), S(0));
	S1 : somador port map(carry(0), A(1), B(1), carry(1), S(1));
	S2 : somador port map(carry(1), A(2), B(2), carry(2), S(2));
	S3 : somador port map(carry(2), A(3), B(3), carry(3), S(3));
	Co <= carry(3);
end archSoma;