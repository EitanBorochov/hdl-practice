# HDLBits 0001 — Step One

Problem: [Step one](https://hdlbits.01xz.net/wiki/Step_one)

Goal: drive output `one` high at all times.

## Run locally

```sh
make test
make wave
```

## What I learned

- A module describes hardware; a testbench stimulates and checks it.
- `assign` describes a continuous connection for combinational logic.
- Verilator converts the design and testbench into a native simulator executable.
- Make gives memorable names to the build, test, and waveform commands.
