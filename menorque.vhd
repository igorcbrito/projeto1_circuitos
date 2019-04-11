library ieee;
use ieee.std_logic_1164.all;

entity menorque is
port(
  A      : in std_logic_vector(3 downto 0);
  B		: in std_logic_vector(3 downto 0);
  y		: out std_logic
  );
end menorque;
 
architecture archMenorque of menorque is
begin

    y <= (B(3) and not(A(3))) or 
	 ((B(3) xnor A(3)) and (B(2) and not A(2))) or
	 ((B(3) xnor A(3)) and (B(2) xnor A(2)) and (B(1) and not(A(1)))) or
	 ((B(3) xnor A(3)) and (B(2) xnor A(2)) and (B(1) xnor A(1)) and (B(0) and not(A(0))));
					
end archMenorque;
	