library verilog;
use verilog.vl_types.all;
entity dcfifo_fefifo is
    generic(
        lpm_widthad     : integer := 1;
        lpm_numwords    : integer := 1;
        underflow_checking: string  := "ON";
        overflow_checking: string  := "ON";
        lpm_mode        : string  := "READ"
    );
    port(
        usedw_in        : in     vl_logic_vector;
        wreq            : in     vl_logic;
        rreq            : in     vl_logic;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_widthad : constant is 1;
    attribute mti_svvh_generic_type of lpm_numwords : constant is 1;
    attribute mti_svvh_generic_type of underflow_checking : constant is 1;
    attribute mti_svvh_generic_type of overflow_checking : constant is 1;
    attribute mti_svvh_generic_type of lpm_mode : constant is 1;
end dcfifo_fefifo;
