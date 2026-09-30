module top_module #(parameter WIDTH = 8) (
    input clk,
    input [WIDTH - 1:0] d,
    output [WIDTH - 1:0] q
);
    genvar i;
    generate;
        for (i = 0; i < WIDTH; i++) begin
            dff dff (.clk(clk), .d(d[i]), .q(q[i]));
        end
    endgenerate

endmodule
