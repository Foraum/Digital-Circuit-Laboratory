library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.gates.all;

entity word_detection is
port (
inp: in std_logic_vector(4 downto 0);
reset,clock: in std_logic;
outp: out std_logic) ;
end word_detection;

architecture bhv of word_detection is

component worddetection_ring is
port (
inp: in std_logic_vector(4 downto 0);
reset,clock: in std_logic;
outp: out std_logic) ;
end component;

component worddetection_lion is
port (
inp: in std_logic_vector(4 downto 0);
reset,clock: in std_logic;
outp: out std_logic) ;
end component;

component worddetection_must is
port (
inp: in std_logic_vector(4 downto 0);
reset,clock: in std_logic;
outp: out std_logic) ;
end component;

signal s_lion,s_must,s_ring,s_lion_ring:std_logic;
begin

inst1: worddetection_must port map(inp=>inp, reset=>reset, clock=>clock, outp=>s_must);
inst2: worddetection_ring port map(inp=>inp, reset=>reset, clock=>clock, outp=>s_ring);
inst3: worddetection_lion port map(inp=>inp, reset=>reset, clock=>clock, outp=>s_lion);
inst4: OR_2 port map(a=> s_lion, b=>s_ring, y=>s_lion_ring);
inst5: or_2 port map(a=> s_lion_ring, b=>s_must, y=>outp);
--inst5: OR_2 port map(a=>s_lion_ring, b=>s_must, y=>outp);

end architecture;


