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

## Systolic Array vs PicoRV32 (Yosys Analysis)

### Resource Comparison

| Metric            | Systolic Array (2×2) | PicoRV32 |
|------------------|----------------------|----------|
| Cells            | 428                  | 515      |
| Multipliers      | **4**                | **0**    |
| Adders           | 24                   | 8        |
| Multiplexers     | 155                  | 100      |
| Registers (FF)   | ~700                 | ~90      |
| Control Logic    | Low                  | High     |

- A **dataflow-oriented compute engine (Systolic Array)**
- A **control-oriented general-purpose CPU (PicoRV32)**

---

## Execution Example

The following example shows a 12×12 matrix multiplication executed on PSC-ONE AI using the SynapEngine systolic array accelerator.

```text
PSC_OS> sa_start
A
2 4 6 8 10 12 14 16 18 20 22 24 
4 6 8 10 12 14 16 18 20 22 24 26 
6 8 10 6 14 16 18 20 22 24 26 28 
8 10 12 14 16 18 20 22 24 26 28 30 
10 12 14 16 18 20 22 24 26 28 30 32 
12 14 16 18 20 22 24 26 28 30 32 34 
14 16 18 20 22 24 26 28 30 32 34 36 
16 18 20 22 24 26 28 30 32 34 36 38 
18 20 22 24 26 28 30 32 34 36 38 40 
20 22 24 26 28 30 32 34 36 38 40 42 
22 24 26 28 30 32 34 36 38 40 42 44 
24 26 28 30 32 34 36 38 40 42 44 46 

B
5 6 7 8 9 10 11 12 13 14 15 16 
8 9 10 11 12 13 14 15 16 17 18 19 
11 12 13 14 15 16 17 18 19 20 21 22 
14 15 16 17 18 19 20 21 22 23 24 25 
17 18 19 20 21 22 23 24 25 26 27 28 
20 21 22 2 24 25 26 27 28 29 30 31 
23 24 25 26 27 28 29 30 31 32 33 34 
26 27 28 29 30 31 32 33 34 35 36 37 
29 30 31 32 33 34 35 36 37 38 39 40 
32 33 34 35 36 37 38 39 40 41 42 43 
35 36 37 38 39 40 41 42 43 44 45 46 
38 39 40 41 42 43 44 45 46 47 48 49 

C
4212 4368 4524 4428 4836 4992 5148 5304 5460 5616 5772 5928 
4728 4908 5088 4974 5448 5628 5808 5988 6168 6348 6528 6708 
5160 5358 5556 5418 5952 6150 6348 6546 6744 6942 7140 7338 
5760 5988 6216 6066 6672 6900 7128 7356 7584 7812 8040 8268 
6276 6528 6780 6612 7284 7536 7788 8040 8292 8544 8796 9048 
6792 7068 7344 7158 7896 8172 8448 8724 9000 9276 9552 9828 
7308 7608 7908 7704 8508 8808 9108 9408 9708 10008 10308 10608 
7824 8148 8472 8250 9120 9444 9768 10092 10416 10740 11064 11388 
8340 8688 9036 8796 9732 10080 10428 10776 11124 11472 11820 12168 
8856 9228 9600 9342 10344 10716 11088 11460 11832 12204 12576 12948 
9372 9768 10164 9888 10956 11352 11748 12144 12540 12936 13332 13728 
9888 10308 10728 10434 11568 11988 12408 12828 13248 13668 14088 14508 

PSC_OS> 
```

This example demonstrates successful systolic-array-based GEMM execution on PSC_OS using the PSC-ONE AI accelerator.

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
