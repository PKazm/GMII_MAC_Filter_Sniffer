# Written by Synplify Pro version mapact, Build 2737R. Synopsys Run ID: sid1591681307 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {GMII_MAC_Filter_Sniffer|PCLK} [get_ports {PCLK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {GMII_MAC_Filter_Sniffer|RXCLK} [get_ports {RXCLK}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_0 [list GMII_MAC_Filter_Sniffer|PCLK]
set Inferred_clkgroup_1 [list GMII_MAC_Filter_Sniffer|RXCLK]
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_1


# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

