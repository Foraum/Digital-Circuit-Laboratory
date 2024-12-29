library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity addersubtractor is 
   port(m, a0, a1, a2, a3, b0, b1, b2, b3 : in std_logic; 
	     c, s0, s1, s2, s3 : out std_logic);
end entity;

architecture struct of addersubtractor is
   component fulladder is 
   port(a, b, d : in std_logic; 
	      s, c : out std_logic);
end component;
   signal p1, p2, p3, p4, p5, p6, p7 : std_logic;
begin 
   inst1: XOR_2 port map(a=>m, b=>b0, y=>p1);
	inst2: fulladder port map(a=>p1, b=>a0, d=>m, s=>s0, c=>p2);
	inst3: XOR_2 port map(a=>m, b=>b1, y=>p3);
	inst4: fulladder port map(a=>p3, b=>a1, d=>p2, s=>s1, c=>p4);
	inst5: XOR_2 port map(a=>m, b=>b2, y=>p5);
	inst6: fulladder port map(a=>p5, b=>a2, d=>p4, s=>s2, c=>p6);
	inst7: XOR_2 port map(a=>m, b=>b3, y=>p7);
	inst8: fulladder port map(a=>p7, b=>a3, d=>p6, s=>s3, c=>c);
	
end architecture;