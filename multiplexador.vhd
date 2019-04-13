library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
	port(
			x0,x1		: in std_logic_vector(3 downto 0);
			S			: in std_logic_vector(2 downto 0);
			ctrl		: in std_logic_vector(1 downto 0);
			y			: out std_logic_vector(6 downto 0);
			desliga   : in std_logic
		);
end multiplexador;

architecture seletor of multiplexador is

component tratamentoSubtracao is
port
	(
		x0, x1 : in std_logic_vector(3 downto 0);
		y : out std_logic_vector(3 downto 0);
		c : out std_logic
	);
end component;

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
				Y		: out std_logic_vector(6 downto 0);
				ctrl	 : in std_logic_vector(1 downto 0)
		);
end component;

signal ySubtracao, ySoma, yMaior, yMenor, yInvertido : std_logic_vector(3 downto 0);
signal yResultado: std_logic_vector(3 downto 0);
signal controle : std_logic_vector(1 downto 0);
signal carry : std_logic;

begin
diferenca	: tratamentoSubtracao port map(x0,x1, ySubtracao, carry);
total 		: soma port map(x0, x1, ySoma);
maior 		: maiorque port map(x0, x1, yMaior(0));
menor 		: menorque port map(x0, x1, yMenor(0));
invertido	: inversor port map(x1, yInvertido);
converte 	: conversor port map(yResultado, y, controle);

	WITH S SELECT
		yResultado <=  ySubtracao WHEN "000",
							ySoma      WHEN "001",
							yMaior     WHEN "010", 
							yMenor     WHEN "011",
							yInvertido WHEN "100",
							"0000"     WHEN OTHERS;
							
	controle(0) <= carry and not(desliga); -- substituir 0 por erro da subtração
	controle(1) <= desliga;
				
		
end seletor;