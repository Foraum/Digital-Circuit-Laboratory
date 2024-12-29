library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity fourbit_4x1mux is 
   port(d3, d2, d1, d0, c3, c2, c1, c0, b3, b2, b1, b0, a3, a2, a1, a0, sel1, sel2 : in std_logic; 
	      y3, y2, y1, y0 : out std_logic);
end entity;

architecture struct of fourbit_4x1mux is
   component four1_mux is 
   port(i4, i3, i2, i1, s2, s1 : in std_logic; 
	      y : out std_logic);
end component;

  
   signal p1, p2 : std_logic;
begin 
   inst1: four1_mux port map(i4=>d3, i3=>c3, i2=>b3, i1=>a3, s2=>sel1, s1=>sel2, y=>y3);
   inst2: four1_mux port map(i4=>d2, i3=>c2, i2=>b2, i1=>a2, s2=>sel1, s1=>sel2, y=>y2);
	inst3: four1_mux port map(i4=>d1, i3=>c1, i2=>b1, i1=>a1, s2=>sel1, s1=>sel2, y=>y1);
	inst4: four1_mux port map(i4=>d0, i3=>c0, i2=>b0, i1=>a0, s2=>sel1, s1=>sel2, y=>y0);
	
end architecture;