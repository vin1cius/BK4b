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

## Simulation Tutorial

### 1. Simulating the RTL Design

To build and simulate the RTL version of the module, use **Icarus Verilog** with the following command:

```bash
iverilog bk4b.v tb_bk4b.v
vvp a.out
```

This compiles the RTL design and testbench, and runs the simulation using the default output executable, so you can visualize it later with GTKWave.

---

### 2. Simulating the Synthesized Netlist

To build and simulate the synthesized gate-level netlist, use the following command:

```bash
iverilog -o bk4b_netlist.out primitives.v sky130_fd_sc_hd.v bk4b_netlist.v tb_bk4b.v
vvp bk4b_netlist.out
```

This command includes the required SkyWater SKY130 standard cell library and primitive definitions needed for simulating the synthesized design.

---

### Notes

- Ensure all required library files (`primitives.v` and `sky130_fd_sc_hd.v`) are available in the working directory (`source/`).
- The RTL simulation is useful for functional verification.
- The netlist simulation verifies the design after synthesis.

### 3. Viewing Waveforms with GTKWave

To visualize the simulation results, a VCD (Value Change Dump) file must be generated during simulation using `$dumpfile` and `$dumpvars` in the testbench.

After running the simulation, open the waveform file using:

```bash
gtkwave bk4b.vcd
```

This will launch GTKWave and display the signal transitions, allowing you to analyze the behavior of the design over time.

---

### Notes

- Ensure the testbench includes:
  ```verilog
  $dumpfile("bk4b.vcd");
  $dumpvars(0, bk4b_tb);
  ```
- The `.vcd` file must be generated before running GTKWave.
## Acknowledgment

This project was developed to attend the **VSD RTL Design and Synthesis using SkyWater SKY130 Workshop**, conducted from **June 24 to July 4, 2026** by Instructors **Kunal Ghosh** and **Shon Taware**.
