module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic o0, o1, o2;
    logic [2:0] vec, outv;

    int num_tests = 0;
    int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    // using task here because its a little more complex
    task apply_inputs(logic [2:0] in_vec, expected_outv,
                    logic expected_o0, expected_o1, expected_o2);
        vec = in_vec;
        #(DELAY);

        if (!(o0 == expected_o0 && o1 == expected_o1 && o2 == expected_o2 && expected_outv == outv)) begin
            $display("TEST FAILED: vec: %b | o0: %b | o1: %b | o2: %b | outv: %b", 
                    vec, o0, o1, o2, outv);
        end else begin
            num_passed ++;
        end

        num_tests ++;
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // testing all cases
        for (int i = 0; i < 8; i++) begin
            apply_inputs(i[2:0], i[2:0], i[0], i[1], i[2]);
        end

        $display("%1d/%1d Tests Passed!", num_passed, num_tests);
        $finish;
    end
endmodule
