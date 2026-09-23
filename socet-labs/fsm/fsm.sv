module fsm(
    input logic CLK, nRST,
    input logic data,
    output logic accept
);

    // Declaring an 'enum' to work with states
    // In this case since the state names are not as
    // meaningful, it is less helpful, but for FSMs that
    // have semantically meaningful names, this makes code
    // much easier to understand than 'magic numbers'
    typedef enum logic [2:0] {
        S0,
        S1,
        S2,
        S3,
        S4
    } state_t;

    state_t state, next;

    always_ff @(posedge CLK, negedge nRST) begin
        if(!nRST) begin
            state <= S0;
        end else begin
            state <= next;
        end
    end

    // Next state logic
    always_comb begin
        // I am using a general formula over state because the pattern is that each incoming
        // data bit doubles the value and adds the data bit (either 0 or 1). That pattern also
        // applies to the remainder (state).
        int candidate;
        candidate = (2 * int'(state) + int'(data));
        // Using if to avoid using modulus (defeates the point of making a divisible-by-5 module)
        if (candidate >= 5) begin
            next = state_t'(candidate - 5);
        end else begin
            next = state_t'(candidate);
        end
    end

    // Output logic
    assign accept = (state == S0);

endmodule