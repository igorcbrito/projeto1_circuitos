library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is 										-- Declaração de entradas e saídas do multiplexador
	port(
			x0,x1		: in std_logic_vector(3 downto 0);  -- Entradas de 4 bits que passam valores como parâmetros para as operações
			S			: in std_logic_vector(2 downto 0);  -- Chaves seletoras para as operações
			ctrl		: in std_logic_vector(1 downto 0);  -- Seletor para controle de caso específico
			y			: out std_logic_vector(6 downto 0); -- Saída do multiplexador
			desliga  : in std_logic;							-- Botão que desliga a exibição dos resultados
			CoLed		: out std_logic							-- Saída do Led que indica quando foi usado um Carry na adição ou as operações de "maior que" e "menor que" retornam verdadeiro
		);
end multiplexador;

architecture seletor of multiplexador is

component tratamentoSubtracao is 						-- Componente da subtração
port
	(
		x0, x1 : in std_logic_vector(3 downto 0); 	-- Valores passados como parâmetros pelo multiplexador
		y 		 : out std_logic_vector(3 downto 0);	-- Valor de saída da subtração
		c 		 : out std_logic								-- Parâmetro de saída que vai indicar se a subtração pode ou não ser feita
	);
end component;

component soma is												-- Componente da soma
		port(
			A, B : in std_logic_vector(3 downto 0);	-- A e B são parâmetros recebidos do multiplexador
			S 	  : out std_logic_vector(3 downto 0);	-- S é o resultado da soma
			Co   : out std_logic								-- Co é o carry out usado na soma
			);
end component;

component inversor is										-- Componente do inversor
		port(
			A     : in std_logic_vector(3 downto 0);	-- Recebe um único valor do multiplexador como parâmetro
			y		: out std_logic_vector(3 downto 0)	-- Retorna o valor recebido
		);
end component;

component maiorque is												-- Componente da função "maior que"
		port(
				A, B     : in std_logic_vector(3 downto 0);	-- Recebe A e B como parâmetros do multiplexador	
				y			: out std_logic							-- Retorna verdadeiro se A for maior que B, falso caso contrário
			);
end component;

component menorque is												-- Componente da função "menor que"
		port(
				A, B     : in std_logic_vector(3 downto 0);  -- Recebe A e B como parâmetros do multiplexador
				y			: out std_logic							-- Retorna verdadeiro se A seja menor que B, falso caso contrário
			);
end component;

component conversor is 												-- Componente do conversor para para a saída do display de 7 segmentos
		port(
				I		: in std_logic_vector(3 downto 0);		-- Entrada do conversor (saída do multiplexador)
				Y		: out std_logic_vector(6 downto 0);		-- Saída do conversor, 7 bits para 7 segmentos
				ctrl	: in std_logic_vector(1 downto 0)		-- Seletor de controle para casos específicos
		);
end component;

signal ySubtracao, ySoma, yMaior, yMenor, yInvertido, yResultado : std_logic_vector(3 downto 0);
signal controle 					: std_logic_vector(1 downto 0);
signal erro, Carry_Soma 	 	: std_logic;

begin
-- Cálculo das operações --
Diferenca	: tratamentoSubtracao port map(x0,x1, ySubtracao, erro);
Total 		: soma port map(x0, x1, ySoma, Carry_Soma);
Maior 		: maiorque port map(x0, x1, yMaior(0));
Menor 		: menorque port map(x0, x1, yMenor(0));
Invertido	: inversor port map(x0, yInvertido);
Converte 	: conversor port map(yResultado, y, controle);

-- Selecionando a operação a ser exibida --
	WITH S SELECT
		yResultado <=  ySubtracao WHEN "000",	-- Quando a combinação de seletores resultar em 000, a subtração será exibida
							ySoma      WHEN "001",	-- Quando a combinação de seletores resultar em 001, a soma será exibida
							yMaior     WHEN "010", 	-- Quando a combinação de seletores resultar em 010, o retorno será 1 se A for maior que B, 0 caso contrário
							yMenor     WHEN "011",	-- Quando a combinação de seletores resultar em 011, o retorno será 1 se A for menor que B, 0 caso contrário
							yInvertido WHEN "100",	-- Quando a combinação de seletores resultar em 100, a entrada será invertida
							"0000"     WHEN OTHERS; -- Quando a combinação de seletores resultar em algo diferente opções anteriores nada será exibido						

-- Controle do botão liga e desliga e exibição do erro no display	
	controle(0) <= erro and desliga;
	controle(1) <= not(desliga);

-- Controle para o acendimento do Led	
	WITH S SELECT
		CoLed <= Carry_Soma WHEN "001", 	 -- Quando a combinação de seletores resultar em 001, o Led acenderá caso o carry da soma for 1
					yMaior(0)  WHEN "010",	 -- Quando a combinação de seletores resultar em 010, o Led acenderá caso a entrada A for maior que a entrada B
					yMenor(0)  WHEN "011",	 -- Quando a combinação de seletores resultar em 010, o Led acenderá caso a entrada A for menor que a entrada B
					'0'		  WHEN OTHERS;  -- Quando a combinação de seletores resultar em algo diferente, o Led seguirá apagado.
end seletor;