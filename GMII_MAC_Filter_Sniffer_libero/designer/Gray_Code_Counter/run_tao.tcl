set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\hdl\Gray_Code_package.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\hdl\Gray_Code_Counter.vhd}
set_top_level {Gray_Code_Counter}
map_netlist
check_constraints {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\designer\Gray_Code_Counter\synthesis.fdc}
