# BK4b
4-bit Brent-Kung Adder implemented in Verilog HDL.

## Architecture

The Brent–Kung adder is a parallel-prefix adder that computes carries using a prefix tree. Compared with ripple-carry adders, it significantly reduces carry propagation delay while requiring fewer prefix nodes than some other parallel-prefix adders.

The implementation consists of:

- Propagate/Generate (P/G) computation
- Prefix carry network
- Sum generation stage

## Synthesis

The design can be synthesized using **Yosys** targeting the **SkyWater SKY130** standard cell library.

