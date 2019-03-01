library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_top is
    Port ( clk : in STD_LOGIC;
           result : inout STD_LOGIC);
end divider_top;

architecture rtl_ckt of divider_top is
--components
component clock_div
    port(clk_in : in std_logic;
         div : out std_logic);
end component;

--signals
signal div_output : std_logic;
signal q_inverted : std_logic;

begin
div: clock_div
port map ( clk_in => clk,
           div => div_output);
           
led_reg: process(clk)
begin
    if (rising_edge(clk)) then
        if (div_output = '1') then
            result <= q_inverted;
        end if;
    end if;
end process;

q_inverted <= NOT(result);

end rtl_ckt;
