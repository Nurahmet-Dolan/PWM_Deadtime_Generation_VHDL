library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE .std_logic_unsigned.all;

entity pwm_edge_delay is
    Port ( clk : in STD_LOGIC;
         pwm_in : in STD_LOGIC;
         pwm_out : out STD_LOGIC);
end pwm_edge_delay;

architecture Behavioral of pwm_edge_delay is

    constant dead_cycles_cons : integer := 10;                   -- adjust deadtime here 
    signal counter_delay : std_logic_vector (3 downto 0);       -- 2^4=16 clock cycles;

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if (pwm_in = '0') then
                pwm_out <= '0';
                counter_delay <= (others => '0');
            else
                if (counter_delay < dead_cycles_cons - 1) then
                    counter_delay <= counter_delay + 1;
                else
                    pwm_out <= '1';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
