library IEEE;

use IEEE.std_logic_1164.all;

package APB_pkg is

    constant DAT_WIDTH : natural := 16;
    constant ADR_WIDTH : natural := 16;

    type apb_in is record
        PADDR   : std_logic_vector(ADR_WIDTH - 1 downto 0);
        PSEL    : std_logic;
        PENABLE : std_logic;
        PWRITE  : std_logic;
        PWDATA  : std_logic_vector(DAT_WIDTH - 1 downto 0);
    end record apb_in;

    type apb_out is record
        PREADY  : std_logic;
        PRDATA  : std_logic_vector(DAT_WIDTH - 1 downto 0);
        PSLVERR : std_logic;
    end record apb_out;

    --function f_read_adr(adr_to_check : in std_logic_vector)
    --    return std_logic;
    --
    --function f_write_adr(adr_to_check : in std_logic_vector)
    --    return std_logic;

end package APB_pkg;

package body APB_pkg is

    --function f_read_adr(adr_to_check : in std_logic_vector) return std_logic is
    --    variable read_adr_yes : std_logic;
    --begin
    --    if(adr_to_check = PADDR) then
    --        read_adr_yes := PSEL and PENABLE and not PWRITE;
    --    else
    --        read_adr_yes := '0';
    --    end if;
    --    return read_adr_yes;
    --end;
    --
    --function f_write_adr(adr_to_check : in std_logic_vector) return std_logic is
    --    variable write_adr_yes : std_logic;
    --begin
    --    if(adr_to_check = PADDR) then
    --        write_adr_yes := PSEL and PENABLE and PWRITE;
    --    else
    --        write_adr_yes := '0';
    --    end if;
    --    return write_adr_yes;
    --end;

end package body APB_pkg;