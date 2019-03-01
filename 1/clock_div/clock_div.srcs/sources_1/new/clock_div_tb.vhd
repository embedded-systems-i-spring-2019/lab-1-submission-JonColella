library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_div_tb is
end clock_div_tb;

architecture tb of clock_div_tb is

component clock_div
    port ( clk_in : in std_logic;
           div : out std_logic);
end component;

signal tb_clk : std_logic := '0';
signal tb_div : std_logic := '0';

begin

dut: clock_div port map (clk_in => tb_clk, div => tb_div);

process begin
        tb_clk <= '0'; --simulate 125MHz clock
        wait for 4 ns;
        tb_clk <= '1';
        wait for 4 ns;
end process;

end tb;
