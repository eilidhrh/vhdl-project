## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 

 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDs[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDs[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDs[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDs[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[3]}]
set_property PACKAGE_PIN W18 [get_ports {LEDs[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[4]}]
set_property PACKAGE_PIN U15 [get_ports {LEDs[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[5]}]
set_property PACKAGE_PIN U14 [get_ports {LEDs[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[6]}]
set_property PACKAGE_PIN V14 [get_ports {LEDs[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[7]}]
set_property PACKAGE_PIN V13 [get_ports {LEDs[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[8]}]
set_property PACKAGE_PIN V3 [get_ports {LEDs[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[9]}]
set_property PACKAGE_PIN W3 [get_ports {LEDs[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[10]}]
set_property PACKAGE_PIN U3 [get_ports {LEDs[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[11]}]
set_property PACKAGE_PIN P3 [get_ports {LEDs[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[12]}]
set_property PACKAGE_PIN N3 [get_ports {LEDs[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[13]}]
set_property PACKAGE_PIN P1 [get_ports {LEDs[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[14]}]
set_property PACKAGE_PIN L1 [get_ports {LEDs[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[15]}]
	
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {segments[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN W6 [get_ports {segments[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN U8 [get_ports {segments[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN V8 [get_ports {segments[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN U5 [get_ports {segments[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN V5 [get_ports {segments[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN U7 [get_ports {segments[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]


##Buttons
#set_property PACKAGE_PIN U18 [get_ports btnC]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnC]
set_property PACKAGE_PIN T18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN W19 [get_ports p1btn]						
	set_property IOSTANDARD LVCMOS33 [get_ports p1btn]
set_property PACKAGE_PIN T17 [get_ports p2btn]						
	set_property IOSTANDARD LVCMOS33 [get_ports p2btn]
#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 



