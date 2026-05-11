# Hardware Caesar Cipher Encoder/Decoder

## Overview
This repository contains a SystemVerilog implementation of the classic **Caesar Cipher**. It is designed as a purely combinational logic circuit that shifts 8-bit ASCII characters by a user-defined key. The project includes the core encoding/decoding module, a top-level pipeline demonstrating a full send-receive cycle, and a simulation testbench.

## Architecture and Modules

The design is split into three main files:

### 1. `Caesar` (Core Module)
A combinational module that takes an 8-bit input character (`data_in`) and an 8-bit shift key (`shift`). 
* **ASCII Wrap-Around Logic:** It uses a continuous assignment (`assign`) with a ternary operator to handle alphabetical overflow. If the shifted value exceeds `90` (the ASCII decimal value for uppercase 'Z'), it automatically subtracts `26` to wrap back to the beginning of the alphabet.

### 2. `Caesar_decoding` (System Wrapper)
A structural module that instantiates two `Caesar` blocks back-to-back: an **encoder** and a **decoder**.
* Demonstrates how to reverse the cipher.
* The decode shift key is dynamically calculated as `26 - shift_code` to perfectly reverse the encoder's shift.

### 3. `Testbench`
A simulation testbench verifying the logic using the **ROT13** variant (a shift of `13`, where encoding and decoding are symmetric).
* Passes the string `"COMBINATIONAL"` character by character with a `1ns` delay between characters.
* Instantiates the encoder and decoder to verify that `data_sent` matches `data_received` after processing.

## Technical Details
* **Language:** SystemVerilog
* **Logic Type:** Combinational (No clocks or sequential elements)
* **Input Constraint:** The current wrap-around logic (`> 8'd90`) is optimized for **Uppercase ASCII characters**.

## Simulation
This code can be simulated in any standard HDL simulator (e.g., ModelSim, Intel Quartus, Xilinx Vivado, or EDA Playground).

1. Compile all three modules.
2. Set `Testbench` as the top-level entity.
3. Run the simulation.
4. View the waveform to observe `data_encoded` generating the ciphertext, and `data_received` perfectly reconstructing the word `"COMBINATIONAL"`.
