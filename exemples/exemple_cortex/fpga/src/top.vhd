library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity led_blink is
port(
    gpio_io : inout std_logic_vector(15 downto 0)
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

    component Gowin_EMPU_Top
	port (
		sys_clk: in std_logic;
		gpio: inout std_logic_vector(15 downto 0);
		reset_n: in std_logic
	);
    end component;
begin
    clock_gen : Gowin_OSC
    port map (
        oscout => clock,
        oscen => '1'
    );

    empu: Gowin_EMPU_Top
	port map (
		sys_clk => clock,
		gpio => gpio_io,
		reset_n => '1'
	);
end architecture;
