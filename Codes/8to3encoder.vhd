library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity 8to3encoder is 
   port(a, b, c, d, En : in std_logic; 
	      Y1, Y2 : out std_logic);
end entity;

architecture struct of encoder is
   signal s1, s2 : std_logic;
begin 
   inst1: or_2 port map(a=>a, b=>b, y=>s1);
	inst2: and_2 port map(a=>s1, b=>en, y=>y1);
	inst3: or_2 port map(a=>a, b=>c, y=>s2);
	inst4: and_2 port map(a=>s2, b=>en, y=>y2);
end architecture;