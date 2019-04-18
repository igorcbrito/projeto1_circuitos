library verilog;
use verilog.vl_types.all;
entity tratamentoSubtracao_vlg_check_tst is
    port(
        c               : in     vl_logic;
        y               : in     vl_logic_vector(3 downto 0);
        ySub_teste      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end tratamentoSubtracao_vlg_check_tst;
