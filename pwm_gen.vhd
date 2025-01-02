----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE .numeric_std.all;
use IEEE .std_logic_unsigned.all;

entity pwm_gen is
    Port ( clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         pwm_gen_out : out STD_LOGIC);
end pwm_gen;

architecture Behavioral of pwm_gen is
    constant duty : real := 0.75;
    constant fclk : integer := 200_000_000;
    constant fsw  : integer := 400_000;
    signal counter_pwm : std_logic_vector (8 downto  0);
    signal duty_count : integer := integer(duty*fclk/fsw);

begin
    process (clk)
    begin
        if rst = '1' then
            counter_pwm <= (others => '0');
        elsif rising_edge(clk) then
            if counter_pwm < fclk/fsw-1 then
                counter_pwm <= counter_pwm + '1';
            else
                counter_pwm <= (others => '0');
            end if;
        end if;
    end process;

    pwm_gen_out <= '1' when counter_pwm < duty_count
                       else '0';

end Behavioral; 
