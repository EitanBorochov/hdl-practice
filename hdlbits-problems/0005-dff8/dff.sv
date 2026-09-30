module dff(
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    always_ff @(posedge clk) begin
        q <= d;
    end

endmodule