library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE .std_logic_unsigned.all;

entity deadtime_gen is
    Port ( pwm_in_dt : in STD_LOGIC;
         pwm_hs : out STD_LOGIC;
         pwm_ls : out STD_LOGIC;
         clk : in STD_LOGIC);
end deadtime_gen;

architecture Behavioral of deadtime_gen is

    component pwm_edge_delay is
        Port ( clk : in STD_LOGIC;
             pwm_in : in STD_LOGIC;
             pwm_out : out STD_LOGIC);
    end component;
    
    signal not_pwm_in : std_logic;      -- internal signal for lowside

begin

    hs: pwm_edge_delay port map (
            pwm_in => pwm_in_dt,
            pwm_out => pwm_hs,
            clk => clk
    );

    ls: pwm_edge_delay port map (
            pwm_in => not_pwm_in,
            pwm_out => pwm_ls,
            clk => clk
    );

        not_pwm_in <= not pwm_in_dt;

end Behavioral;
