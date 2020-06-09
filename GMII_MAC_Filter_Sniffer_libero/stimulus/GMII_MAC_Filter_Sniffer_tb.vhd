----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Mon May 25 21:06:24 2020
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: GMII_MAC_Filter_Sniffer_tb.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library modelsim_lib;
use modelsim_lib.util.all;

library osvvm;
use osvvm.RandomPkg.all;
use osvvm.CoveragePkg.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

library bitvis_vip_gmii;
use bitvis_vip_gmii.gmii_bfm_pkg.all;

library bitvis_vip_scoreboard;
use bitvis_vip_scoreboard.slv_sb_pkg.all;
use bitvis_vip_scoreboard.generic_sb_support_pkg.all;


entity testbench is
end testbench;

architecture behavioral of testbench is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ
    constant GMIICLK_PERIOD : time := 8 ns; -- 125MHZ

    signal SYSCLK : std_logic := '0';
    signal GMIICLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component GMII_MAC_Filter_Sniffer
        -- ports
        port( 
            RXCLK : in std_logic;
            PCLK : in std_logic;
            RSTn : in std_logic;

            -- APB connections
            -- These are in the PCLK domain
            PADDR   : in std_logic_vector(7 downto 0);
            PSEL    : in std_logic;
            PENABLE : in std_logic;
            PWRITE  : in std_logic;
            PWDATA  : in std_logic_vector(31 downto 0);
            PREADY  : out std_logic;
            PRDATA  : out std_logic_vector(31 downto 0);
            PSLVERR : out std_logic;

            --INT : out std_logic;
            -- APB connections
            
            -- GMII connections
            -- These are in the GMIICLK domain
            GMII_RX_ER_i	: in std_logic;
            GMII_RX_ER_o	: out std_logic;
            GMII_RXD		: in std_logic_vector(7 downto 0);
            GMII_RX_DV		: in std_logic;
            -- GMII connections

            -- Direct data connections
            -- These are in the PCLK domain
            Data_o			: out std_logic_vector(15 downto 0);
            Data_o_Valid	: out std_logic
            -- Direct data connections
        );
    end component;

    --=========================================================================
    -- GMII_MAC_Filter_Sniffer_0 : GMII_MAC_Filter_Sniffer
    -- signals and constants (addresses)

    signal PADDR   : std_logic_vector(7 downto 0);
    signal PSEL    : std_logic;
    signal PENABLE : std_logic;
    signal PWRITE  : std_logic;
    signal PWDATA  : std_logic_vector(31 downto 0);
    signal PREADY  : std_logic;
    signal PRDATA  : std_logic_vector(31 downto 0);
    signal PSLVERR : std_logic;
    signal GMII_RX_ER_i : std_logic;
    signal GMII_RX_ER_o : std_logic;
    signal GMII_RXD	    : std_logic_vector(7 downto 0);
    signal GMII_RX_DV	: std_logic;
    signal Data_o		: std_logic_vector(15 downto 0);
    signal Data_o_Valid	: std_logic;

    constant APB_CTRL_ADDR      : std_logic_vector(7 downto 0) := "00" & X"0" & "00";
	constant APB_STAT_ADDR      : std_logic_vector(7 downto 0) := "00" & X"1" & "00";
	constant APB_MAC0_ADDR      : std_logic_vector(7 downto 0) := "00" & X"2" & "00";
	constant APB_MAC1_ADDR      : std_logic_vector(7 downto 0) := "00" & X"3" & "00";
	constant APB_IPAD_ADDR		: std_logic_vector(7 downto 0) := "00" & X"4" & "00";
	constant APB_PORT_ADDR		: std_logic_vector(7 downto 0) := "00" & X"5" & "00";
	constant APB_TRAP_CNT_ADDR	: std_logic_vector(7 downto 0) := "00" & X"6" & "00";
	constant APB_BLOCK_CNT_ADDR	: std_logic_vector(7 downto 0) := "00" & X"7" & "00";

    --=========================================================================
    -- UVVM BFM signals

    signal gmii_tx_if : t_gmii_tx_if;
    signal gmii_bfm_config : t_gmii_bfm_config;

    --=========================================================================
    -- UVVM Scoreboard signals

    shared variable v_fifo_sb : t_generic_sb;


    --=========================================================================
    -- OSVVM Coverage signals

    type fifo_queue_type is array (0 to 10000) of std_logic_vector(7 downto 0);
    signal test_fifo : fifo_queue_type := (others => (others => '0'));
    signal test_fifo_cnt : natural range 0 to 10000 := 0;

    --=========================================================================

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );
    GMIICLK <= not GMIICLK after (GMIICLK_PERIOD / 2.0 );
    gmii_tx_if.gtxclk <= GMIICLK;

    -- Instantiate Unit Under Test:  GMII_MAC_Filter_Sniffer
    GMII_MAC_Filter_Sniffer_0 : GMII_MAC_Filter_Sniffer
        -- port map
        port map( 
            RXCLK   => gmii_tx_if.gtxclk,
            PCLK    => SYSCLK,
            RSTn    => NSYSRESET,

            PADDR   => PADDR,
            PSEL    => PSEL,
            PENABLE => PENABLE,
            PWRITE  => PWRITE,
            PWDATA  => PWDATA,
            PREADY  => PREADY,
            PRDATA  => PRDATA,
            PSLVERR => PSLVERR,

            GMII_RX_ER_i	=> GMII_RX_ER_i,
            GMII_RX_ER_o	=> GMII_RX_ER_o,
            GMII_RXD		=> gmii_tx_if.txd,
            GMII_RX_DV		=> gmii_tx_if.txen,

            Data_o			=> Data_o,
            Data_o_Valid	=> Data_o_Valid
        );

    spy_process : process
    begin
        --init_signal_spy("FIFO_CDC_0/W_gray_out", "W_gray_out_spy", 1, -1);
        wait;
    end process;

    p_main : process
        variable RndBYTES : RandomPType;
        variable gmii_data_var : t_byte_array(0 to 1074 - 1) := (others => X"00");
    begin
        wait for 1 ns;

        RndBYTES.InitSeed(RndBYTES'instance_name);

        --v_fifo_sb.set_scope("SB FIFO");
        --v_fifo_sb.config(C_SB_CONFIG_DEFAULT, "Set config for SB FIFO");
        --v_fifo_sb.enable(VOID);

        gmii_bfm_config.clock_period <= GMIICLK_PERIOD;
        gmii_bfm_config.setup_time <= 1 ns;
        gmii_bfm_config.hold_time <= 1 ns;

        gmii_tx_if.txd      <= (gmii_tx_if.txd'range => '0');
        gmii_tx_if.txen     <= '0';
        gmii_tx_if.gtxclk    <= 'Z';

        --=====================================================================
        -- Initialize APB signals
        PADDR   <= (others => '0');
        PSEL    <= '0';
        PENABLE <= '0';
        PWRITE  <= '0';
        PWDATA  <= (others => '0');
        PREADY  <= 'Z';
        PRDATA  <= (others => 'Z');
        PSLVERR <= 'Z';

        --=====================================================================
        -- Build Ethernet Packet Header
        gmii_data_var(0 to 6)   := (others => X"AA");               -- phy: ethernet preamble
        gmii_data_var(7)        := X"AB";                           -- phy: ethernet start frame delimiter
        gmii_data_var(8 to 13)  := (others => X"22");               -- eth: MAC destination
        gmii_data_var(14 to 19) := (others => X"FF");               -- eth: MAC source
        gmii_data_var(20 to 21) := (X"08", X"00");                  -- eth: Ethertype
        gmii_data_var(22)       := X"FF";                           -- ipv4: Version & IHL
        gmii_data_var(23)       := X"FF";                           -- ipv4: DSCP & ECM
        gmii_data_var(24 to 25) := (X"04", X"1B");                  -- ipv4: Total Length
        gmii_data_var(26 to 27) := (X"00", X"01");                  -- ipv4: Identification
        gmii_data_var(28 to 29) := (X"00", X"00");                  -- ipv4: Flags & Fragment Offset
        gmii_data_var(30)       := X"80";                           -- ipv4: Time To Live
        gmii_data_var(31)       := X"11";                           -- ipv4: Protocol
        gmii_data_var(32 to 33) := (X"00", X"00");                  -- ipv4: Header Checksum
        gmii_data_var(34 to 37) := (X"FF", X"FF", X"FF", X"FF");    -- ipv4: Source IP Address
        gmii_data_var(38 to 41) := (X"64", X"64", X"64", X"C8");    -- ipv4: Destination IP Address
        gmii_data_var(42 to 43) := (X"DA", X"7A");                  -- udp: Source Port
        gmii_data_var(44 to 45) := (X"DA", X"7A");                  -- udp: Destination Port
        gmii_data_var(46 to 47) := (X"04", X"07");                  -- udp: Length
        gmii_data_var(48 to 49) := (X"00", X"00");                  -- udp: Checksum
        GMII_RX_ER_i <= '0';


        --=====================================================================
        -- Wait for system startup to complete
        if(NSYSRESET /= '1') then
            wait until (NSYSRESET = '1');
        end if;

        --=====================================================================
        -- send 1024 bytes of data over GMII to DUT
        -- DUT is not configured and should do nothing
        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
            --test_fifo(i - 50) <= gmii_data_var(i);
            --v_fifo_sb.add_expected(pad_sb_slv(gmii_data_var(i)), "Adding Expected GMII data");
        end loop;
        --test_fifo_cnt <= test_fifo_cnt + gmii_data_var'length - 50;
        gmii_write(gmii_data_var, "GMII write bytes", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);
        
        --=====================================================================
        -- configure DUT with APB writes

        PADDR   <= APB_CTRL_ADDR;
        PSEL    <= '1';
        PENABLE <= '1';
        PWRITE  <= '1';
        PWDATA  <= X"0000000" & "0001";
        
        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= (others => '0');
        PSEL    <= '0';
        PENABLE <= '0';
        PWRITE  <= '0';
        PWDATA  <= (others => '0');

        wait for (SYSCLK_PERIOD * 10);

        --=====================================================================
        -- send 1024 bytes of data over GMII to DUT
        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
            test_fifo(test_fifo_cnt + i - 50) <= gmii_data_var(i);
            --v_fifo_sb.add_expected(pad_sb_slv(gmii_data_var(i)), "Adding Expected GMII data");
        end loop;
        test_fifo_cnt <= test_fifo_cnt + gmii_data_var'length - 50;
        gmii_write(gmii_data_var, "GMII write bytes", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);

        --=====================================================================
        -- wait for ethernet packet to complete sending + 1 interpacket gap
        wait until (gmii_tx_if.txen = '0');
        wait for (GMIICLK_PERIOD * 12);

        --=====================================================================
        -- send 1024 bytes of data over GMII to DUT
        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
            test_fifo(test_fifo_cnt + i - 50) <= gmii_data_var(i);
            --v_fifo_sb.add_expected(pad_sb_slv(gmii_data_var(i)), "Adding Expected GMII data");
        end loop;
        test_fifo_cnt <= test_fifo_cnt + gmii_data_var'length - 50;
        gmii_write(gmii_data_var, "GMII write bytes2", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);

        --=====================================================================
        -- wait for ethernet packet to complete sending + 1 interpacket gap
        wait until (gmii_tx_if.txen = '0');
        wait for (GMIICLK_PERIOD * 12);

        --=====================================================================
        -- change ethernet header to direct to ARM core MSS (change UDP port)

        gmii_data_var(44 to 45) := (X"C0", X"DE");                  -- udp: Destination Port

        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
        end loop;
        gmii_write(gmii_data_var, "GMII write bytes2", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);

        --=====================================================================
        -- wait for ethernet packet to complete sending + 1 interpacket gap
        wait until (gmii_tx_if.txen = '0');
        wait for (GMIICLK_PERIOD * 12);

        --=====================================================================
        -- change ethernet header to direct to not the DUT (simulating random ethernet traffic)

        gmii_data_var(8 to 13)  := (others => X"01");               -- eth: MAC destination
        gmii_data_var(44 to 45) := (X"DA", X"7A");                  -- udp: Destination Port

        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
        end loop;
        gmii_write(gmii_data_var, "GMII write bytes2", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);

        --=====================================================================
        -- wait for ethernet packet to complete sending + 1 interpacket gap
        wait until (gmii_tx_if.txen = '0');
        wait for (GMIICLK_PERIOD * 12);

        --=====================================================================
        -- change DUT to expect different MAC address

        PADDR   <= APB_MAC0_ADDR;
        PSEL    <= '1';
        PENABLE <= '1';
        PWRITE  <= '1';
        PWDATA  <= X"11111111";
        
        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= (others => '0');
        PSEL    <= '0';
        PENABLE <= '0';
        PWRITE  <= '0';
        PWDATA  <= (others => '0');

        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= APB_MAC1_ADDR;
        PSEL    <= '1';
        PENABLE <= '1';
        PWRITE  <= '1';
        PWDATA  <= X"00001111";
        
        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= (others => '0');
        PSEL    <= '0';
        PENABLE <= '0';
        PWRITE  <= '0';
        PWDATA  <= (others => '0');

        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= APB_CTRL_ADDR;
        PSEL    <= '1';
        PENABLE <= '1';
        PWRITE  <= '1';
        PWDATA  <= X"0000000" & "0101";
        
        wait for (SYSCLK_PERIOD * 1);

        PADDR   <= (others => '0');
        PSEL    <= '0';
        PENABLE <= '0';
        PWRITE  <= '0';
        PWDATA  <= (others => '0');

        wait for (SYSCLK_PERIOD * 10);

        --=====================================================================
        -- send 1024 bytes of data over GMII to DUT
        gmii_data_var(8 to 13)  := (others => X"11");               -- eth: MAC destination
        gmii_data_var := (0 to 49 => gmii_data_var(0 to 49),others => X"00");
        for i in 50 to gmii_data_var'high loop
            gmii_data_var(i) := RndBYTES.Randslv(0, 255, 8);
            test_fifo(test_fifo_cnt + i - 50) <= gmii_data_var(i);
            --v_fifo_sb.add_expected(pad_sb_slv(gmii_data_var(i)), "Adding Expected GMII data");
        end loop;
        test_fifo_cnt <= test_fifo_cnt + gmii_data_var'length - 50;
        gmii_write(gmii_data_var, "GMII write bytes", gmii_tx_if, "GMII BFM", shared_msg_id_panel, gmii_bfm_config);

        --=====================================================================
        -- wait for ethernet packet to complete sending + 1 interpacket gap
        wait until (gmii_tx_if.txen = '0');
        wait for (GMIICLK_PERIOD * 12);

        wait;
    end process;




    p_GMIICLK : process
        variable RndBYTES : RandomPType;
    begin
        wait for 1 ns;

        RndBYTES.InitSeed(RndBYTES'instance_name);

        if(NSYSRESET /= '1') then
            wait until (NSYSRESET = '1');
        end if;

        wait;
    end process;

    p_PCLK : process
        variable test_fifo_cnt_var : natural := 0;
    begin

        test_fifo_cnt_var := 0;

        while(true) loop

            if(Data_o_Valid /= '1') then
                wait until (Data_o_Valid = '1');
                wait until (SYSCLK = '0');  -- falling edge
            end if;

            assert (test_fifo(test_fifo_cnt_var) & test_fifo(test_fifo_cnt_var + 1) = Data_o)
                report "Data Mismatch i = " & integer'image(test_fifo_cnt_var)
                severity error;

            check_value(Data_o, test_fifo(test_fifo_cnt_var) & test_fifo(test_fifo_cnt_var + 1), ERROR, "FIFO output check " & integer'image(test_fifo_cnt_var));

            test_fifo_cnt_var := test_fifo_cnt_var + 2;
            --v_fifo_sb.check_received(pad_sb_slv(Data_o(15 downto 8)), "Checking DUT output MSB");
            --v_fifo_sb.check_received(pad_sb_slv(Data_o(7 downto 0)), "Checking DUT output LSB");

            wait for (SYSCLK_PERIOD * 1);
        end loop;

        wait;
    end process;

end behavioral;

