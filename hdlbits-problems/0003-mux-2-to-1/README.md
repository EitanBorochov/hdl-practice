# HDLBits: Mux2to1

Problem: [Mux2to1](https://hdlbits.01xz.net/wiki/Mux2to1)

Goal: Create a one-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.

## Run locally

```sh
make test
make wave
```

## What I learned

- Better review and understanding of how casez works in SystemVerilog.
- I did multiple different approaches to learn different concepts in SV.
- Output variable has to be a variable inside a procedural block, so I set out to be logic.
- Got better practice at writing a task and looping it in the testbench.