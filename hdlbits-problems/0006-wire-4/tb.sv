module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic a, b, c; 
    logic w, x, y, z;

    int num_tests = 0;
    int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // testing 100 random cases
        for (int i = 0; i < 100; i++) begin
            {a, b, c} = 3'($urandom);
            if (!(w == a && x == b && y == b && z == c)) begin
                $display("TEST FAILED: a: %b | b: %b | c: %b | w: %b | x: %b | y: %b | z: %b", a, b, c, w, x, y ,z);
            end else begin
                num_passed++;
            end

            num_tests++;
        end

        $display("%d/%d Tests Passed!", num_passed, num_tests);
        $finish;
    end
endmodule
