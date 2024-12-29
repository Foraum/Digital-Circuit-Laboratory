library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity fulladder is 
   port(a, b, d : in std_logic; 
	      s, c : out std_logic);
end entity;

architecture struct of fulladder is
   component xor_gate is
     port(A, B : in std_logic;
         y: out std_logic);
   end component;
   signal s1, s2, s3, s4, s5, s6, s7 : std_logic;
begin 
   inst1: xor_gate port map(a=>a, b=>b, y=>s1);
	inst2: xor_gate port map(a=>s1, b=>d, y=>s);
	inst3: NAND_2 port map(a=>a, b=>b, y=>s2);
	inst4: NAND_2 port map(a=>s2, b=>s2, y=>s3);
	inst5: NAND_2 port map(a=>s1, b=>d, y=>s4);
	inst6: NAND_2 port map(a=>s4, b=>s4, y=>s5);
	inst7: NAND_2 port map(a=>s3, b=>s3, y=>s6);
	inst8: NAND_2 port map(a=>s5, b=>s5, y=>s7);
	inst9: NAND_2 port map(a=>s6, b=>s7, y=>c);
end architecture;