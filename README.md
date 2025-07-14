# 🧠 16-bit RISC Processor in Verilog

This project implements a simple **16-bit RISC-based processor** using Verilog HDL. It supports arithmetic, logic, memory, and control operations through a modular and testbench-driven design.

---

## 🚀 Features

- 16-bit instruction and data width
- Modular design (ALU, Register File, Decoder, Control Unit, PC, RAM)
- Branch & jump instructions (`JMPA`, `JMPR`)
- ALU with signed/unsigned operations
- Comparison and shift operations
- Memory read/write support
- Fully testbenched using unit-level and top-level simulations

---

## 📁 Project Structure

```text
├── Design/                   # All core Verilog modules
│   ├── alu.v                 # ALU: arithmetic and logical operations
│   ├── ctrl_unit.v           # Control Unit: FSM-based stage control
│   ├── fake_ram.v            # Simulated RAM for instruction/data
│   ├── inst_dec.v            # Instruction decoder
│   ├── pc_unit.v             # Program counter logic
│   ├── reg_file.v            # 8-register read/write register file
│
├── TestBench/                # Testbenches for simulation
│   ├── decoder_unittest.v    # Unit test for inst_dec
│   ├── regfile_unittest.v    # Unit test for reg_file
│   ├── main_test.v           # Full system simulation testbench
│
├── Screenshots/              # (Optional) Waveform images or outputs
├── 16_bit_Processor.xpr      # Vivado project file (optional)
├── README.md                 # Project documentation 
```



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
