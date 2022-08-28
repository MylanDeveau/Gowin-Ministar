library ieee;
use ieee.std_logic_1164.all;
use work.tick;

entity top is
port(
    gpio_io : inout std_logic_vector(15 downto 0);
    sda, scl : inout std_logic;
    reset : in std_logic
);
end top;

architecture bhv of top is
    signal clock : std_logic;
    
    component Gowin_EMPU_Top
        port (
            sys_clk: in std_logic;
            gpio: inout std_logic_vector(15 downto 0);
            scl: inout std_logic;
            sda: inout std_logic;
            reset_n: in std_logic
        );
    end component;


    component Gowin_OSC
        port (
            oscout: out std_logic;
            oscen: in std_logic
        );
    end component;


begin

    clokc_gen: Gowin_OSC
    port map (
        oscout => clock,
        oscen => '1'
    );


    your_instance_name: Gowin_EMPU_Top
        port map (
            sys_clk => clock,
            gpio => gpio_io,
            scl => scl,
            sda => sda,
            reset_n => reset
        );

end architecture;





