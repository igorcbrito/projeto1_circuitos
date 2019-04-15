library verilog;
use verilog.vl_types.all;
entity multiplexador_vlg_sample_tst is
    port(
        ctrl            : in     vl_logic_vector(1 downto 0);
        desliga         : in     vl_logic;
        SMult           : in     vl_logic_vector(2 downto 0);
        x0              : in     vl_logic_vector(3 downto 0);
        x1              : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end multiplexador_vlg_sample_tst;
