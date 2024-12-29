library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LED_detect is
    Port (
        clk_in  : in  STD_LOGIC;           -- 1 Hz clock
        reset   : in  STD_LOGIC;           
        switch  : in  STD_LOGIC;           
        L       : out STD_LOGIC_VECTOR(7 downto 0)
    );
end LED_detect;

architecture Behavioral of LED_detect is
    signal counter     : INTEGER := 0;         
    signal count_value : INTEGER := 0;         
    signal led_pattern : STD_LOGIC_VECTOR(7 downto 0);
begin
    process(clk_in, reset)
    begin
        if reset = '1' then
            counter <= 0;
            count_value <= 0;
            led_pattern <= (others => '0');
        elsif rising_edge(clk_in) then
            if switch = '0' then
                case counter is
                    when 0 => led_pattern <= "11100000"; -- LED1, LED2, LED3
                    when 1 => led_pattern <= "01110000"; -- LED2, LED3, LED4
                    when 2 => led_pattern <= "00111000"; -- LED3, LED4, LED5
                    when 3 => led_pattern <= "00011100"; -- LED4, LED5, LED6
                    when 4 => led_pattern <= "00001110"; -- LED5, LED6, LED7
                    when 5 => led_pattern <= "00000111"; -- LED6, LED7, LED8
                    when 6 => led_pattern <= "00001110"; -- LED5, LED6, LED7
                    when 7 => led_pattern <= "00011100"; -- LED4, LED5, LED6
                    when 8 => led_pattern <= "00111000"; -- LED3, LED4, LED5
                    when 9 => led_pattern <= "01110000"; -- LED2, LED3, LED4
                    when others => led_pattern <= "11100000"; -- LED1, LED2, LED3
                end case;
					 L <= led_pattern;
                counter <= (counter + 1) mod 10;

            else
                L <= conv_std_logic_vector(count_value, 8);
                count_value <= (count_value + 2) mod 101;
            end if;
        end if;
    end process;

     
end Behavioral;
