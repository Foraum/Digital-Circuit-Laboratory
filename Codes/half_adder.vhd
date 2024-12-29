library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity halfadder is 
   port(a, b : in std_logic; 
	      s, c : out std_logic);
end entity;
architecture struct of halfadder is
   component xor_gate is
     port(A, B: in std_logic;
         y: out std_logic);
   end component;
   signal s1 : std_logic;
begin 
   inst1: xor_gate port map(a=>a, b=>b, y=>s);
	inst2: NAND_2 port map(a=>a, b=>b, y=>s1);
	inst3: NAND_2 port map(a=>s1, b=>s1, y=>c);
end architecture;