--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Tue Jun 21 14:45:55 2022

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_PLLVR
    port (
        clkout: out std_logic;
        clkoutd: out std_logic;
        clkin: in std_logic
    );
end component;

your_instance_name: Gowin_PLLVR
    port map (
        clkout => clkout_o,
        clkoutd => clkoutd_o,
        clkin => clkin_i
    );

----------Copy end-------------------
