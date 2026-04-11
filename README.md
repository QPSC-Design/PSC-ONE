# PSC-ONE

## What is PSC-ONE?

PSC-ONE is an open-source full-stack RISC-V SoC project developed by QPSC-Design.

It aims to build a fully custom edge-computing platform from the ground up, including:

- A custom RV32-based RISC-V CPU core
- Memory subsystem (SDRAM controller, MMU-ready architecture)
- SD card boot and storage interface
- Peripheral interfaces
- AI acceleration engine (SynapEngine / systolic array architecture)
- Custom OS-level integration

PSC-ONE is not just a CPU core, but a complete experimental SoC platform designed for research, edge-AI development, and architectural exploration.

## PSC_RV32ISP

This diagram presents the top-level architecture of the PSC system. <br>
It highlights the integration of the CPU core with memory and peripheral components, including UART, SDRAM, and the SD card interface. <br>
All components are connected via a memory-mapped interface, enabling simple and unified access from the CPU. <br>

![PSC_RV32ISP Block Diagram](docs/images/PSC_RV32ISP_CPU_Block.jpg)

🚧 Work in Progress
