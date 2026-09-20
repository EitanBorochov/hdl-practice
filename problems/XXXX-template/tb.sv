module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    // TODO: Declare signals to connect to the device-under-test (DUT)

    // TODO: Declare TB-only variables

    // Instantiate DUT
    // TODO: connect to top_module signals
    top_module dut (.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // TODO: Write test here.

        $finish;
    end
endmodule
