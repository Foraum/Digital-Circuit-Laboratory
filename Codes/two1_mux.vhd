library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity two1_mux is 
   port(i0, i1, s : in std_logic; 
	      y : out std_logic);
end entity;

architecture struct of two1_mux is
  
   signal s1, s2, s3, s4, s5, s6, s7, s8 : std_logic;
begin 
   inst1: inverter port map(a=>s, y=>s1);
	inst2: and_2 port map(a=>i0, b=>s1, y=>s2);
	inst3: and_2 port map(a=>i1, b=>s, y=>s3);
	inst4: or_2 port map(a=>s2, b=>s3, y=>y);
	
end architecture;