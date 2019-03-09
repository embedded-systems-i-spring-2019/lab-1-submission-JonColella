library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_top is
    Port ( btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : inout STD_LOGIC_VECTOR (3 downto 0));
end counter_top;

architecture rtl_ckt of counter_top is
--components
component clock_div is
    port( clk_in : in STD_LOGIC;
          div : inout STD_LOGIC);
end component;

component debounce is
    port( clk : in STD_LOGIC;
          btn : in STD_LOGIC;
          dbnc : out STD_LOGIC);
end component;

component fancy_counter is
    port( clk : in STD_LOGIC;
          clk_en : in STD_LOGIC;
          dir : in STD_LOGIC;
          en : in STD_LOGIC;
          ld : in STD_LOGIC;
          rst : in STD_LOGIC;
          updn : in STD_LOGIC;
          val : in STD_LOGIC_VECTOR (3 downto 0);
          count : inout STD_LOGIC_VECTOR (3 downto 0));
end component;

--signals
signal dbnc_0 : std_logic;
signal dbnc_1 : std_logic;
signal dbnc_2 : std_logic;
signal dbnc_3 : std_logic;
signal div_clk : std_logic;

begin

dba: debounce
port map (clk => clk, btn => btn(0), dbnc => dbnc_0);

dbb: debounce
port map (clk => clk, btn => btn(1), dbnc => dbnc_1);

dbc: debounce
port map (clk => clk, btn => btn(2), dbnc => dbnc_2);

dbd: debounce
port map (clk => clk, btn => btn(3), dbnc => dbnc_3);

div: clock_div
port map (clk_in => clk, div => div_clk);

counter: fancy_counter
port map (clk => clk, clk_en => div_clk, dir => sw(0), en => dbnc_1, ld => dbnc_3, rst => dbnc_0, updn => dbnc_2, val => sw, count => led);

end rtl_ckt;
