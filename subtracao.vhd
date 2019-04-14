library ieee;
use ieee.std_logic_1164.all;

entity subtracao is
	port(
		x0, x1 		: in std_logic_vector(3 downto 0); -- Entradas da subtração
		Y 				: out std_logic_vector(3 downto 0) -- Saída da subtração
		);
end subtracao;

architecture archSubtracao of subtracao is

component soma is												  -- A subtração é realizada a partir do componente soma
	port(
			A, B		: in std_logic_vector(3 downto 0);
			S   		: out std_logic_vector(3 downto 0);
			Co  		: out std_logic
		);
end component;

component inversor is										  -- A subtração é realizada também a partir do componente inversor
	port(
			A      	: in std_logic_vector(3 downto 0);
			y		 	: out std_logic_vector(3 downto 0)
		);
end component;

component menorque is										  -- Para fazer a subtração é necessária a análise de menor que
	port(
			A, B 		: in std_logic_vector(3 downto 0);
			y			: out std_logic
		);
end component;

signal yInvertido : std_logic_vector(3 downto 0);
signal ySoma 		: std_logic_vector(3 downto 0);
signal yMenor		: std_logic_vector(3 downto 0);

begin
invertido			: inversor port map(x1, yInvertido);	 -- Inversão do segundo argumento da subtração
Soma1 				: soma port map(x0, yInvertido, ySoma); -- É feita a soma do primeiro elemento com o segundo invertido
soma2 				: soma port map(ysoma, "0001", Y);		 -- Com o resultado da soma anterior é somado mais 1 unidade e o carry final é deixado de lado

end archSubtracao;