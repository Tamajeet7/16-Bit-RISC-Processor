# 16-bit RISC Processor in Verilog

This project implements a simple 16-bit RISC (Reduced Instruction Set Computer) processor from scratch using Verilog HDL. The processor supports arithmetic, logic, memory, and control flow instructions in a clean, modular design. It includes instruction decoding, register management, control logic, ALU operations, branching, and a testable memory system.

## 🧠 Key Features

- 16-bit data path
- 8 general-purpose registers
- Modular design (ALU, Register File, Decoder, Control Unit, PC, RAM)
- Branch & jump instructions (`JMPA`, `JMPR`)
- ALU with signed/unsigned operations
- Comparison and shift operations
- Memory read/write support
- Fully testbenched using unit-level and top-level simulations

<pre lang="markdown"> ## 📂 Project Structure ``` ├── Design/ # All core Verilog modules │ ├── alu.v # ALU: arithmetic and logical operations │ ├── ctrl_unit.v # Control Unit: FSM-based stage control │ ├── fake_ram.v # Fake RAM: simulated memory for data/instruction │ ├── inst_dec.v # Instruction Decoder: extracts opcode, registers, immediate │ ├── pc_unit.v # PC Unit: manages program counter updates │ ├── reg_file.v # Register File: 8 general-purpose registers │ ├── TestBench/ # Testbenches for simulation │ ├── decoder_unittest.v # Testbench for inst_dec module │ ├── regfile_unittest.v # Testbench for reg_file module │ ├── main_test.v # Top-level testbench (full system integration) │ ├── Screenshots/ # (Optional) Waveform images and output snapshots ├── 16_bit_Processor.xpr # Vivado project file ├── README.md # Project overview and instructions ``` </pre>


## ⚙️ Modules Overview

| Module        | Description                                              |
|---------------|----------------------------------------------------------|
| `alu.v`       | Arithmetic and logic unit (add, sub, or, and, cmp, shl)  |
| `reg_file.v`  | 8-register bank with read/write capabilities             |
| `inst_dec.v`  | Decodes instruction into opcode, registers, immediate    |
| `ctrl_unit.v` | FSM to enable pipeline/control stages                    |
| `pc_unit.v`   | Program counter with jump/reset control                  |
| `fake_ram.v`  | Simulated instruction/data memory with preset values     |

## 🧪 Testbenches

| Testbench                | Purpose                                       |
|--------------------------|-----------------------------------------------|
| `decoder_unittest.v`     | Unit test for instruction decoder             |
| `regfile_unittest.v`     | Unit test for register file functionality     |
| `main_test.v`            | Full-system testbench to simulate processor   |

## 🚀 Getting Started

### ✅ Prerequisites

- Vivado or ModelSim (or any Verilog simulation tool)
- Basic knowledge of Verilog & RISC architecture

### 🔧 How to Run (Simulation Example)

1. Open the project in **Vivado** or another tool
2. Add files from `Design/` and `TestBench/`
3. Set `main_test.v` as the top-level module
4. Run behavioral simulation
5. Observe waveform, debug signals, and verify processor behavior

## 🖼️ Sample Output (Optional)

You can include simulation waveforms or execution results in the `Screenshots/` folder, for example:
- Register file updates
- Program counter incrementing
- ALU results for arithmetic instructions
- Branch taken/not taken

## 📌 Future Improvements

- Add instruction pipelining
- Support interrupts and exceptions
- Extend instruction set
- Write assembler/parser

## 🧑‍💻 Author

**Tamajeet Biswas**  
GitHub: [Tamajeet7](https://github.com/Tamajeet7)
