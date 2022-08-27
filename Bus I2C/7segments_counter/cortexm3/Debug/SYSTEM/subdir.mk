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
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"C:\Users\Sylvain\Documents\Gowin-Ministar-main\Gowin-Ministar-main\7segments_counter\cortexm3\CORE" -I"C:\Users\Sylvain\Documents\Gowin-Ministar-main\Gowin-Ministar-main\7segments_counter\cortexm3\PERIPHERAL\Includes" -I"C:\Users\Sylvain\Documents\Gowin-Ministar-main\Gowin-Ministar-main\7segments_counter\cortexm3\SYSTEM" -I"C:\Users\Sylvain\Documents\Gowin-Ministar-main\Gowin-Ministar-main\7segments_counter\cortexm3\USER" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


