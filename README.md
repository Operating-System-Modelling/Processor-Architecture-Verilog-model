# <h1 align="center">🖥️ CPU Pipeline and Memory System Design</h1>

<p align="center">
  <img src="https://img.shields.io/badge/SystemVerilog-FFB611?style=flat&logo=verilog&logoColor=white" alt="SystemVerilog"/>
  <img src="https://img.shields.io/badge/Hardware-Design-4CAF50" alt="Hardware Design"/>
</p>

<p align="center">
  A detailed project focused on the design and implementation of a CPU pipeline and memory system using SystemVerilog, including hazard control, forwarding mechanisms, and comprehensive memory management.
</p>

---

## 🌟 **Features**
- **🔄 Full CPU Pipeline Stages**: Implements all key stages of a CPU pipeline, including Fetch, Decode, Execute, Memory Access, and Write Back, ensuring smooth instruction processing.
- **⚙️ ALU and Control Logic**: Designs the Arithmetic Logic Unit (ALU) and control logic to manage the operations within the pipeline.
- **📦 Instruction and Data Memory**: Includes modules for instruction memory (IMem) and dynamic random-access memory (DRAM) to simulate realistic memory interactions.
- **📊 Forwarding, Stalling, and Hazard Control**: Implements advanced techniques like forwarding and stalling to handle data hazards and maintain pipeline efficiency.
- **🧩 Register File Management**: Manages registers with dedicated logic to ensure correct data flow and storage across the pipeline stages.

---

## 🛠 **Tech Stack**
- **Hardware Description Language**: <img src="https://img.shields.io/badge/SystemVerilog-FFB611?style=flat&logo=verilog&logoColor=white"/> SystemVerilog
- **Simulation and Synthesis**: Supports simulation for verifying design correctness and synthesizing hardware for FPGA/ASIC.

---

## 🗂 **Project Structure**
1. **Pipeline Stages**:
   - `IF_Stage.sv` & `Fetch.sv`: Implements the Instruction Fetch stage of the pipeline, including the program counter and instruction memory access.
   - `ID_Stage.sv`: Implements the Instruction Decode stage, decoding instructions and preparing operands for execution.
   - `EX_Stage.sv`: Implements the Execute stage, where the ALU performs operations on the operands.
   - `Mem_Stage.sv`: Implements the Memory Access stage, handling data reads/writes between the CPU and memory.
   - `WB_Stage.sv`: Implements the Write Back stage, writing the results back to the register file.
2. **Core Components**:
   - `ALU.sv`: The Arithmetic Logic Unit performs all arithmetic and logical operations within the CPU.
   - `FWD_Control.sv`: Manages data forwarding in the pipeline to prevent data hazards.
   - `Stall_Control.sv`: Controls pipeline stalls to handle hazards and ensure correct instruction sequencing.
   - `DFlipFlop.sv`: Implements basic D flip-flop logic for state retention within the CPU.
   - `Register_File.sv`: Manages the CPU's register file, ensuring correct data storage and retrieval across pipeline stages.
3. **Memory Modules**:
   - `Instr_Mem.sv`: Represents the instruction memory, storing the program's instructions.
   - `DRAM.sv`: Models the data memory, simulating how the CPU interacts with main memory.
4. **CPU Core**:
   - `Core.sv`: Integrates all pipeline stages and core components, representing the complete CPU pipeline.

---

## 🚀 **Getting Started**

### Prerequisites
- A SystemVerilog simulator such as ModelSim or QuestaSim.
- An FPGA development board (optional) for synthesis and implementation.

### Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/CPU-Pipeline-Design.git

<!-- ECE3058Lab2 --> 
