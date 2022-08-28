//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: GowinSynthesis V1.9.8.05
//Part Number: GW1NS-LV4CQN48C7/I6
//Device: GW1NS-4C
//Created Time: Tue Jul 26 15:05:37 2022

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	Gowin_EMPU_Top your_instance_name(
		.sys_clk(sys_clk_i), //input sys_clk
		.gpio(gpio_io), //inout [15:0] gpio
		.scl(scl_io), //inout scl
		.sda(sda_io), //inout sda
		.reset_n(reset_n_i) //input reset_n
	);

//--------Copy end-------------------
