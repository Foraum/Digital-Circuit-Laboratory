library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity alu_lab5 is
port (sel: in std_logic_vector(1 downto 0);
a: in std_logic_vector(3 downto 0);
b: in std_logic_vector(3 downto 0);
y: out std_logic_vector(7 downto 0));
end entity;

architecture struct of alu_lab5 is

function sub(a: in std_logic_vector(3 downto 0); b: in std_logic_vector(3 downto 0))
return std_logic_vector is
variable diff : std_logic_vector(7 downto 0) := (others =>'0');

variable borrow : std_logic := '0';
variable a_8bit: std_logic_vector(7 downto 0) := (others => '0');
variable b_8bit: std_logic_vector(7 downto 0) := (others => '0');

begin
a_8bit := "0000" & a;
b_8bit := "0000" & b;
for i in 0 to 7 loop
diff(i) := a_8bit(i) xor b_8bit(i) xor borrow;
borrow := ((not(a_8bit(i)) or borrow) and b_8bit(i)) or (not(a_8bit(i)) and borrow);
end loop;
return diff;
end sub;

function shift(a: in std_logic_vector(3 downto 0); b: in std_logic_vector(3 downto 0))
return std_logic_vector is
variable shifted_vec: std_logic_vector(7 downto 0) := (others => '0');

begin
if (b(3) = '1') then

if (b(1 downto 0) = "11") then
for i in 3 downto 3 loop
shifted_vec(3-i) := a(6-i);
end loop;
elsif (b(1 downto 0) = "10") then
for i in 3 downto 2 loop
shifted_vec(3-i) := a(5-i);
end loop;
elsif (b(1 downto 0) = "01") then
for i in 3 downto 1 loop
shifted_vec(3-i) := a(4-i);
end loop;
elsif (b(1 downto 0) = "00") then
for i in 3 downto 0 loop
shifted_vec(3-i) := a(3-i);
end loop;
end if;

else

if (b(1 downto 0) = "11") then
for i in 3 downto 3 loop
shifted_vec(i) := a(i-3);
end loop;
elsif (b(1 downto 0) = "10") then
for i in 3 downto 2 loop
shifted_vec(i) := a(i-2);
end loop;
elsif (b(1 downto 0) = "01") then
for i in 3 downto 1 loop
shifted_vec(i) := a(i-1);
end loop;
elsif (b(1 downto 0) = "00") then
for i in 3 downto 0 loop
shifted_vec(i) := a(i);
end loop;
   end if;
   end if;

return shifted_vec;
end shift;

begin
alu : process(a, b, sel)

begin

   if (sel = "00") then
   y <= a & b;
   elsif (sel = "01") then
y <= sub(a, b);
   elsif (sel = "10") then
y <= "0000" & (a xor b);
   else
y <= shift(a, b);
   end if;

end process;
end struct;