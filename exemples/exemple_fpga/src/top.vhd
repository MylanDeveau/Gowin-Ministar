library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


entity led_blink is
port(
    led : out std_logic
);
end entity;

architecture bhv of led_blink is
    signal clock : std_logic;

    component Gowin_OSC
    port (
        oscout: out std_logic;
        oscen: in std_logic
    );
    end component;

begin

    clock_gen : Gowin_OSC
    port map (
        oscout => clock,
        oscen => '1'
    );

    divider : entity work.divider1hz
    port map(clock, '1', led);

end architecture;




