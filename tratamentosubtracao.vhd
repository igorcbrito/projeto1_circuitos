library ieee;
use ieee.std_logic_1164.all;

entity tratamentoSubtracao is -- Faz a preparação para a subtração, avalia se a subtração é possível
	port(
			x0, x1 	: in std_logic_vector(3 downto 0);
			y 			: out std_logic_vector(3 downto 0);
			c 			: out std_logic
		);
end tratamentoSubtracao;

architecture archTratamentoSubtracao of tratamentoSubtracao is

component menorque is
	port(
			A, B    	: in std_logic_vector(3 downto 0);
			y			: out std_logic
		);
end component;

component subtracao is
	port(
			x0, x1 	: in std_logic_vector(3 downto 0);
			Y 			: out std_logic_vector(3 downto 0)
		);
end component;

signal yMenor				: std_logic;							
signal ySubtracao, aux  : std_logic_vector(3 downto 0);

begin
-- Cálculo das operações --
	menor : menorque port map(x0, x1, yMenor);		-- Testa se A é menor que B
	subt 	: subtracao port map(x0, x1, ySubtracao);	-- Realiza a subtração
	
	aux(0) <= yMenor; -- Atribui o resultado do teste "menor que" entre A e B em uma variável auxiliar de 4 bits
	aux(1) <= yMenor;	
	aux(2) <= yMenor;
	aux(3) <= yMenor;
	
	y <= not(aux) and ySubtracao; -- Se A for menor que B a função de teste retorna 1 que passa pelo inversor se tornando 0, logo y será 0. Caso o teste resulte em 0, o valor de y será o próprio da subtração
	c <= yMenor; 						-- c recebe o resultado do teste de "menor que" que contribuirá para apresentar o erro no display
	
end archTratamentoSubtracao;