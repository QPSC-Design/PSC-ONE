# PSC-ONE Software

This directory contains the software stack of **PSC-ONE**, a fully custom-designed RISC-V based system.

Unlike conventional projects that rely on existing operating systems, PSC-ONE implements a **completely original operating system** from scratch, tightly integrated with its custom hardware architecture.

---

## Overview

PSC-ONE Software is a **full-stack OS environment** designed for a custom FPGA-based SoC.

It includes:

- Bootloader
- Kernel
- User programs
- System libraries

All components are developed specifically for PSC-ONE, without depending on existing OS frameworks such as Linux or BSD.

---

## Key Features

### 1. Fully Custom OS

PSC-ONE does **not use any existing operating system**.

- No Linux
- No RTOS
- No external kernel base

Every layer, from boot to user space, is implemented independently to enable full control over system behavior and architecture.

---

### 2. RISC-V Privilege Architecture (M / S / U)

PSC-ONE correctly implements the **RISC-V privilege model**:

- **M-mode (Machine mode)**  
  - Boot and low-level control  
  - Trap handling and system initialization  

- **S-mode (Supervisor mode)**  
  - Kernel execution  
  - System services and resource management  

- **U-mode (User mode)**  
  - User applications  
  - Isolated execution environment  

This separation enables a clean and extensible OS design aligned with real-world CPU architectures.

---

### 3. Virtual Memory Support

PSC-ONE is designed with **virtual memory architecture** in mind.

- Address translation abstraction
- Memory isolation between kernel and user space
- Foundation for future MMU-based extensions

This allows the system to evolve toward more advanced OS features such as process management and protection.

---

### 4. Hardware/Software Co-Design

The OS is tightly coupled with the custom hardware:

- Custom CPU core
- Custom memory system
- Custom peripherals

This enables:

- Deterministic behavior
- Efficient low-level control
- Experimental architecture exploration

---

### 5. Open Source

PSC-ONE Software is **fully open source**.

- All source code is publicly available
- Designed for learning, experimentation, and research
- Encourages contributions and modifications

---

## Project Status

⚠️ This project is under active development.

The current implementation focuses on:

- Stable boot process
- Basic kernel functionality
- Hardware integration

---

## Future Work

The **main focus going forward is feature expansion**.

Planned areas include:

- Process management
- Memory management (full MMU support)
- File system integration
- Device driver improvements
- System call interface expansion
- AI accelerator integration (SynapEngine)

This repository is evolving toward a **complete experimental OS platform**.

---

## Philosophy

PSC-ONE Software is not just an OS implementation.

It is an attempt to:

- Understand systems from the ground up
- Explore hardware/software boundaries
- Build a fully transparent computing stack

---

## Directory Structure

```
software/
├── bootloader/
├── kernel/
├── user/
├── lib/
└── tools/
```

---

## Related

- Hardware: `hardware/`
- Top-level project: PSC-ONE

---

## License

This project is released under an open-source license.
