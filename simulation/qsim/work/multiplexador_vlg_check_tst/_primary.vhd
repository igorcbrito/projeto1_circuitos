library verilog;
use verilog.vl_types.all;
entity multiplexador_vlg_check_tst is
    port(
        CoLed           : in     vl_logic;
        y               : in     vl_logic_vector(6 downto 0);
        ySoma_aux       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplexador_vlg_check_tst;
