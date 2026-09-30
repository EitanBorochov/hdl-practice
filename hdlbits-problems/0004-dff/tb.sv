module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;

    logic tb_clk;
    logic tb_d;
    logic tb_q;
    logic temp_q;

    int num_tests;
    int num_passed;

    // Instantiate DUT
    top_module DUT(.clk(tb_clk), .d(tb_d), .q(tb_q));

    task apply_inputs(logic in_clk, in_d, expected);
        tb_clk = in_clk;
        tb_d = in_d;
        #(DELAY);

        if (tb_q == expected) begin
            num_passed++;
        end else begin
            $display("TEST FAILED | CLK: %b | D: %b | Expected: %b | Q: %b", tb_clk, tb_d, expected, tb_q);
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
        
        for (int i=0; i<4; ++i) begin
            apply_inputs(0, i[0], temp_q);
            apply_inputs(1, i[0], i[0]);
            temp_q = i[0];
        end

        $display("%1d/%1d Tests Passed!", num_passed, num_tests);
                
        $finish;
    end
endmodule
