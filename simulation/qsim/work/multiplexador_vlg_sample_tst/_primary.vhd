library verilog;
use verilog.vl_types.all;
entity multiplexador_vlg_sample_tst is
    port(
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        x0              : in     vl_logic;
        x1              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end multiplexador_vlg_sample_tst;
