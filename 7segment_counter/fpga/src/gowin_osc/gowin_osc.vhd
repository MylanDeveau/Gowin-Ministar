--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--GOWIN Version: V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Tue May 31 19:24:17 2022

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_OSC is
    port (
        oscout: out std_logic;
        oscen: in std_logic
    );
end Gowin_OSC;

architecture Behavioral of Gowin_OSC is

    --component declaration
    component OSCZ
        generic (
            FREQ_DIV: in integer := 100
        );
        port (
            OSCOUT: out std_logic;
            OSCEN: in std_logic
        );
    end component;

begin
    osc_inst: OSCZ
        generic map (
            FREQ_DIV => 10
        )
        port map (
            OSCOUT => oscout,
            OSCEN => oscen
        );

end Behavioral; --Gowin_OSC
