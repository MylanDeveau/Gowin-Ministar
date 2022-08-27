--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: GowinSynthesis V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Tue Jul 26 15:12:09 2022

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_EMPU_Top
	port (
		sys_clk: in std_logic;
		gpio: inout std_logic_vector(15 downto 0);
		scl: inout std_logic;
		sda: inout std_logic;
		reset_n: in std_logic
	);
end component;

your_instance_name: Gowin_EMPU_Top
	port map (
		sys_clk => sys_clk_i,
		gpio => gpio_io,
		scl => scl_io,
		sda => sda_io,
		reset_n => reset_n_i
	);

----------Copy end-------------------
