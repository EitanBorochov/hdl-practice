module tb;
    logic one;

    top_module dut (.one(one));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
        #1;
        assert (one === 1'b1)
            else $fatal(1, "FAIL: expected one=1, got one=%b", one);
        $display("PASS: one is always 1");
        $finish;
    end
endmodule
