set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\FCCC_C0\FCCC_C0_0\FCCC_C0_FCCC_C0_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\FCCC_C0\FCCC_C0.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\OSC_C0\OSC_C0.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\hdl\block_test.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\test_sd\test_sd.vhd}
set_top_level {test_sd}
map_netlist
check_constraints {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\designer\test_sd\synthesis.fdc}
