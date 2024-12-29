library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity majoritycircuit is 
   port(x4, x3, x2, x1, x0 : in std_logic; 
	      y : out std_logic);
end entity;

architecture struct of majoritycircuit is
  
   signal m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, n1, n2, n3, n4, n5, n6, n7, n8 : std_logic;
begin 
   inst1: or_2 port map(a=>x0, b=>x1, y=>m1); 
	inst2: and_2 port map(a=>x0, b=>x1, y=>p1);  
	inst3: or_2 port map(a=>x2, b=>x3, y=>m2); 
	inst4: and_2 port map(a=>x2, b=>x3, y=>p2);  
	inst5: or_2 port map(a=>m2, b=>x4, y=>m3);  
	inst6: or_2 port map(a=>m1, b=>x4, y=>p3);  
	inst7: and_2 port map(a=>p3, b=>p2, y=>m4); 
	inst8: and_2 port map(a=>p1, b=>m3, y=>p4); 
	inst9: and_2 port map(a=>m1, b=>m2, y=>m5); 
	inst10: and_2 port map(a=>m5, b=>x4, y=>p5); 
	inst11: or_2 port map(a=>m4, b=>p4, y=>m6);
	inst12: or_2 port map(a=>m6, b=>p5, y=>y);
	
end architecture;