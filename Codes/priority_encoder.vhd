library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity priority_encoder is 
   port(a, b, c, d : in std_logic; 
	      Y1, Y2, v : out std_logic);
end entity;

architecture struct of priority_encoder is
   signal s1, s2, s3, s4 : std_logic;
begin 
   inst1: or_2 port map(a=>a, b=>b, y=>y1);
	inst2: or_2 port map(a=>a, b=>b, y=>s1);
	inst3: or_2 port map(a=>c, b=>d, y=>s2);
	inst4: or_2 port map(a=>s1, b=>s2, y=>v);
	inst5: inverter port map(a=>b, y=>s3);
	inst6: and_2 port map(a=>s3, b=>c, y=>s4);
	inst7: or_2 port map(a=>a, b=>s4, y=>y2);
end architecture;