# BK4b
4-bit Brent-Kung Adder implemented in Verilog HDL.

## Architecture

The Brent–Kung adder is a parallel-prefix adder that computes carries using a prefix tree. Compared with ripple-carry adders, it significantly reduces carry propagation delay while requiring fewer prefix nodes than some other parallel-prefix adders.

The implementation consists of:

- Propagate/Generate (P/G) computation
- Prefix carry network
- Sum generation stage

## Synthesis

The design can be synthesized using **Yosys** targeting the **SkyWater SKY130** standard cell library. The synthesis of this project was performed by the steps below. 

### Steps

Open Yosys inside the `source/` folder:

```bash
cd source
yosys
```

Then run the following commands inside the Yosys shell:

```yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog bk4b.v

synth -top bk4b

abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

write_verilog bk4b_netlist.v
```

### Output

- `bk4b_netlist.v` → Synthesized gate-level netlist mapped to SKY130 standard cells

## Acknowledgment

This project was developed to attend the **VSD RTL Design and Synthesis using SkyWater SKY130 Workshop**, conducted from **June 24 to July 4, 2026** by Instructors **Kunal Ghosh** and **Shon Taware**.
