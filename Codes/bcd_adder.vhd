library IEEE;
use IEEE.STD_LOGIC_1164.all;
library work;
use work.Gates.all;

entity bcd_adder is
	port(
			A,B : in std_logic_vector(3 downto 0);
			Y: out std_logic_vector(4 downto 0)
		);
end entity;

architecture strt of bcd_adder is
	component four_bit_adder_subtractor is
	port(
			A0,A1,A2,A3,B0,B1,B2,B3,M : in std_logic;
			Cout,S0,S1,S2,S3: out std_logic
		);
end component;
	signal zero,ainv,carry2,si1,si2,si3,ans0,ans1,ans2,ans3,ans4:std_logic;
	begin 
	--Initializing 0 and 1 logic
		inst00:INVERTER port map(a=>A(3),y=>ainv);
		inst01: AND_2 port map(a=>A(3),b=>ainv,y=>zero);
	--Doing first addition
		inst1: four_bit_adder_subtractor port map(A0=>A(0),A1=>A(1),A2=>A(2),A3=>A(3),B0=>B(0),B1=>B(1),B2=>B(2),B3=>B(3),M=>zero,Cout=>ans4,S0=>ans0,S1=>ans1,S2=>ans2,S3=>ans3);
	--Comparing with 9 or if carry is high
		inst2: OR_2 port map(a=>ans2,b=>ans1,y=>si1);
		inst3: AND_2 port map(a=>ans3,b=>si1,y=>si2);
		inst4: OR_2 port map(a=>ans4,b=>si2,y=>si3);
	--Adding 0110 according to result of the comparison
		inst5: four_bit_adder_subtractor port map(A0=>ans0,A1=>ans1,A2=>ans2,A3=>ans3,B0=>zero,B1=>si3,B2=>si3,B3=>zero,M=>zero,Cout=>carry2,S0=>Y(0),S1=>Y(1),S2=>Y(2),S3=>Y(3));
		inst6: OR_2 port map(a=>carry2,b=>ans4,y=>Y(4));
	end architecture; 