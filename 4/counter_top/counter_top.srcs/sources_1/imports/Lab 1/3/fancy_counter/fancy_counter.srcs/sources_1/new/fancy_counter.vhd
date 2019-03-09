library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC := '0';
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           count : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal direction : std_logic := '0';
signal value : std_logic_vector (3 downto 0)  := (others => '0');
signal cnt  : std_logic_vector(3 downto 0):="0000";
begin

count <=cnt;

    process (clk)
    begin
    if (rising_edge(clk)) then
        if (en = '1') then
            
                
                if (rst = '1') then
                cnt <= "0000";
                else
                
                if (clk_en = '1') then
                
                    if (updn = '1') then
                    direction <= dir;
                    
                    end if;
                    
                    if (ld = '1') then
                    value <= val;
                    end if;
                    
                    if (direction = '1') then
                        if (cnt < value) then
                        cnt <= cnt +1;
                        else
                        cnt <= "0000";
                        end if;
                    end if;
                    
                    if (direction = '0') then
                        if (cnt > "0000") then
                        cnt <= cnt -1;
                        else
                        cnt <= value;
                    end if;
                    
                end if;
            end if; 
        end if;
        end if;
        end if;
    end process;
    
end Behavioral;
