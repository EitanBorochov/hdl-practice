module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic in, out;

    int num_tests = 0;
    int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // testing 100 random cases
        for (int i = 0; i < 100; i++) begin
            in = 1'($urandom);
            #(DELAY) // need time to propagate. 
            if (!(in != out)) begin
                $display("TEST FAILED: in: %b | out: %b", in, out);
            end else begin
                num_passed++;
            end

            num_tests++;
        end

        $display("%d/%d Tests Passed!", num_passed, num_tests);
        $finish;
    end
endmodule
