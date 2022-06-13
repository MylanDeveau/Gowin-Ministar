
/*
 * *****************************************************************************************
 *
 * 		Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
 * 		
 * @file		main.c
 * @author		Embedded Development Team
 * @version		V1.0.0
 * @date		2020-5-1 09:00:00
 * @brief		Main program body.
 ******************************************************************************************
 */

/* Includes ------------------------------------------------------------------*/
#include "gw1ns4c.h"
#include "gw1ns4c_it.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* declarations ------------------------------------------------------------------*/
void Delay(__IO uint32_t nCount);
short int convert(int value);
short int code_pin(int pin_num);

int *ptr_c;
int *ptr_speed;

int main(void)
{
	SystemInit();
	NVIC_InitTypeDef nvic_struct;

	nvic_struct.NVIC_IRQChannel = 3;
	nvic_struct.NVIC_IRQChannelCmd = ENABLE;
	nvic_struct.NVIC_IRQChannelPreemptionPriority = 0;
	nvic_struct.NVIC_IRQChannelSubPriority = 0;

	NVIC_Init(&nvic_struct);

	nvic_struct.NVIC_IRQChannel = 1;

	NVIC_Init(&nvic_struct);

	nvic_struct.NVIC_IRQChannel = 4;

	NVIC_Init(&nvic_struct);
	int counter = 0;
	ptr_c = &counter;
	int pin = 0;
	int counter_display = 0;
	int speed = 330;
	ptr_speed = &speed;


	GPIO0->OUTENSET = 0xffffffff;
	GPIO0->INTENSET;
	while(1){
		pin = (pin + 1) % 4;
		int arr[4] = {0,0,0,0};
		int c = 0;
		int tmp = counter;
		while(tmp)
		{
		    arr[c] = tmp % 10;
		    c++;
		    tmp /= 10;
		}
		GPIO0->DATAOUT = code_pin(pin) + convert(arr[pin]);
		Delay(4166);
		counter_display = (counter_display + 1) % speed;
		if (counter_display == speed-1)
			counter = (counter + 1) % 10000;

	}
}

short int code_pin(int pin_num){
	switch (pin_num) {
			case 0:
				return 0x400;
			case 1:
				return 0x200;
			case 2:
				return 0x100;
			case 3:
				return 0x80;
			default:
				return 0x0;
	}
}

short int  convert(int value){
	switch (value) {
		case 0:
			return 0x40;
		case 1:
			return 0x79;
		case 2:
			return 0x24;
		case 3:
			return 0x30;
		case 4:
			return 0x19;
		case 5:
			return 0x12;
		case 6:
			return 0x2;
		case 7:
			return 0x78;
		case 8:
			return 0x0;
		case 9:
			return 0x10;
		default:
			return 0x7F;
	}
}

void Delay(__IO uint32_t nCount)//25M 1s = 8333000
{
	for(; nCount != 0; nCount--);
}
