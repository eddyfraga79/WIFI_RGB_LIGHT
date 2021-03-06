EESchema Schematic File Version 4
LIBS:WIFI_RGB_PCB-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "WIFI RGB PCB"
Date "2021-08-15"
Rev "1"
Comp "EDtronics"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_US R1
U 1 1 6118690F
P 6300 1900
F 0 "R1" H 6150 2050 50  0000 L CNN
F 1 "100" V 6200 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6340 1890 50  0001 C CNN
F 3 "~" H 6300 1900 50  0001 C CNN
	1    6300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2450 6300 3200
$Comp
L Connector_Generic:Conn_01x15 J2
U 1 1 61187985
P 3700 5100
F 0 "J2" H 3700 4300 50  0000 C CNN
F 1 "Conn_01x15" H 3620 5926 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 3700 5100 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/sullins-connector-solutions/PPTC151LFBN-RC/810153" H 3700 5100 50  0001 C CNN
	1    3700 5100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 61187E5E
P 5200 4350
F 0 "#PWR04" H 5200 4100 50  0001 C CNN
F 1 "GND" H 5205 4177 50  0001 C CNN
F 2 "" H 5200 4350 50  0001 C CNN
F 3 "" H 5200 4350 50  0001 C CNN
	1    5200 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61187E92
P 5700 4350
F 0 "#PWR06" H 5700 4100 50  0001 C CNN
F 1 "GND" H 5705 4177 50  0001 C CNN
F 2 "" H 5700 4350 50  0001 C CNN
F 3 "" H 5700 4350 50  0001 C CNN
	1    5700 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 61187F1C
P 6200 4350
F 0 "#PWR07" H 6200 4100 50  0001 C CNN
F 1 "GND" H 6205 4177 50  0001 C CNN
F 2 "" H 6200 4350 50  0001 C CNN
F 3 "" H 6200 4350 50  0001 C CNN
	1    6200 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2650 7000 2450
Wire Wire Line
	7200 3200 7200 2450
Wire Wire Line
	6500 3750 6500 2450
Wire Wire Line
	7900 2650 7900 2450
Wire Wire Line
	8100 3200 8100 2450
Wire Wire Line
	8300 3750 8300 2450
$Comp
L power:+5V #PWR02
U 1 1 61189D4A
P 2000 5550
F 0 "#PWR02" H 2000 5400 50  0001 C CNN
F 1 "+5V" H 2000 5700 50  0000 C CNN
F 2 "" H 2000 5550 50  0001 C CNN
F 3 "" H 2000 5550 50  0001 C CNN
	1    2000 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6118A199
P 2350 5700
F 0 "#PWR01" H 2350 5450 50  0001 C CNN
F 1 "GND" H 2355 5527 50  0001 C CNN
F 2 "" H 2350 5700 50  0001 C CNN
F 3 "" H 2350 5700 50  0001 C CNN
	1    2350 5700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6118A6B9
P 4200 6150
F 0 "#PWR03" H 4200 5900 50  0001 C CNN
F 1 "GND" H 4205 5977 50  0001 C CNN
F 2 "" H 4200 6150 50  0001 C CNN
F 3 "" H 4200 6150 50  0001 C CNN
	1    4200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6150 4200 5700
Wire Wire Line
	4200 5700 3900 5700
Wire Wire Line
	8800 2650 8800 2450
Wire Wire Line
	9000 3200 9000 2450
Wire Wire Line
	9200 3750 9200 2450
Connection ~ 7000 2650
Connection ~ 7200 3200
Wire Wire Line
	7200 3200 8100 3200
Connection ~ 7900 2650
Connection ~ 8100 3200
Connection ~ 8300 3750
Wire Wire Line
	7900 2650 8800 2650
Wire Wire Line
	8100 3200 9000 3200
Wire Wire Line
	8300 3750 9200 3750
Wire Notes Line
	2550 4100 4100 4100
Wire Notes Line
	4100 4100 4100 6100
Wire Notes Line
	4100 6100 2550 6100
Wire Notes Line
	2550 6100 2550 4100
NoConn ~ 3900 5800
NoConn ~ 2750 5600
NoConn ~ 2750 5500
NoConn ~ 2750 5400
NoConn ~ 2750 5200
NoConn ~ 2750 5100
NoConn ~ 2750 5000
NoConn ~ 2750 4900
NoConn ~ 2750 4800
NoConn ~ 2750 4700
NoConn ~ 2750 4600
NoConn ~ 2750 4500
Text Notes 3000 4100 0    50   ~ 0
ESP8266 module
$Comp
L Connector_Generic:Conn_01x15 J1
U 1 1 61187FD4
P 2950 5100
F 0 "J1" H 2900 4300 50  0000 L CNN
F 1 "Conn_01x15" H 3030 5051 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x15_P2.54mm_Vertical" H 2950 5100 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/sullins-connector-solutions/PPTC151LFBN-RC/810153" H 2950 5100 50  0001 C CNN
	1    2950 5100
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 611A3A04
P 2350 5300
F 0 "#PWR012" H 2350 5050 50  0001 C CNN
F 1 "GND" H 2355 5127 50  0001 C CNN
F 2 "" H 2350 5300 50  0001 C CNN
F 3 "" H 2350 5300 50  0001 C CNN
	1    2350 5300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 611A48B8
P 2000 6250
F 0 "#PWR011" H 2000 6000 50  0001 C CNN
F 1 "GND" H 2005 6077 50  0001 C CNN
F 2 "" H 2000 6250 50  0001 C CNN
F 3 "" H 2000 6250 50  0001 C CNN
	1    2000 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 6050 2000 5800
Wire Wire Line
	2000 5800 2750 5800
Connection ~ 2000 5800
Wire Wire Line
	2000 5800 2000 5550
Wire Wire Line
	2750 5300 2350 5300
Wire Wire Line
	2750 5700 2350 5700
Wire Wire Line
	6300 3200 7200 3200
Wire Wire Line
	6100 2650 7000 2650
Wire Wire Line
	6100 2650 6100 2450
Connection ~ 6300 3200
Wire Wire Line
	6100 2650 5200 2650
Connection ~ 6100 2650
Text Label 4250 4400 2    50   ~ 0
D0
Text Label 4250 4600 2    50   ~ 0
D2
Text Label 4250 4500 2    50   ~ 0
D1
Wire Wire Line
	5900 4150 5900 4600
Wire Wire Line
	5700 3200 6300 3200
Wire Wire Line
	5400 4500 5400 4150
Wire Wire Line
	6500 3750 6200 3750
Wire Wire Line
	6200 3750 6200 3950
Connection ~ 6500 3750
Wire Wire Line
	5700 3200 5700 3950
Wire Wire Line
	4900 4400 4900 4150
Wire Wire Line
	5200 2650 5200 3950
Wire Wire Line
	3900 4600 5900 4600
Wire Wire Line
	3900 4500 5400 4500
Wire Wire Line
	3900 4400 4900 4400
$Comp
L Device:LED_RGB D1
U 1 1 6119BD29
P 6300 2250
F 0 "D1" V 6346 1920 50  0000 R CNN
F 1 "LED_RGB" V 6255 1920 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812_PLCC6_5.0x5.0mm_P1.6mm" H 6300 2200 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/american-bright-optoelectronics-corporation/BL-HBXJXGX32L/9678124" H 6300 2200 50  0001 C CNN
	1    6300 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_RGB D2
U 1 1 6119BDDB
P 7200 2250
F 0 "D2" V 7246 1920 50  0000 R CNN
F 1 "LED_RGB" V 7155 1920 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812_PLCC6_5.0x5.0mm_P1.6mm" H 7200 2200 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/american-bright-optoelectronics-corporation/BL-HBXJXGX32L/9678124" H 7200 2200 50  0001 C CNN
	1    7200 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_RGB D3
U 1 1 6119BE19
P 8100 2250
F 0 "D3" V 8146 1920 50  0000 R CNN
F 1 "LED_RGB" V 8055 1920 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812_PLCC6_5.0x5.0mm_P1.6mm" H 8100 2200 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/american-bright-optoelectronics-corporation/BL-HBXJXGX32L/9678124" H 8100 2200 50  0001 C CNN
	1    8100 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_RGB D4
U 1 1 6119BE67
P 9000 2250
F 0 "D4" V 9046 1920 50  0000 R CNN
F 1 "LED_RGB" V 8955 1920 50  0000 R CNN
F 2 "LED_SMD:LED_WS2812_PLCC6_5.0x5.0mm_P1.6mm" H 9000 2200 50  0001 C CNN
F 3 "https://www.digikey.ca/en/products/detail/american-bright-optoelectronics-corporation/BL-HBXJXGX32L/9678124" H 9000 2200 50  0001 C CNN
	1    9000 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 6119E878
P 6100 1900
F 0 "R2" H 5950 2050 50  0000 L CNN
F 1 "59" V 6000 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6140 1890 50  0001 C CNN
F 3 "~" H 6100 1900 50  0001 C CNN
	1    6100 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 6119E87F
P 6300 1550
F 0 "#PWR05" H 6300 1400 50  0001 C CNN
F 1 "+5V" H 6315 1723 50  0000 C CNN
F 2 "" H 6300 1550 50  0001 C CNN
F 3 "" H 6300 1550 50  0001 C CNN
	1    6300 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1750 6300 1600
$Comp
L Device:R_US R3
U 1 1 6119F16B
P 6500 1900
F 0 "R3" H 6350 2050 50  0000 L CNN
F 1 "59" V 6400 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6540 1890 50  0001 C CNN
F 3 "~" H 6500 1900 50  0001 C CNN
	1    6500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1750 6500 1600
Wire Wire Line
	6500 1600 6300 1600
Connection ~ 6300 1600
Wire Wire Line
	6300 1600 6300 1550
Wire Wire Line
	6300 1600 6100 1600
Wire Wire Line
	6100 1600 6100 1750
$Comp
L Device:R_US R4
U 1 1 611A19F1
P 7200 1900
F 0 "R4" H 7050 2050 50  0000 L CNN
F 1 "100" V 7100 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7240 1890 50  0001 C CNN
F 3 "~" H 7200 1900 50  0001 C CNN
	1    7200 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R5
U 1 1 611A19F8
P 7000 1900
F 0 "R5" H 6850 2050 50  0000 L CNN
F 1 "59" V 6900 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7040 1890 50  0001 C CNN
F 3 "~" H 7000 1900 50  0001 C CNN
	1    7000 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 611A19FF
P 7200 1550
F 0 "#PWR08" H 7200 1400 50  0001 C CNN
F 1 "+5V" H 7215 1723 50  0000 C CNN
F 2 "" H 7200 1550 50  0001 C CNN
F 3 "" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1750 7200 1600
$Comp
L Device:R_US R6
U 1 1 611A1A06
P 7400 1900
F 0 "R6" H 7250 2050 50  0000 L CNN
F 1 "59" V 7300 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7440 1890 50  0001 C CNN
F 3 "~" H 7400 1900 50  0001 C CNN
	1    7400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1750 7400 1600
Wire Wire Line
	7400 1600 7200 1600
Connection ~ 7200 1600
Wire Wire Line
	7200 1600 7200 1550
Wire Wire Line
	7200 1600 7000 1600
Wire Wire Line
	7000 1600 7000 1750
$Comp
L Device:R_US R7
U 1 1 611A2BA8
P 8100 1900
F 0 "R7" H 7950 2050 50  0000 L CNN
F 1 "100" V 8000 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8140 1890 50  0001 C CNN
F 3 "~" H 8100 1900 50  0001 C CNN
	1    8100 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R8
U 1 1 611A2BAF
P 7900 1900
F 0 "R8" H 7750 2050 50  0000 L CNN
F 1 "59" V 7800 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7940 1890 50  0001 C CNN
F 3 "~" H 7900 1900 50  0001 C CNN
	1    7900 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 611A2BB6
P 8100 1550
F 0 "#PWR09" H 8100 1400 50  0001 C CNN
F 1 "+5V" H 8115 1723 50  0000 C CNN
F 2 "" H 8100 1550 50  0001 C CNN
F 3 "" H 8100 1550 50  0001 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1750 8100 1600
$Comp
L Device:R_US R9
U 1 1 611A2BBD
P 8300 1900
F 0 "R9" H 8150 2050 50  0000 L CNN
F 1 "59" V 8200 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8340 1890 50  0001 C CNN
F 3 "~" H 8300 1900 50  0001 C CNN
	1    8300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1750 8300 1600
Wire Wire Line
	8300 1600 8100 1600
Connection ~ 8100 1600
Wire Wire Line
	8100 1600 8100 1550
Wire Wire Line
	8100 1600 7900 1600
Wire Wire Line
	7900 1600 7900 1750
$Comp
L Device:R_US R10
U 1 1 611A3BB7
P 9000 1900
F 0 "R10" H 8850 2050 50  0000 L CNN
F 1 "100" V 8900 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9040 1890 50  0001 C CNN
F 3 "~" H 9000 1900 50  0001 C CNN
	1    9000 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R11
U 1 1 611A3BBE
P 8800 1900
F 0 "R11" H 8650 2050 50  0000 L CNN
F 1 "59" V 8700 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8840 1890 50  0001 C CNN
F 3 "~" H 8800 1900 50  0001 C CNN
	1    8800 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 611A3BC5
P 9000 1550
F 0 "#PWR010" H 9000 1400 50  0001 C CNN
F 1 "+5V" H 9015 1723 50  0000 C CNN
F 2 "" H 9000 1550 50  0001 C CNN
F 3 "" H 9000 1550 50  0001 C CNN
	1    9000 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1750 9000 1600
$Comp
L Device:R_US R12
U 1 1 611A3BCC
P 9200 1900
F 0 "R12" H 9050 2050 50  0000 L CNN
F 1 "59" V 9100 1800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9240 1890 50  0001 C CNN
F 3 "~" H 9200 1900 50  0001 C CNN
	1    9200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1750 9200 1600
Wire Wire Line
	9200 1600 9000 1600
Connection ~ 9000 1600
Wire Wire Line
	9000 1600 9000 1550
Wire Wire Line
	9000 1600 8800 1600
Wire Wire Line
	8800 1600 8800 1750
$Comp
L Device:C_Small C1
U 1 1 611A5D67
P 2000 6150
F 0 "C1" H 2092 6196 50  0000 L CNN
F 1 "10uF" H 2092 6105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2000 6150 50  0001 C CNN
F 3 "~" H 2000 6150 50  0001 C CNN
	1    2000 6150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 611A6249
P 4450 4700
F 0 "TP2" V 4450 4888 50  0000 L CNN
F 1 "TestPoint" V 4495 4888 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 4700 50  0001 C CNN
F 3 "~" H 4650 4700 50  0001 C CNN
	1    4450 4700
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 611A656A
P 4450 4800
F 0 "TP3" V 4450 4988 50  0000 L CNN
F 1 "TestPoint" V 4495 4988 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 4800 50  0001 C CNN
F 3 "~" H 4650 4800 50  0001 C CNN
	1    4450 4800
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 611A65AC
P 4450 4900
F 0 "TP4" V 4450 5088 50  0000 L CNN
F 1 "TestPoint" V 4495 5088 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 4900 50  0001 C CNN
F 3 "~" H 4650 4900 50  0001 C CNN
	1    4450 4900
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 611A65F0
P 4450 5000
F 0 "TP5" V 4450 5188 50  0000 L CNN
F 1 "TestPoint" V 4495 5188 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5000 50  0001 C CNN
F 3 "~" H 4650 5000 50  0001 C CNN
	1    4450 5000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 611A6636
P 4450 5100
F 0 "TP6" V 4450 5288 50  0000 L CNN
F 1 "TestPoint" V 4495 5288 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5100 50  0001 C CNN
F 3 "~" H 4650 5100 50  0001 C CNN
	1    4450 5100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 611A6699
P 4450 5200
F 0 "TP7" V 4450 5388 50  0000 L CNN
F 1 "TestPoint" V 4495 5388 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5200 50  0001 C CNN
F 3 "~" H 4650 5200 50  0001 C CNN
	1    4450 5200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 611A66E7
P 4450 5300
F 0 "TP8" V 4450 5488 50  0000 L CNN
F 1 "TestPoint" V 4495 5488 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5300 50  0001 C CNN
F 3 "~" H 4650 5300 50  0001 C CNN
	1    4450 5300
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 611B9EC1
P 4450 5400
F 0 "TP9" V 4450 5588 50  0000 L CNN
F 1 "TestPoint" V 4495 5588 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5400 50  0001 C CNN
F 3 "~" H 4650 5400 50  0001 C CNN
	1    4450 5400
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP10
U 1 1 611B9F0D
P 4450 5500
F 0 "TP10" V 4450 5688 50  0000 L CNN
F 1 "TestPoint" V 4495 5688 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5500 50  0001 C CNN
F 3 "~" H 4650 5500 50  0001 C CNN
	1    4450 5500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 611B9F5B
P 4450 5600
F 0 "TP11" V 4450 5788 50  0000 L CNN
F 1 "TestPoint" V 4495 5788 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 4650 5600 50  0001 C CNN
F 3 "~" H 4650 5600 50  0001 C CNN
	1    4450 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 4700 3900 4700
Wire Wire Line
	4450 4800 3900 4800
Wire Wire Line
	4450 4900 3900 4900
Wire Wire Line
	4450 5000 3900 5000
Wire Wire Line
	4450 5100 3900 5100
Wire Wire Line
	4450 5200 3900 5200
Wire Wire Line
	4450 5300 3900 5300
Wire Wire Line
	4450 5400 3900 5400
Wire Wire Line
	4450 5500 3900 5500
Wire Wire Line
	4450 5600 3900 5600
Text Label 4150 4700 0    50   ~ 0
D3
Text Label 4150 4800 0    50   ~ 0
D4
Text Label 4150 4900 0    50   ~ 0
3V3
Text Label 4150 5000 0    50   ~ 0
GND
Text Label 4150 5100 0    50   ~ 0
D5
Text Label 4150 5200 0    50   ~ 0
D6
Text Label 4150 5300 0    50   ~ 0
D7
Text Label 4150 5400 0    50   ~ 0
D8
Text Label 4150 5500 0    50   ~ 0
RX
Text Label 4150 5600 0    50   ~ 0
TX
$Comp
L Connector:TestPoint TP1
U 1 1 611C8813
P 2200 4400
F 0 "TP1" V 2200 4588 50  0000 L CNN
F 1 "TestPoint" V 2245 4588 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.5x2.5mm_Drill1.2mm" H 2400 4400 50  0001 C CNN
F 3 "~" H 2400 4400 50  0001 C CNN
	1    2200 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 4400 2750 4400
Text Label 2500 4400 2    50   ~ 0
ADC0
$Comp
L Device:Q_ZXMN3A03E6 Q1
U 1 1 611F9264
P 5100 4150
F 0 "Q1" H 5250 4300 50  0000 L CNN
F 1 "Q_ZXMN3A03E6" H 5305 4105 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 5300 4250 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ZXMN3A03E6.pdf" H 5100 4150 50  0001 C CNN
	1    5100 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_ZXMN3A03E6 Q2
U 1 1 611F94E1
P 5600 4150
F 0 "Q2" H 5750 4300 50  0000 L CNN
F 1 "Q_ZXMN3A03E6" H 5805 4105 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 5800 4250 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ZXMN3A03E6.pdf" H 5600 4150 50  0001 C CNN
	1    5600 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_ZXMN3A03E6 Q3
U 1 1 611F9541
P 6100 4150
F 0 "Q3" H 6250 4300 50  0000 L CNN
F 1 "Q_ZXMN3A03E6" H 6305 4105 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 6300 4250 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ZXMN3A03E6.pdf" H 6100 4150 50  0001 C CNN
	1    6100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3750 7400 3750
Wire Wire Line
	7000 2650 7900 2650
Wire Wire Line
	7400 2450 7400 3750
Connection ~ 7400 3750
Wire Wire Line
	7400 3750 8300 3750
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 611DCDA7
P 7800 5500
F 0 "H2" H 7900 5505 50  0000 L CNN
F 1 "MountingHole_Pad" H 7900 5460 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 7800 5500 50  0001 C CNN
F 3 "~" H 7800 5500 50  0001 C CNN
	1    7800 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 611DCE69
P 7800 5600
F 0 "#PWR014" H 7800 5350 50  0001 C CNN
F 1 "GND" H 7805 5427 50  0001 C CNN
F 2 "" H 7800 5600 50  0001 C CNN
F 3 "" H 7800 5600 50  0001 C CNN
	1    7800 5600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 611DE6E9
P 7250 5500
F 0 "H1" H 7350 5505 50  0000 L CNN
F 1 "MountingHole_Pad" H 7350 5460 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 7250 5500 50  0001 C CNN
F 3 "~" H 7250 5500 50  0001 C CNN
	1    7250 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 611DE6F0
P 7250 5600
F 0 "#PWR013" H 7250 5350 50  0001 C CNN
F 1 "GND" H 7255 5427 50  0001 C CNN
F 2 "" H 7250 5600 50  0001 C CNN
F 3 "" H 7250 5600 50  0001 C CNN
	1    7250 5600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 611DFEA5
P 8350 5500
F 0 "H3" H 8450 5505 50  0000 L CNN
F 1 "MountingHole_Pad" H 8450 5460 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 8350 5500 50  0001 C CNN
F 3 "~" H 8350 5500 50  0001 C CNN
	1    8350 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 611DFEAC
P 8350 5600
F 0 "#PWR015" H 8350 5350 50  0001 C CNN
F 1 "GND" H 8355 5427 50  0001 C CNN
F 2 "" H 8350 5600 50  0001 C CNN
F 3 "" H 8350 5600 50  0001 C CNN
	1    8350 5600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 611EFD5C
P 8900 5500
F 0 "H4" H 9000 5505 50  0000 L CNN
F 1 "MountingHole_Pad" H 9000 5460 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 8900 5500 50  0001 C CNN
F 3 "~" H 8900 5500 50  0001 C CNN
	1    8900 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 611EFD63
P 8900 5600
F 0 "#PWR016" H 8900 5350 50  0001 C CNN
F 1 "GND" H 8905 5427 50  0001 C CNN
F 2 "" H 8900 5600 50  0001 C CNN
F 3 "" H 8900 5600 50  0001 C CNN
	1    8900 5600
	1    0    0    -1  
$EndComp
Wire Notes Line
	7050 5300 9200 5300
Wire Notes Line
	9200 5300 9200 5800
Wire Notes Line
	9200 5800 7050 5800
Wire Notes Line
	7050 5800 7050 5300
Text Notes 7700 5300 0    50   ~ 0
PCB Mounting Holes
$EndSCHEMATC
