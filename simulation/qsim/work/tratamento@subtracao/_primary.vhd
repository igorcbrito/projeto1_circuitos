library verilog;
use verilog.vl_types.all;
entity tratamentoSubtracao is
    port(
        x0              : in     vl_logic_vector(3 downto 0);
        x1              : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic_vector(3 downto 0);
        c               : out    vl_logic;
        ySub_teste      : out    vl_logic_vector(3 downto 0)
    );
end tratamentoSubtracao;
