# HDLBits: Dff

Problem: [Dff](https://hdlbits.01xz.net/wiki/Dff)

Goal: 
A D flip-flop is a circuit that stores a bit and is updated periodically, at the (usually) positive edge of a clock signal.

D flip-flops are created by the logic synthesizer when a clocked always block is used (See alwaysblock2). A D flip-flop is the simplest form of "blob of combinational logic followed by a flip-flop" where the combinational logic portion is just a wire.

Create a single D flip-flop.

## Run locally

```sh
make test
make wave
```

## What I learned

- Learned that nonbinding assignments are used in sequential logic because that represents real hardware that is connected together in parallel.
- Approaching the testbench was the difficult part for me but this practice reinforced the thought process behind creating that. 
- Establishing known values, creating a loop with a pattern that needs testing, and finding a way to compare the results with the expected ones.
- Doing this one in preperation of more serious sequential logic stuff. I want to strengthen my fundamentals first to be able to make strong connections when I need them.