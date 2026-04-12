# PSC-ONE Hardware

This directory contains the hardware design of PSC-ONE.

---

## Overview

PSC-ONE hardware is a fully custom-designed FPGA-based system that integrates a RISC-V CPU core, memory subsystem, and peripheral interfaces into a unified architecture.

It includes the following components:

- **PSC_RV32ISP** : A custom-designed RISC-V CPU core (RV32-based), developed from scratch
- **SD Card Interface** : An SPI-based SD card interface used for boot and external storage access
- **SDRAM Controller** : A controller for external SDRAM, supporting system memory access
- **Memory-Mapped Peripheral System** : A unified address-mapped interface for all peripherals
- **UART Interface** : A serial communication interface for debugging and data output
- **SynapEngine** : A systolic array-based AI acceleration engine (optional / experimental)

---

## Notes

- The SD card interface operates in SPI (serial) mode for simplicity and reliability
- The system is designed for full hardware/software co-design with PSC_OS
- All components are interconnected through a memory-mapped architecture

---

## Status

🚧 Work in Progress

The hardware design is actively evolving. Interfaces, modules, and configurations may change.
