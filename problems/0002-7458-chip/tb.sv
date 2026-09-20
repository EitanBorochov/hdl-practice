module tb;
    localparam int DELAY = 10;

    logic p1a, p1b, p1c, p1d, p1e, p1f; //inputs of 1
    logic p2a, p2b, p2c, p2d; //inputs of 2
    logic p1y, p2y; //outputs

	int num_tests = 0;
	int num_passed = 0;

    // Instantiate DUT
    top_module DUT(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Check all combinations for p1y
        for (int i = 0; i < 64; i++) begin
			num_tests++;

            {p1a, p1b, p1c, p1d, p1e, p1f} = i[5:0]; //applying inputs
            #DELAY //propegate

			// Check test
			if (p1y === ((p1a && p1b && p1c) || (p1d && p1e && p1f))) begin
				num_passed++;
			end else begin
				$display("Test %d failed. Inputs: %b. p1y: %b\n", num_tests, i[5:0], p1y);
			end
        end

		// Check all combinations of p2y
		for (int i = 0; i < 16; i++) begin
			num_tests++;

            {p2a, p2b, p2c, p2d} = i[3:0]; //applying inputs
            #DELAY //propegate

			// Check test
			if (p2y === ((p2a && p2b) || (p2c && p2d))) begin
				num_passed++;
			end else begin
				$display("Test %d failed. Inputs: %b. p2y: %b\n", num_tests, i[3:0], p2y);
			end
        end

		$display("%2d/%2d tests passed\n", num_passed, num_tests);
        $finish;
    end
endmodule
