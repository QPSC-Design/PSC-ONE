# PSC-ONE AI

PSC-ONE AI is a hardware accelerator for matrix multiplication (GEMM),  
based on a systolic array architecture.

It is a core component of the **PSC-ONE full-stack SoC**, integrating a custom RISC-V CPU, memory subsystem, and AI accelerator into a single experimental platform for edge computing and architectural exploration.

---

## Architecture

This diagram shows the integration of the SynapEngine (systolic array) within the PSC-ONE system.

<img src="./docs/images/PSC_SynapEngine.jpg" width="800">

---

## Overview

PSC-ONE AI integrates a custom systolic array engine (**SynapEngine**) into the PSC-ONE platform.

The goal of this project is to explore **efficient dataflow architectures under constrained memory bandwidth**, which is a key challenge in edge AI systems.

The design emphasizes:

- Dataflow-driven computation
- Tight coupling with the memory system
- Full hardware/software co-design

---

## Key Features

- 2×2 int8 systolic array (SynapEngine)
- Support for:
  - Weight-Stationary (WS)
  - Output-Stationary (OS)
- Cycle-based execution model
- Memory-mapped control interface
- Integration with PSC-ONE SDRAM and cache system
- FPGA-ready design
- cocotb-based verification

---

## Dataflow Architecture

PSC-ONE AI supports two fundamental dataflow models used in modern AI accelerators.

### Weight-Stationary (WS)

- Weights remain inside each Processing Element (PE)
- Input activations stream through the array
- Maximizes weight reuse

### Output-Stationary (OS)

- Partial sums are accumulated locally in each PE
- Inputs (A and B) are streamed diagonally
- Minimizes memory write-back bandwidth

---

## Computation Model

The accelerator performs matrix multiplication:

C = A × B

Execution model:

- A flows horizontally across the array
- B flows vertically across the array
- Partial sums are accumulated inside PEs (OS mode)

---

## Memory System Integration

PSC-ONE AI is tightly integrated with the PSC-ONE memory architecture:

- Shared memory space with the CPU
- Memory-mapped I/O interface
- L1 cache compatible design
- Software-managed cache coherency

---

## Programming Model

The accelerator is controlled via memory-mapped registers.

Typical workflow:

1. Write matrices A and B to memory
2. Configure operation mode (WS / OS)
3. Start computation
4. Wait for completion
5. Read back results

---

## Directory Structure

---

## Directory Structure

```
PSC-ONE/
 └── hardware/
     └── ai/
         ├── src/
         └── docs/
```

---

## Future Work

- Larger systolic arrays (4x4, 8x8)
- DMA support
- Memory bandwidth optimization
- Mixed precision support (fp16 / int8)
- Software stack for AI workloads

---

## License

Same as PSC-ONE project.

---

## Author

QPSC-Design
