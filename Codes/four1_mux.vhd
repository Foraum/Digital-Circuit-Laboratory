library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four1_mux is 
   port(i4, i3, i2, i1, s2, s1 : in std_logic; 
	      y : out std_logic);
end entity;

architecture struct of four1_mux is
   component two1_mux is 
   port(i0, i1, s : in std_logic; 
	      y : out std_logic);
end component;

  
   signal p1, p2 : std_logic;
begin 
   inst1: two1_mux port map(i0=>i1, i1=>i3, s=>s2, y=>p1);
	inst2: two1_mux port map(i0=>i2, i1=>i4, s=>s2, y=>p2);
	inst3: two1_mux port map(i0=>p1, i1=>p2, s=>s1, y=>y);
	
end architecture;