module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic tb_clk;
    logic [7:0] tb_d;
    logic [7:0] tb_q;
    logic [7:0] temp_q;

    int num_tests;
    int num_passed;

    // Instantiate DUT
    top_module DUT(.clk(tb_clk), .d(tb_d), .q(tb_q));

    task apply_inputs(logic in_clk, logic [7:0] in_d, expected);
        tb_clk = in_clk;
        tb_d = in_d;
        #(DELAY);

        if (tb_q == expected) begin
            num_passed++;
        end else begin
            // adding bad bits to know which dff failed specifically. 
            $display("TEST FAILED | CLK: %b | D: %b | Expected: %b | Q: %b | Bad bits: %b",
                     tb_clk, tb_d, expected, tb_q, tb_q ^ expected);
        end

        num_tests++;
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Starting with both zeros
        tb_clk = 0;
        tb_d = 0;
        #(DELAY);
        tb_clk = 1;
        temp_q = 0;
        #(DELAY);
        
        // testing all 256 combinations separately
        for (int i = 0; i < 256; ++i) begin
            apply_inputs(0, i[7:0], temp_q);
            apply_inputs(1, i[7:0], i[7:0]);
            temp_q = i[7:0];
        end

        // testing random jumps
        for (int i = 0; i < 100; i++) begin
            logic [7:0] random;
            random = $urandom;
            apply_inputs(0, random[7:0], temp_q);
            apply_inputs(1, random[7:0], random[7:0]);
            temp_q = random;
        end

        $display("%1d/%1d Tests Passed!", num_passed, num_tests);
                
        $finish;
    end
endmodule
