--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: GowinSynthesis V1.9.8.05
--Part Number: GW1NS-LV4CQN48C7/I6
--Device: GW1NS-4C
--Created Time: Thu Jun 02 21:40:42 2022

--Change the instance name and port connections to the signal names
----------Copy here to design--------

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

your_instance_name: Gowin_EMPU_Top
	port map (
		sys_clk => sys_clk_i,
		gpio => gpio_io,
		user_int_0 => user_int_0_i,
		user_int_1 => user_int_1_i,
		user_int_2 => user_int_2_i,
		reset_n => reset_n_i
	);

----------Copy end-------------------
