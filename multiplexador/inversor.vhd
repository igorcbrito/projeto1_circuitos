use ieee.std_logic_1164.all;

entity inversor is
port(
  A      : in std_logic_vector(3 downto 0);
  y		: out std_logic
  );
end inversor;
 
architecture archInversor of inversor is
begin

    y <= (A(3) and not(B(3))) or ((A(3) xor B(3)) and (A(2) and not B(2))) or ((A(3) xor B(3)) and (A(2) xor B(2)) and (A(1) and not(B(1)))) or
	 ((A(3) xor B(3)) and (A(2) xor B(2)) and (A(1) xor B(1)) and (A(0) and not(B(0))));
					
end archInversor;