################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../SYSTEM/system_gw1ns4c.c 

OBJS += \
./SYSTEM/system_gw1ns4c.o 

C_DEPS += \
./SYSTEM/system_gw1ns4c.d 


# Each subdirectory must supply rules for building sources it contributes
SYSTEM/%.o: ../SYSTEM/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"C:\Users\Mylan\Documents\TER\exemples\exemple_cortex\cortex\CORE" -I"C:\Users\Mylan\Documents\TER\exemples\exemple_cortex\cortex\PERIPHERAL\Includes" -I"C:\Users\Mylan\Documents\TER\exemples\exemple_cortex\cortex\SYSTEM" -I"C:\Users\Mylan\Documents\TER\exemples\exemple_cortex\cortex\USER" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


