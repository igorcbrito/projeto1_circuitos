library verilog;
use verilog.vl_types.all;
entity menorque is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        y               : out    vl_logic
    );
end menorque;
