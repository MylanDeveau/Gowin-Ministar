library ieee;
use ieee.std_logic_1164.all;
use work.tick;

entity top is
port(
    gpio_io : inout std_logic_vector(15 downto 0);
    usr_int_0, usr_int_1, usr_int_2 :in std_logic;
    reset : in std_logic
);
end top;

architecture bhv of top is
    signal clock, int0, int1, int2 : std_logic;
       
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
		user_int_0: in std_logic;
		user_int_1: in std_logic;
		user_int_2: in std_logic;
		reset_n: in std_logic
	);
end component;


begin

    clokc_gen: Gowin_OSC
    port map (
        oscout => clock,
        oscen => '1'
    );

    inter_0 : entity work.tick
    port map(clock, usr_int_0, int0);

    inter_1 : entity work.tick
    port map(clock, usr_int_1, int1);

    inter_2 : entity work.tick
    port map(clock, usr_int_2, int2);

    bridge: Gowin_EMPU_Top
	port map (
		sys_clk => clock,
		gpio => gpio_io,
        user_int_0 => int0,
		user_int_1 => int1,
		user_int_2 => int2,
		reset_n => reset
	);

end architecture;





