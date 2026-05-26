# Hardware Caesar Cipher Encoder/Decoder

## Overview
This repository contains a SystemVerilog implementation of the classic **Caesar Cipher**. It is designed as a purely combinational logic circuit that shifts 8-bit ASCII characters by a user-defined key. 


## Concept & Architecture
The architecture relies on continuous data flow through two back-to-back `Caesar` modules. The first module applies a positive shift to the incoming 8-bit ASCII character, while the second module acts as the decoder by applying the mathematical complement of that shift, thereby restoring the original data.

<img width="2173" height="382" alt="image" src="https://github.com/user-attachments/assets/61d36f67-c812-4c3a-a8b8-ce9faa8e8f1b" />

*(RTL Schematic detailing the parallel instantiation of the encoder and decoder `Caesar` modules, highlighting the mathematical wrap-around addition and subtraction logic.)*

## Module Descriptions

| Sub-Module | Purpose |
| :--- | :--- |
| **`Caesar`** (Core) | Takes an 8-bit character (`data_in`) and a shift key. Uses a ternary operator to handle alphabetical overflow (if `value > 90`, subtract `26`). |
| **`Caesar_decoding`** (Top) | A structural wrapper that instantiates an encoder and decoder back-to-back, dynamically assigning the decoder's key as `26 - shift_code`. |

## Verification Strategy
* **Test Data:** The string `"COMBINATIONAL"` is fed into the system character by character.
* **Timing:** A `1 ns` propagation delay is applied between each character shift.
* **Target:** The testbench monitors `data_received` to ensure it exactly matches the original `data_sent` after passing through both the encryption and decryption stages.

## Simulation Results

<img width="1748" height="134" alt="image" src="https://github.com/user-attachments/assets/ad486037-8448-464c-b860-59e097a094f8" />

*(Simulation waveform verifying the ROT13 cipher. The input string "COMBINATIONAL" is successfully encoded to "PBZOVANGVBANY" and subsequently decoded back to the original "COMBINATIONAL".)*

## Future Improvements
* Expand the wrap-around boundary logic to support both uppercase and lowercase ASCII characters.
* Parameterize the alphabet length (currently hardcoded to `26`) to support custom or non-standard character sets.
