library verilog;
use verilog.vl_types.all;
entity tratamentoSubtracao_vlg_sample_tst is
    port(
        x0              : in     vl_logic_vector(3 downto 0);
        x1              : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end tratamentoSubtracao_vlg_sample_tst;
