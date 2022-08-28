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
void init();
int convert(int value);
int code_pin(int pin_num);

/* Variable ------------------------------------------------------------------*/
int temp_add=0;

int main(void) {

	init();

	int counter = 0;
	char pin = 0;
	unsigned char res[100]; // res[2]={0,0};

	//I2C_InterruptOpen(I2C);

	//I2C_SendByte(I2C, 0x48, 0x0, NULL);
	int arr [4] = {0,0,0,0};
	int slv_address = 0x48;
	int addr_data = 0x00;
	int READ_TEMPERATURE = 0xAA;
	int ACCESS_CONFIG    = 0xAC;
	int START_CONVERT    = 0xEE;
	int STOP_CONVERT     = 0x22;
	int REGISTER_CONFIG  = 0x1;
	// Commande pour recevoir des données du capteur R/W = 1
	//I2C_ReceiveByte(I2C, slv_address, STOP_CONVERT);
	// Commande pour envoyer des données au capteur R/W = 0
	I2C_SendByte(I2C, slv_address, addr_data, STOP_CONVERT);

//	I2C_SendByte(I2C, slv_address, addr_data, START_CONVERT);
	//I2C_SendByte(I2C, slv_address, ACCESS_CONFIG, REGISTER_CONFIG);
	//I2C_ReceiveByte(I2C, slv_address, READ_TEMPERATURE);

	while (1) {

		arr[0] = 1; //res[0] % 10;
		arr[1] = 1; //res[1] % 10;
		arr[2] = 0;
		arr[3] = 0;

		GPIO0->DATAOUT = code_pin(pin) + convert(arr[pin]);

		pin = (pin + 1) % 4;


		/*int arr[4] = { 0, 0, 0, 0 };
		char sec = counter % 60;

		arr[0] = sec % 10;
		arr[1] = sec / 10;

		counter /= 60;

		arr[2] = counter % 10;
		arr[3] = (counter % 60) / 10;

		GPIO0->DATAOUT = code_pin(pin) + convert(arr[pin]);
	*/	Delay(15000); //  1001-A0-A1-A2-R/W

	}
}

void init() {
	SystemInit();

	GPIO_InitTypeDef GPIO_InitType;

	GPIO_InitType.GPIO_Pin = GPIO_Pin_All;
	GPIO_InitType.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitType.GPIO_Int = GPIO_Int_Disable;

	GPIO_Init(GPIO0, &GPIO_InitType);

	NVIC_InitTypeDef InitTypeDef_NVIC;    //Define Interrupt

	InitTypeDef_NVIC.NVIC_IRQChannel = I2C_IRQn;
	  InitTypeDef_NVIC.NVIC_IRQChannelPreemptionPriority = 1;
	  InitTypeDef_NVIC.NVIC_IRQChannelSubPriority = 1;
	  InitTypeDef_NVIC.NVIC_IRQChannelCmd = ENABLE;
	  NVIC_Init(&InitTypeDef_NVIC);

	    I2C_InterruptOpen(I2C);

	I2C_Init(I2C, 100);

}

int code_pin(int pin_num) {
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

int convert(int value) {
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

void Delay(__IO uint32_t nCount) //25M 1s = 8333000
{
	for (; nCount != 0; nCount--)
		;
}
