# PSC-ONE Design

The current PSC-ONE prototype hardware.  
  
<img src="/docs/images/PSC-ONE_board.jpg" width="600">

## Purpose

PSC-ONE is a hardware evaluation and demonstration platform for the PSC project.

The board is designed to verify and validate the functionality of the PSC CPU, operating system, memory subsystem, peripherals, and AI acceleration technologies in a real hardware environment.

It also serves as a demonstration platform for various embedded applications, including:

- Voice recognition
- AI inference
- Graphics and display control
- Sensor integration
- Real-time embedded systems

<img src="mechanical/PSC-ONE.3D_final.jpg" width="800">

## Features

- Custom PSC RISC-V CPU
- PSC-OS operating system support
- SDRAM memory interface
- LCD display interface
- Optional touch panel support
- SD card storage interface
- UART debugging console
- GPIO expansion
- AI accelerator integration support

## Getting Started

### Program the FPGA

Build the FPGA bitstream and program the PSC-ONE board using the Gowin Programmer.

After successful programming, connect:

* UART console
* SD card containing PSC-OS images
* LCD module (optional)

### Prepare the SD Card

Write the PSC-OS images to the SD card.

Current default layout:

| Image      | Start Sector |
| ---------- | ------------ |
| kernel.img | 100          |
| user.img   | 200          |

Example:

```bash
TBD
```

Replace `/dev/sdX` with the actual SD card device.

### Boot PSC-OS

1. Insert the SD card into PSC-ONE.
2. Power on the board.
3. Open the UART console.

The bootloader loads:

1. `kernel.img` from the SD card into SDRAM
2. `user.img` from the SD card into SDRAM
3. Transfers control to PSC-OS

Expected boot log:

```text
TBD
```

The system is now ready for interactive use through the UART console.


## License

Hardware design files, schematics, PCB layouts, and related documentation are licensed under CERN-OHL-S v2.

Copyright (c) 2026 QPSC-Design
