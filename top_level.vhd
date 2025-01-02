library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE .std_logic_unsigned.all;

entity top_level is
    Port ( clk : in STD_LOGIC;
         rst : in STD_LOGIC;
         pwm_out1 : out STD_LOGIC;
         pwm_out2 : out STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

    signal pwm_gen_out_internal : std_logic; --internal signal

    component pwm_gen is
        Port ( clk : in STD_LOGIC;
             rst : in STD_LOGIC;
             pwm_gen_out : out STD_LOGIC);
    end component;

    component deadtime_gen is
        Port ( pwm_in_dt : in STD_LOGIC;
             pwm_hs : out STD_LOGIC;
             pwm_ls : out STD_LOGIC;
             clk : in STD_LOGIC);
    end component;

begin
    pwm_gen_inst : pwm_gen
        port map (
            clk => clk,
            rst => rst,
            pwm_gen_out => pwm_gen_out_internal
            );   

    deadtime_gen_inst : deadtime_gen
        port map (
            pwm_in_dt => pwm_gen_out_internal,
            clk => clk,
            pwm_hs => pwm_out1,
            pwm_ls => pwm_out2
        );

end Behavioral;
