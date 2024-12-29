library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity trafficlight is
    Port (
        clk_in  : in  STD_LOGIC;           -- 1 Hz clock
        reset   : in  STD_LOGIC;                    
        output       : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture behavioural of trafficlight is
       component clock is port( 
		 clk_in : in std_logic;
		 reset : in std_logic;
		 clk_out : out std_logic);
       end component;
  
       signal clk_out : std_logic;
		 signal state : integer := 0;
		 signal counter : integer := 0;
begin 
       inst1: clock port map(clk_in=>clk_in, reset=>reset, clk_out=>clk_out);
		 
		 process(clk_out,reset) 
		 begin
		 if reset = '1' then 
		 state <= 0;
		 counter <= 0;
		 elsif rising_edge(clk_out) then
		    counter <= counter+1; 
		    if (state mod 2) = 0 then 
			    if counter=5 then 
				    state<=state+1;
					 counter<=0;
				 end if;
			 else 
			    if counter = 1 then
				    if state=7 then state<=0;
					 else state<=state+1;
					 end if;
					 counter<=0;
				 end if;
			 end if;
		  end if;
		  end process;
		  
		  process(state)
		  begin 
		  case state is
		  when 0 => output <= "01111111";
		  when 1 => output <= "10101111";
		  when 2 => output <= "11011111";
		  when 3 => output <= "11101011";
		  when 4 => output <= "11110111";
		  when 5 => output <= "11111010";
		  when 6 => output <= "11111101";
		  when 7 => output <= "10111110";
		  when others => output <= "01111111";
		  
		  end case;
		  end process;
end architecture; 
		  
			  