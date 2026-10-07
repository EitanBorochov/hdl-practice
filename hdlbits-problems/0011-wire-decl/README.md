# HDLBits: Wire decl

Problem: [Wire decl](https://hdlbits.01xz.net/wiki/Wire_decl)

Goal: Implement the circuit from the website. Create two intermediate wires (named anything you want) to connect the AND and OR gates together. Note that the wire that feeds the NOT gate is really wire out, so you do not necessarily need to declare a third wire here. Notice how wires are driven by exactly one source (output of a gate), but can feed multiple inputs.



## Run locally

```sh
make test
make wave
```

## What I learned

- Learned how to declare wires in SV which will be useful for more complex projects.
- Practiced using tasks to repeat tests more efficiently.
