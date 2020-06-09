quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "E:/Github_Repos/GMII_MAC_Filter_Sniffer/GMII_MAC_Filter_Sniffer_libero"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v12.4/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"
if {[file exists COREFIFO_LIB/_info]} {
   echo "INFO: Simulation library COREFIFO_LIB already exists"
} else {
   file delete -force COREFIFO_LIB 
   vlib COREFIFO_LIB
}
vmap COREFIFO_LIB "COREFIFO_LIB"
if {[file exists CORETIMER_LIB/_info]} {
   echo "INFO: Simulation library CORETIMER_LIB already exists"
} else {
   file delete -force CORETIMER_LIB 
   vlib CORETIMER_LIB
}
vmap CORETIMER_LIB "CORETIMER_LIB"

vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_fwft.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_resetSync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/Actel/DirectCore/COREFIFO/2.7.105/rtl/vhdl/core/fifo_pkg.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_sync_scntr.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_sync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_NstagesSync.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_grayToBinConv.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/corefifo_async.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO_C0_COREFIFO_C0_0_USRAM_top.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO_C0_COREFIFO_C0_0_ram_wrapper.vhd"
vcom -2008 -explicit  -work COREFIFO_LIB "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0_0/rtl/vhdl/core/COREFIFO.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/COREFIFO_C0/COREFIFO_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/APB_Package.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Ethernet_Package.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/GMII_MAC_Filter_Sniffer.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Gray_Code_package.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/GMII_MAC_Filter_Sniffer_tb.vhd"

vsim -L SmartFusion2 -L presynth -L COREFIFO_LIB -L CORETIMER_LIB  -t 10ps presynth.testbench
add wave /testbench/*
run .1ms
