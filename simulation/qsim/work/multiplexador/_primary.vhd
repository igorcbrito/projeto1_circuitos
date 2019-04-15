library verilog;
use verilog.vl_types.all;
entity multiplexador is
    port(
        x0              : in     vl_logic_vector(3 downto 0);
        x1              : in     vl_logic_vector(3 downto 0);
        SMult           : in     vl_logic_vector(2 downto 0);
        ctrl            : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector(6 downto 0);
        desliga         : in     vl_logic;
        CoLed           : out    vl_logic;
        ySoma_aux       : out    vl_logic_vector(3 downto 0)
    );
end multiplexador;
