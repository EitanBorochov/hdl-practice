module top_module(input logic a, b, sel, output logic out); 
    always_comb begin
        // approach 1: casez. This is the one my SoCET professor recommended for Muxes.
        casez (sel)
            1'b0: out = a;
            1'b1: out = b; 
            default: out = 0;
        endcase

        // approach 2: using an if condition. This one doesn't scale well.
        if (sel) begin
            out = b;
        end else if (!sel) begin
            out = a;
        end
    end

    // approach 3: continuous assignment. This one only works for 2to1 muxes.
    assign out = sel ? b : a;

endmodule