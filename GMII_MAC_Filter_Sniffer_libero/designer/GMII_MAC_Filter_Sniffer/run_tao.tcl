set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_fwft.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_resetSync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\Actel\DirectCore\COREFIFO\2.7.105\rtl\vhdl\core\fifo_pkg.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_sync_scntr.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_sync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_NstagesSync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_grayToBinConv.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_async.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO_C0_COREFIFO_C0_0_USRAM_top.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO_C0_COREFIFO_C0_0_ram_wrapper.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\component\work\COREFIFO_C0\COREFIFO_C0.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\hdl\Ethernet_Package.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\hdl\GMII_MAC_Filter_Sniffer.vhd}
set_top_level {GMII_MAC_Filter_Sniffer}
map_netlist
check_constraints {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Github_Repos\GMII_MAC_Filter_Sniffer\GMII_MAC_Filter_Sniffer_libero\designer\GMII_MAC_Filter_Sniffer\synthesis.fdc}
