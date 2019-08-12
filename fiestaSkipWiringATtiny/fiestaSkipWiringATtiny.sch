EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny45-20PU U1
U 1 1 5D49362F
P 5000 3600
F 0 "U1" H 4471 3646 50  0000 R CNN
F 1 "ATtiny45-20PU" H 4471 3555 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5000 3600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 5000 3600 50  0001 C CNN
	1    5000 3600
	1    0    0    -1  
$EndComp
$Comp
L Relay:FINDER-36.11-4301 K1
U 1 1 5D494C9D
P 7900 3400
F 0 "K1" H 8330 3446 50  0000 L CNN
F 1 "FINDER-36.11-4301" H 8330 3355 50  0000 L CNN
F 2 "Finder_36_Relay:Relay_SPDT_Finder_36.11" H 9170 3370 50  0001 C CNN
F 3 "http://gfinder.findernet.com/assets/Series/356/S36EN.pdf" H 7900 3400 50  0001 C CNN
	1    7900 3400
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE D1
U 1 1 5D496A83
P 7000 3400
F 0 "D1" V 7046 3272 50  0000 R CNN
F 1 "DIODE" V 6955 3272 50  0000 R CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 7000 3400 50  0001 C CNN
F 3 "~" H 7000 3400 50  0001 C CNN
	1    7000 3400
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 5D497464
P 7600 4500
F 0 "Q1" H 7791 4546 50  0000 L CNN
F 1 "BC547" H 7791 4455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7800 4425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7600 4500 50  0001 L CNN
	1    7600 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5D498345
P 7250 4500
F 0 "R1" V 7043 4500 50  0000 C CNN
F 1 "R" V 7134 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7180 4500 50  0001 C CNN
F 3 "~" H 7250 4500 50  0001 C CNN
	1    7250 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 4300 7700 3850
Wire Wire Line
	7000 3600 7000 3850
Wire Wire Line
	7000 3850 7700 3850
Connection ~ 7700 3850
Wire Wire Line
	7700 3850 7700 3700
$Comp
L power:GND #PWR010
U 1 1 5D498B08
P 7700 4700
F 0 "#PWR010" H 7700 4450 50  0001 C CNN
F 1 "GND" H 7705 4527 50  0000 C CNN
F 2 "" H 7700 4700 50  0001 C CNN
F 3 "" H 7700 4700 50  0001 C CNN
	1    7700 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5D498F06
P 7700 2750
F 0 "#PWR09" H 7700 2600 50  0001 C CNN
F 1 "+5V" H 7715 2923 50  0000 C CNN
F 2 "" H 7700 2750 50  0001 C CNN
F 3 "" H 7700 2750 50  0001 C CNN
	1    7700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2750 7700 2900
Wire Wire Line
	7000 3200 7000 2900
Wire Wire Line
	7000 2900 7700 2900
Connection ~ 7700 2900
Wire Wire Line
	7700 2900 7700 3100
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 5D499C68
P 9550 3300
F 0 "J6" H 9578 3276 50  0000 L CNN
F 1 "relay out" H 9578 3185 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 9550 3300 50  0001 C CNN
F 3 "~" H 9550 3300 50  0001 C CNN
	1    9550 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2950 8900 2950
Wire Wire Line
	8900 2950 8900 3300
Wire Wire Line
	8900 3300 9350 3300
Wire Wire Line
	8200 2950 8200 3100
Wire Wire Line
	8100 3700 8100 3800
Wire Wire Line
	8100 3800 9300 3800
Wire Wire Line
	9300 3800 9300 3400
Wire Wire Line
	9300 3400 9350 3400
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5D49AEB6
P 2450 3500
F 0 "J1" H 2558 3781 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2558 3690 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 2450 3500 50  0001 C CNN
F 3 "~" H 2450 3500 50  0001 C CNN
	1    2450 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5D49B71A
P 3150 3500
F 0 "J2" H 3258 3781 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3258 3690 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3150 3500 50  0001 C CNN
F 3 "~" H 3150 3500 50  0001 C CNN
	1    3150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3600 2750 3600
Wire Wire Line
	2750 3600 2750 4800
Wire Wire Line
	2750 4800 5600 4800
Wire Wire Line
	5600 4800 5600 3800
$Comp
L power:GND #PWR02
U 1 1 5D49C471
P 3350 3600
F 0 "#PWR02" H 3350 3350 50  0001 C CNN
F 1 "GND" H 3355 3427 50  0000 C CNN
F 2 "" H 3350 3600 50  0001 C CNN
F 3 "" H 3350 3600 50  0001 C CNN
	1    3350 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5D49C92D
P 3350 3400
F 0 "#PWR01" H 3350 3250 50  0001 C CNN
F 1 "+5V" V 3365 3528 50  0000 L CNN
F 2 "" H 3350 3400 50  0001 C CNN
F 3 "" H 3350 3400 50  0001 C CNN
	1    3350 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3500 4050 3500
Wire Wire Line
	4050 3500 4050 2600
Wire Wire Line
	4050 2600 5600 2600
Wire Wire Line
	5600 2600 5600 3300
Wire Wire Line
	2650 3400 2900 3400
Wire Wire Line
	2900 3400 2900 2500
Wire Wire Line
	2900 2500 5750 2500
Wire Wire Line
	5750 2500 5750 3400
Wire Wire Line
	5750 3400 5600 3400
Wire Wire Line
	2650 3500 3000 3500
Wire Wire Line
	3000 3500 3000 2250
Wire Wire Line
	3000 2250 5900 2250
Wire Wire Line
	5900 2250 5900 3400
Wire Wire Line
	5900 3500 5600 3500
$Comp
L power:GND #PWR04
U 1 1 5D4A0962
P 5000 4200
F 0 "#PWR04" H 5000 3950 50  0001 C CNN
F 1 "GND" H 5005 4027 50  0000 C CNN
F 2 "" H 5000 4200 50  0001 C CNN
F 3 "" H 5000 4200 50  0001 C CNN
	1    5000 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5D4A0F96
P 5000 3000
F 0 "#PWR03" H 5000 2850 50  0001 C CNN
F 1 "+5V" H 5015 3173 50  0000 C CNN
F 2 "" H 5000 3000 50  0001 C CNN
F 3 "" H 5000 3000 50  0001 C CNN
	1    5000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3700 5900 3700
Wire Wire Line
	5900 3700 5900 4500
Wire Wire Line
	5900 4500 7100 4500
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5D4A1F62
P 6450 3700
F 0 "J5" H 6422 3582 50  0000 R CNN
F 1 "steering buttons" H 6422 3673 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 6450 3700 50  0001 C CNN
F 3 "~" H 6450 3700 50  0001 C CNN
	1    6450 3700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5D4A3F79
P 6250 3700
F 0 "#PWR07" H 6250 3450 50  0001 C CNN
F 1 "GND" H 6255 3527 50  0000 C CNN
F 2 "" H 6250 3700 50  0001 C CNN
F 3 "" H 6250 3700 50  0001 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5D4A4109
P 5800 5450
F 0 "J3" H 5908 5631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5908 5540 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 5800 5450 50  0001 C CNN
F 3 "~" H 5800 5450 50  0001 C CNN
	1    5800 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5D4A4459
P 6000 5550
F 0 "#PWR05" H 6000 5300 50  0001 C CNN
F 1 "GND" H 6005 5377 50  0000 C CNN
F 2 "" H 6000 5550 50  0001 C CNN
F 3 "" H 6000 5550 50  0001 C CNN
	1    6000 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5D4A46DC
P 6350 5450
F 0 "#PWR08" H 6350 5300 50  0001 C CNN
F 1 "+5V" H 6365 5623 50  0000 C CNN
F 2 "" H 6350 5450 50  0001 C CNN
F 3 "" H 6350 5450 50  0001 C CNN
	1    6350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5450 6000 5450
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5D4A5587
P 6350 3300
F 0 "J4" H 6322 3182 50  0000 R CNN
F 1 "ARef VCC" H 6322 3273 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 6350 3300 50  0001 C CNN
F 3 "~" H 6350 3300 50  0001 C CNN
	1    6350 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	5600 3300 6150 3300
Connection ~ 5600 3300
$Comp
L power:+5V #PWR06
U 1 1 5D4A67C1
P 6150 3200
F 0 "#PWR06" H 6150 3050 50  0001 C CNN
F 1 "+5V" H 6165 3373 50  0000 C CNN
F 2 "" H 6150 3200 50  0001 C CNN
F 3 "" H 6150 3200 50  0001 C CNN
	1    6150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3600 6200 3600
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5D4B0220
P 6400 3500
F 0 "J7" H 6372 3382 50  0000 R CNN
F 1 "interrupt" H 6372 3473 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 6400 3500 50  0001 C CNN
F 3 "~" H 6400 3500 50  0001 C CNN
	1    6400 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 3500 6200 3600
Connection ~ 6200 3600
Wire Wire Line
	6200 3600 6250 3600
Wire Wire Line
	6200 3400 5900 3400
Connection ~ 5900 3400
Wire Wire Line
	5900 3400 5900 3500
$EndSCHEMATC
