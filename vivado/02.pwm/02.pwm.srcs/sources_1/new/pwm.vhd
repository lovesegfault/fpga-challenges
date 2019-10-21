library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm is
    Port (
        clk: in std_logic;
        led0_r: out std_logic;
        led0_g: out std_logic;
        led0_b: out std_logic
    );
    constant sample_size: integer := 27;
    constant down_amount: integer := 8;
end pwm;

architecture rtl of pwm is
    signal clk_down: std_logic_vector (sample_size downto 0);
    signal led_map: std_logic_vector (2 downto 0) := "100";
begin

    process(clk) is
    begin
        if(rising_edge(clk)) then
            clk_down <= clk_down + 1;
            if (clk_down = 2 ** down_amount) then
                led_map(2) <= '1';
            else
                led_map(2) <= '0';    
            end if;
        end if;
    end process;

    led0_r <= led_map(0);
    led0_g <= led_map(1);
    led0_b <= led_map(2);
end rtl;
