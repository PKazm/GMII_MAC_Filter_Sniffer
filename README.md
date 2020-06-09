# GMII_MAC_Filter_Sniffer
 
This core will be used in the SF2_ETH_FFT project to lower ethernet packet latency.

This core intercepts ethernet frames sent from the PHY over GMII. These frames can be:
1. Filtered and blocked to reduce processing overhead on the ARM core
2. Passed through. The intention is to ignore command packets to be process by the ARM core
3. Trapped by this core with packet contents being passed through a CDC FIFO into the FPGA fabric. Intended for data packets that will be processed by logic in the FPGA fabric.

This core offloads extraneous ethernet packet filtering and incoming data formatting from the ARM core.
