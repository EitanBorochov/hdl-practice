module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic [15:0] in;
    logic [7:0] out_hi, out_lo;

    logic [15:0] temp_in;

    int num_tests = 0;
    int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    // using task here because its a little more complex
    task apply_inputs(logic [15:0] in_in, logic [7:0] exp_out_hi, exp_out_lo);
        in = in_in;
        #(DELAY);

        if (!(exp_out_hi == out_hi && exp_out_lo == out_lo)) begin
            $display("TEST FAILED: in: %b | out_lo: %b | out_hi: %b", 
                    in, out_lo, out_hi);
        end else begin
            num_passed ++;
        end

        num_tests ++;
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // testing 200 random cases because there are 2^16 total cases.
        for (int i = 0; i < 200; i++) begin
            temp_in = $urandom;
            apply_inputs(temp_in, temp_in[15:8], temp_in[7:0]);
        end

        $display("%1d/%1d Tests Passed!", num_passed, num_tests);
        $finish;
    end
endmodule
