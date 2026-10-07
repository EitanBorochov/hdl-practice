SOURCES := top_module.sv tb.sv
SIM := obj_dir/Vtb

.PHONY: test wave clean

test: $(SIM)
	./$(SIM)

$(SIM): $(SOURCES)
	verilator --binary --timing --trace-vcd -Wall -Wno-fatal --top-module tb $(SOURCES)

wave: test
	surfer wave.vcd

clean:
	rm -rf obj_dir wave.vcd
