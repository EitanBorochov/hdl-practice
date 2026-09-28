module tb;
    // A localparam is a constant value that exists only in this module
    localparam int DELAY = 10;
    
    // signals to connect to DUT
    logic a, b, sel;
    logic out;

    // tb only signals. Writing these for good practice.
    int num_tests = 0;
    int num_passed = 0;
    
    // Instantiate DUT
    top_module DUT (.*);

    task apply_inputs(logic in_a, in_b, in_sel, expected);
        a = in_a;
        b = in_b;
        sel = in_sel;
        #(DELAY);
        
        if (expected !== out) begin
            $display("FAILED: a=%b b=%b sel=%b | expected=%b out=%b", 
                    in_a, in_b, in_sel, expected, out);
        end else begin
            num_passed ++;
        end

        num_tests ++;
    endtask


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // This is a simple test but I am using a task for practice.
        for (int i = 0; i < 8; i++) begin
            apply_inputs(i[0], i[1], i[2], i[2] ? i[1] : i[0]);
        end

        $display("%1d/%1d Tests Passed!", num_passed, num_tests);
    
        $finish;
    end
endmodule
