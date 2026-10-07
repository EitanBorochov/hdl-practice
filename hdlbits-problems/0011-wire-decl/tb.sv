module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic a, b, c, d;
    logic out, out_n;

    int num_tests = 0;
    int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    // using task here because its a little more complex
    task apply_inputs(logic in_a, in_b, in_c, in_d, expected_out, expected_out_n);
        a = in_a;
        b = in_b;
        c = in_c;
        d = in_d;
        #(DELAY);

        if (!(expected_out == out && expected_out_n == out_n)) begin
            $display("TEST FAILED: a: %b | b: %b | c: %b | c: %b | out: %b | out_n: %b", 
                    a, b, c, d, out, out_n);
        end else begin
            num_passed ++;
        end

        num_tests ++;
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // testing all cases
        for (int i = 0; i < 16; i++) begin
            apply_inputs(i[0], i[1], i[2], i[3], 
                        (i[0] && i[1] || i[2] && i[3]), 
                        !(i[0] && i[1] || i[2] && i[3]));
        end

        $display("%2d/%2d Tests Passed!", num_passed, num_tests);
        $finish;
    end
endmodule
