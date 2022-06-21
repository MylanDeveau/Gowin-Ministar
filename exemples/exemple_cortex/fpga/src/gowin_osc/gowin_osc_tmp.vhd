--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Thu Jun 16 15:23:17 2022

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_OSC
    port (
        oscout: out std_logic;
        oscen: in std_logic
    );
end component;

your_instance_name: Gowin_OSC
    port map (
        oscout => oscout_o,
        oscen => oscen_i
    );

----------Copy end-------------------
