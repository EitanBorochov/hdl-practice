# HDLBits: Notgate

Problem: [Notgate](https://hdlbits.01xz.net/wiki/Notgate)

Goal: 

## Run locally

```sh
make test
make wave
```

## What I learned

- More practice on writing proper test benches.
- Learned that I need to add delay between inputing test and checking answers to let everything propogate.
- Initially I didnt have the delay and I got that a lot of the tests failed. After adding the delay all passed.