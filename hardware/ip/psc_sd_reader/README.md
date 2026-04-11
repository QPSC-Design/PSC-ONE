# PSC_SDReader

## Overview

PSC_SDReader is a hardware IP core that implements SD card (SPI mode) sector read functionality for FPGA-based systems.

It provides a simple MMIO-based interface for the CPU, while internally handling SD card initialization, command sequencing, data transfer, FIFO buffering, and SPI communication.

From the CPU perspective, it behaves like a memory-mapped SD card reader.

---

## Features

- Full SD card initialization (SPI mode)
- Single block read (CMD17)
- 512-byte FIFO buffer
- Memory-mapped interface (MMIO)
- CRC reception (no validation yet)
- Configurable SPI clock (init + fast mode)
- Error and status reporting

---

## Memory Map (MMIO)

| Address      | Name         | Description                    |
|-------------|--------------|--------------------------------|
| 0x10006000  | SD_IF_DATA   | FIFO read (1 byte per access) |
| 0x10006004  | SD_IF_SECTOR | Sector (LBA) register         |
| 0x10006008  | SD_IF_CTRL   | Control / Status register     |

---

## Control Register (SD_IF_CTRL)

Write (Control)

| Bit | Function             |
|-----|----------------------|
| 0   | Start initialization |
| 1   | Start read (CMD17)   |
| 2   | FIFO flush           |
| 3   | Soft reset           |
| 4   | Clear error          |

Read (Status)

| Bit | Name        | Description                 |
|-----|-------------|-----------------------------|
| 1   | busy        | Operation in progress       |
| 2   | read_ready  | Ready for new read command  |
| 3   | fifo_empty  | FIFO is empty               |
| 4   | fifo_full   | FIFO is full                |
| 5   | error       | Error occurred              |

Upper bytes contain CRC1 and CRC2 received from the SD card.

---

## Usage Flow

1. Initialize SD Card

```c
*(volatile uint32_t*)0x10006008 = 0x01;
```

2. Set Sector (LBA)

```c
*(volatile uint32_t*)0x10006004 = lba;
```

3. Start Read

```c
*(volatile uint32_t*)0x10006008 = 0x02;
```

4. Read Data (512 bytes)

```c
for (int i = 0; i < 512; i++) {
    uint8_t data = *(volatile uint32_t*)0x10006000;
}
```

---

## Internal Architecture

The module consists of three main components:

- SPI Engine (PSC_SDReader_SPI)
  Handles SPI timing and byte-level communication with the SD card. Supports both initialization (slow clock) and normal operation (fast clock).

- FIFO Buffer
  Stores the 512-byte sector data received from the SD card. This decouples SPI timing from CPU access timing.

- FSM (Finite State Machine)
  Controls SD card initialization and read operations.

---

## Initialization Sequence

RESET  
→ 80 clock cycles (CS high)  
→ CMD0  
→ CMD8  
→ CMD55  
→ ACMD41 (loop until ready)  
→ CMD58  
→ READY  

---

## Read Sequence

READY  
→ CMD17 (read single block)  
→ WAIT_R1  
→ WAIT_TOKEN (0xFE)  
→ READ_DATA (512 bytes)  
→ READ_CRC (2 bytes)  
→ DONE  
→ READY  

---

## FIFO Behavior

- Data is pushed from SPI into FIFO
- CPU reads data via MMIO
- FIFO depth is configurable (default: 512 bytes)

---

## Busy Definition

```verilog
busy = (state != ST_READY) || (fifo_count != 0);
```

The module is considered busy when the FSM is active or when unread data remains in the FIFO.

---

## Limitations

- SDHC only (LBA addressing assumed)
- No CRC validation (only captured)
- Single block read only (no CMD18)
- Write operation not supported
- FIFO full handling is minimal

---

## Future Improvements

- CRC verification
- Multi-block read (CMD18)
- Write support (CMD24)
- DMA integration
- SDSC support

---

## Summary

PSC_SDReader is a lightweight SD card interface IP that provides a simple CPU-side interface with fully hardware-managed SD protocol.

It is suitable for bare-metal OS, FPGA SoC designs, and custom storage subsystems.
