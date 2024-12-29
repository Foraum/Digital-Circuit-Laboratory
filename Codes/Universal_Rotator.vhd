library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity universal_rotator is
    port(A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(2 downto 0);
			l: in std_logic;
			Y: out std_logic_vector(7 downto 0));
end entity;

architecture archi_universal_rotator of universal_rotator is
   component mux is
port(I: in std_logic_vector(1 downto 0);
		s: in std_logic;
		y  : out std_logic
);
   end component;
	signal s1,s2,s3,s4 :std_logic_vector(7 downto 0);

begin
--bit reveral
n4_bit : for i in 0 to 7 generate
lsb: if i < 8 generate
k2: mux port map(I(0) => a(i), I(1) => a(7-i), s => l, Y => s1(i));
end generate lsb;
end generate;

--right rotate by 4 bits
 m4_bit : for i in 0 to 7 generate
 lsb: if i < 4 generate
 k2: mux port map(I(0)=> s1(i), I(1) => s1(i+4), S => b(2), Y => s2(i));
 end generate lsb;
 msb: if i > 3 generate
 k2: mux port map(I(0) => s1(i), I(1) => s1(i-4) , S => b(2), Y => s2(i));
 end generate msb;
 end generate;
 
 --right rotate by 2 bits
 o4_bit : for i in 0 to 7 generate
 lsb: if i < 6 generate
 k2: mux port map(I(0) => s2(i), I(1) => s2(i+2), S => b(1), Y => s3(i));
 end generate lsb;
 msb: if i > 5 generate
 k2: mux port map(I(0) => s2(i), I(1) => s2(i-6) , S => b(1), Y => s3(i));
 end generate msb;
 end generate;
 
 --right rotate by 1 bits
 p4_bit : for i in 0 to 7 generate
 lsb: if i < 7 generate
 k2: mux port map(I(0) => s3(i), I(1) => s3(i+1), S => b(0), Y => s4(i));
 end generate lsb;
 msb: if i > 6 generate
 k2: mux port map(I(0) => s3(i), I(1) => s3(i-7) , S => b(0), Y => s4(i));
 end generate msb;
 end generate;
 
 --bit reveral
q4_bit : for i in 0 to 7 generate
lsb: if i < 8 generate
k2: mux port map(I(0) => s4(i), I(1) => s4(7-i), S => l, Y => Y(i));
end generate lsb;
end generate;
end architecture;
