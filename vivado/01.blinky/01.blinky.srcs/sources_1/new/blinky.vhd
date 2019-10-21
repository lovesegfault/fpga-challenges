library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity blinky is
    Port (
        clk: in std_logic;
        led: out std_logic_vector (3 downto 0)
    );
    constant period: integer := 25;
end blinky;

architecture rtl of blinky is
    signal cycle: std_logic_vector (period downto 0);
    signal led_map: std_logic_vector (3 downto 0) := "1000";
begin
    process(clk) is
    begin
        if(rising_edge(clk)) then
            cycle <= cycle + 1;
            if (cycle = 2 ** period) then
                led_map <= led_map(0)  & led_map(3 downto 1);
            end if;
        end if;
    end process;
    
     led <= led_map;
end rtl;
