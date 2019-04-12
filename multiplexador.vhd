library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
	port(
			x0,x1		: in std_logic_vector(3 downto 0);
			S			: in std_logic_vector(3 downto 0);
			ctrl		: in std_logic_vector(2 downto 0);
			y			: out std_logic_vector(3 downto 0)
		);
end multiplexador;

architecture seletor of multiplexador is

component soma is
	port(
		A, B : in std_logic_vector(3 downto 0);
		S : out std_logic_vector(3 downto 0);
		Co  : out std_logic
	);
end component;

component inversor is
		port(
			A     : in std_logic_vector(3 downto 0);
			y		: out std_logic_vector(3 downto 0)
		);
end component;

component maiorque is
	port(
			A     : in std_logic_vector(3 downto 0);
			B		: in std_logic_vector(3 downto 0);
			y		: out std_logic
		);
end component;

component menorque is
		port(
				A      : in std_logic_vector(3 downto 0);
				B		: in std_logic_vector(3 downto 0);
				y		: out std_logic
			);
end component;

component conversor is
		port(
				I		: in std_logic_vector(3 downto 0);
				Y		: out std_logic_vector(6 downto 0))
		);
end component;

signal ySoma, yMaior, yMenor, yInvertido, yResultado : std_logic_vector(3 downto 0);

begin
total : soma port map(x0, x1, ySoma);
maior : maiorque port map(x0, x1, yMaior(0));
menor : menorque port map(x0, x1, yMenor(0));
invertido : inversor port map(x1, yInvertido);

	WITH S SELECT
		y <=  ySoma      WHEN "001",
				yMaior     WHEN "011", 
				yMenor     WHEN "100",
				yInvertido WHEN "101",
				"0000"     WHEN OTHERS;
				
	WITH ctrl SELECT
		y <=  yResultado   WHEN "00"
				Erro 			 WHEN "01"
				desligado	 WHEN "10"
		
end seletor;