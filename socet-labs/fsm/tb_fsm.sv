module tb_fsm;
    
    /*
    * SystemVerilog allows the use of custom datatypes in both
    * synthesizable RTL code and test code. Below we define a
    * test vector type that we will use in our tasks.
    */
    typedef struct {
        int test_number; // Number of the test
        logic [7:0] data_stream; // Input 8-bit word
        logic expected_output; // FSM output expected after the 8-bit word is received
    } TestVector;

    logic CLK = 0, nRST;
    logic tb_data, tb_accept;
    int test_counter;   // counter for how many tests have been generated
    int current_test;   // set this variable to display the currently-executing test in the waveform window
    TestVector tests[]; // Declare a dynamically sized array to hold the test vectors


    // Clock generation
    always #(10) CLK++;

    
    // TODO: Instantiate the FSM module - Done
    fsm fsm (
        .CLK(CLK),
        .nRST(nRST),
        .data(tb_data),
        .accept(tb_accept)
    );
    
    /*
    *  A task acts like a function, or a macro,
    *  to allow parameterizable code reuse in the
    *  testbench. SystemVerilog has both tasks and
    *  functions. The main difference is: tasks
    *  are allowed to take up time while functions
    *  are not, and functions have return values like 
    *  to procedural languages while tasks require
    *  use of input/output ports.
    */
    task reset();
    begin
        nRST = 1'b0;
        repeat(2) @(posedge CLK);
        // Release reset
        @(posedge CLK);
        nRST = 1'b1;
        // Reset inputs & realign to just after next posedge
        tb_data = 1'b0;
        @(posedge CLK);
        #(1);
    end
    endtask

    // This task will send a single data bit to the FSM,
    // and pulse the clock.
    task send_bit(
        input logic data_bit
    );
    begin
        tb_data = data_bit;
        @(posedge CLK);
        #(1);
    end
    endtask

    // TODO: Fill in the task code to
    // send a stream of data. - Done
    // Code is provided to check output and to print error messages
    // if an error is found, including the test number,
    // input data, expected value and received value.
    // Careful: send the data *MSB first!* (Start from index 7)
    // HINT: You can call tasks from other tasks. Use the 'send_bit'
    // task above in a loop to send the whole stream of bits.
    task send_stream(
        TestVector vec
    );
    begin
        // Set 'current_test' to the test vector number
        // to help tracking in waveforms
        current_test = vec.test_number;
        // reset FSM
        reset();

        // TODO: Execute the test here - DONE
        for (int i = 7; i >= 0; i--) begin
            send_bit(vec.data_stream[i]);
        end

        #(1); // Delay to ensure sample after output changes
        // Check outputs & display pass/fail messages
        if(tb_accept != vec.expected_output) begin
            $display("Time %t: [FAILED] Test %d failed on input %d; Expected %b, got %b\n", 
                        $time, vec.test_number, vec.data_stream, vec.expected_output, tb_accept);
        end else begin
            $display("Time %t: [PASSED] Test %d passed.\n", $time, vec.test_number);
        end
    end
    endtask

    // TODO: create a new test vector using the TB
    // test_counter variable, and the function parameters.
    // Hint: Check the definition of the TestVector data structure
    // on line 9, and fill it in like structs in C!
    function TestVector gen_test(
        logic [7:0] test_data,
        logic expected
    );
        TestVector vec;

        test_counter++; // Increment test counter for next call to gen_test
        vec.data_stream = test_data;
        vec.expected_output = expected;
        vec.test_number = test_counter;
        return vec;
    endfunction

    // Start the testbench
    initial begin
        // Set the output file for trace collection
        $dumpfile("waveform.fst");
        $dumpvars(0, tb_fsm);

        // Initialize the TB variables
        tb_data = '0;
        nRST = '1;
        test_counter = 0;
        current_test = -1;

        $timeformat(-9, 2, " ns", 20); // Set formatting for printing time

        // Generate test cases
        tests = new[6]; // Create dynamically sized array 
        tests[0] = gen_test(8'd5, 1'b1); // 5 should be divisible by 5!
        tests[1] = gen_test(8'd1, 1'b0); // 1 is not divisible by 5
        tests[2] = gen_test(8'd255, 1'b1); // 255 is divisible by 5

        // TODO: Create a couple more test cases. Make sure to change the
        // size of the array on the line with the call to "new[3]"!
        // All three of these should not be divisible by 5:
        tests[3] = gen_test(8'd2, 1'b0);
        tests[4] = gen_test(8'd3, 1'b0);
        tests[5] = gen_test(8'd4, 1'b0);

        // Run the reset task
        reset();

        // TODO: Run your test cases by looping through the array and calling
        // your "send_stream" task! Don't forget to reset between calls, or
        // your FSM won't start in the correct state.
        for(int i = 0; i < 3; i++) begin
            send_stream(tests[i]);
        end
        // Signal simulation to stop, all tests complete
        $finish();
    end


endmodule