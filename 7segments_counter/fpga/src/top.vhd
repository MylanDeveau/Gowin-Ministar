library ieee;
use ieee.std_logic_1164.all;

entity top is
port(
    gpio_io : inout std_logic_vector(15 downto 0);

    reset : in std_logic
);
end top;

architecture bhv of top is
    signal clock, rtc_clock : std_logic;
    
    component Gowin_OSC
        port (
            oscout: out std_logic;
            oscen: in std_logic
        );
    end component;

    component Gowin_EMPU_Top
	port (
		sys_clk: in std_logic;
		rtc_src_clk: in std_logic;
		gpio: inout std_logic_vector(15 downto 0);
		reset_n: in std_logic
	);
    end component;


    component Gowin_PLLVR
    port (
        clkout: out std_logic;
        clkoutd: out std_logic;
        clkin: in std_logic
    );
    end component;

begin

    clokc_gen: Gowin_OSC
    port map (
        oscout => clock,
        oscen => '1'
    );

    pll: Gowin_PLLVR
    port map (
        clkoutd => rtc_clock,
        clkin => clock
    );

    bridge: Gowin_EMPU_Top
	port map (
		sys_clk => clock,
		rtc_src_clk => rtc_clock,
		gpio => gpio_io,
		reset_n => reset
	);

end architecture;





