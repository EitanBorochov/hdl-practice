# HDLBits: DFF8

Problem: [Dff8](https://hdlbits.01xz.net/wiki/Dff8)

Goal: Create 8 D flip-flops. All DFFs should be triggered by the positive edge of clk.
I am gonna use the module I made for a single DFF and practice instantiating modules.

## Run locally

```sh
make test
make wave
```

## What I learned

- I know I can just do q <= d inside an always_ff, but I am practicing using modules because that will be far more useful for bigger projects.
- Learned the generate function. 
- Learned how to use parameters to change how many flip flops I have with a single number.
- It's good to also add tests between larger steps such as from 00000000 to 11111111 and more random jumps.