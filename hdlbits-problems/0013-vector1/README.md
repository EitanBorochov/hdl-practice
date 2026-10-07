# HDLBits: Vector1

Problem: [Vector1](https://hdlbits.01xz.net/wiki/Vector1)

Goal: Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes.

## Run locally

```sh
make test
make wave
```

## What I learned

- What implicit nets are 
- How to disable implicit nets
- Difference between packed and unpacked arrays. Unpacked arrays seem very useful.
- The different types of part selects.