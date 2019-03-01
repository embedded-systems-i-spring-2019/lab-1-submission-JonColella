library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debounce_tb is
end debounce_tb;

architecture tb of debounce_tb is
    component debounce
        port( clk, btn : in std_logic;
              dbnc : out std_logic);
    end component;
    
    signal tb_clk : std_logic := '0';
    signal tb_btn : std_logic := '0';
    signal tb_dbnc : std_logic := '0';
    signal btn_div : std_logic;
    signal count : std_logic_vector (23 downto 0) := (others => '0');
begin

    dut: debounce port map (clk => tb_clk, btn => tb_btn, dbnc => tb_dbnc);
    
    process begin
    tb_clk <= '0';
    wait for 4 ns;
    tb_clk <= '1';
    if (count < 9999999) then --wait 40ms per btn switching
        count <= count + 1;
        if (count < 4999999) then
            tb_btn <= '0';
        else
            tb_btn <= '1'; --50 percent duty cycle
        end if;
    else
        count <= (others => '0');
        btn_div <= '0';
    end if;
    
    wait for 4 ns;
end process;
end tb;
