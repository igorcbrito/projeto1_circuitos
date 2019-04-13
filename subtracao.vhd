library ieee;
use ieee.std_logic_1164.all;

entity subtracao is
port
	(
		x0, x1 : in std_logic_vector(3 downto 0);
		Y : out std_logic_vector(3 downto 0)
	);
end subtracao;

architecture archSubtracao of subtracao is

component soma is
	port
	(
		A, B : in std_logic_vector(3 downto 0);
		S : out std_logic_vector(3 downto 0);
		Co  : out std_logic
	);
end component;

component inversor is
	port
	(
		A      : in std_logic_vector(3 downto 0);
		y		: out std_logic_vector(3 downto 0)
	);
end component;

component menorque is
port(
  A      : in std_logic_vector(3 downto 0);
  B		: in std_logic_vector(3 downto 0);
  y		: out std_logic
  );
end component;

signal yInvertido : std_logic_vector(3 downto 0);
signal ySoma : std_logic_vector(3 downto 0);
signal yMenor: std_logic_vector(3 downto 0);

begin
invertido : inversor port map(x1, yInvertido);
Soma1 : soma port map(x0, yInvertido, ySoma);
soma2 : soma port map(ysoma, "0001", Y);

end archSubtracao;