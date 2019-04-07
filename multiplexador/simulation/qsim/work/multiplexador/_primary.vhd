library verilog;
use verilog.vl_types.all;
entity multiplexador is
    port(
        x0              : in     vl_logic;
        x1              : in     vl_logic;
        x2              : in     vl_logic;
        x3              : in     vl_logic;
        s1              : in     vl_logic;
        s0              : in     vl_logic;
        y               : out    vl_logic
    );
end multiplexador;
