# Counter on a 7 segments display

A simple minutes and seconds counter with a ~1 second delay.

## **PINS**

### **7 SEGMENTS DISPLAY:**

DIG1 -> DIG4 = 27 -> 30  
L1/L2 = 39  
A -> G = 40 -> 46

## **FPGA design**

### **IP CORE**

**gowin_osc**: generates a 62.5 MHz clock.  
**gowin_pllvr**: generates the ~3.072 Mhz clock used for RTC.  
**gowin_empu**: the interface between the cortexM3 and the fpga, the modules used are GPIO, usr_int 0 to 2 and RTC.

## **cortex M3**

**RTC**(Real Time Clock) takes a 3.072(???) Mhz clock and divides it to create a 1Hz 32bits counter.
