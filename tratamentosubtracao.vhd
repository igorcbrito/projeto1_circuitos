library ieee;
use ieee.std_logic_1164.all;

entity tratamentoSubtracao is
port
	(
		x0, x1 : in std_logic_vector(3 downto 0);
		y : out std_logic_vector(3 downto 0);
		c : out std_logic
	);
end tratamentoSubtracao;

architecture archTratamentoSubtracao of tratamentoSubtracao is

component menorque is
port(
  A      : in std_logic_vector(3 downto 0);
  B		: in std_logic_vector(3 downto 0);
  y		: out std_logic
  );
end component;

component subtracao is
port
	(
		x0, x1 : in std_logic_vector(3 downto 0);
		Y : out std_logic_vector(3 downto 0)
	);
end component;

signal yMenor  : std_logic;
signal ySubtracao, aux : std_logic_vector(3 downto 0);

begin
	menor : menorque port map(x0, x1, yMenor);
	subt : subtracao port map(x0, x1, ySubtracao);
	aux(0) <= yMenor;
	aux(1) <= yMenor;
	aux(2) <= yMenor;
	aux(3) <= yMenor;
	
	y <= not(aux) and ySubtracao;
	c <= yMenor;
end archTratamentoSubtracao;