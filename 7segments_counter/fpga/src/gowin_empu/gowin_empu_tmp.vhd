--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: GowinSynthesis V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Mon Aug 22 16:31:08 2022

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_EMPU_Top
	port (
		sys_clk: in std_logic;
		rtc_src_clk: in std_logic;
		gpio: inout std_logic_vector(15 downto 0);
		reset_n: in std_logic
	);
end component;

your_instance_name: Gowin_EMPU_Top
	port map (
		sys_clk => sys_clk_i,
		rtc_src_clk => rtc_src_clk_i,
		gpio => gpio_io,
		reset_n => reset_n_i
	);

----------Copy end-------------------
