library ieee;
use ieee.std_logic_1164.all;
package Flipflops is
component dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end component dff_set;
component dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end component dff_reset;
end package Flipflops;
--D flip flop with set
library ieee;
use ieee.std_logic_1164.all;
entity dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end entity dff_set;
architecture behav of dff_set is
begin
dff_set_proc: process (clock,set)
begin
if(set='1')then -- set implies flip flip output logic high
Q <= '1'; -- write the flip flop output when set
elsif (clock'event and (clock='1')) then
Q <= D; -- write flip flop output when not set
end if ;
end process dff_set_proc;
end behav;
--D flip flop with reset
library ieee;
use ieee.std_logic_1164.all;
entity dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end entity dff_reset;
architecture behav of dff_reset is
begin
dff_reset_proc: process (clock,reset)
begin
if(reset='1')then -- reset implies flip flip output logic low
Q <= '0'; -- write the flip flop output when reset
elsif (clock'event and (clock='1')) then
Q <= D; -- write flip flop output when not reset
end if ;
end process dff_reset_proc;
end behav;
library ieee;
use ieee.std_logic_1164.all;
-- write the Flipflops packege declarationpackage Flipflops is

entity Sequence_generator_stru_dataflow is
port (reset,clock: in std_logic;
y:out std_logic);
end entity Sequence_generator_stru_dataflow;
architecture struct of Sequence_generator_stru_dataflow is
component dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end component dff_set;
component dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end component dff_reset;

signal D :std_logic_vector(2 downto 0):= "001";
signal Q:std_logic_vector(2 downto 0);
begin
-- write the equations in dataflow e.g z=a+bc written as z <= a or (b and c)
d(0) <= (q(1) and Q(2)) or not(q(0));
d(1) <= (not(q(1)) and q(0)) or (q(1) and q(0) and not(q(2)));
d(2) <= (q(2) and not(q(1))) or (q(1) and not(q(0)) and not(q(2)));
-- for DFF inputs which was derived and also for y.
-- Instantiate components dff_reset
inst1: dff_set port map(d=>d(0), clock=>clock, set=>reset, q=>q(0));
inst2: dff_reset port map(d=>d(1), clock=>clock, reset=>reset, q=>q(1));
inst3: dff_reset port map(d=>d(2), clock=>clock, reset=>reset, q=>q(2));
y <= q(0);
-- and dff_set appropriately using port map statements.
end struct;
