+++
title = 'Multicore'
+++
# Multicore
Multicores:
- explicit parallel execution in processor chip
- share some resources (cache, mem, IO, ...)
- kernel needs to:
    - start/stop cores when needed
    deal with consistency/scalability
    - schedule work on cores

## Turning on x86 cores:
BIOS starts one core (the bootstrapping processor, "BSP")

BSP starts other cores via special interrupt.

PIC: programmable interrupt controller, raises interrupt on CPU

APIC: interrupt reporting, thermal management, performance monitoring, inter-processor interrupts

Starting other processors:
- go to ACPI (set up in predefined memory region by BIOS)
- ACPI contains info also about APIC
- root system descriptor table (RSD) contains pointer to MADT (multiple APIC descriptor table)
- RSDP → RSDT → MADT → LAPIC

Enabling APIC:
- find where memory mapped: stored in MADT, same between cores
- set up spurious interrupt vector
- disable master & slave 8259 PIC: mask all interrupts, remap IRQs to above vector 32

Sending IPIs:
- need to know destination core APIC ID (list of IDs is in MADT)
- write to LAPIC interrupt command register

Starting APs (application processors)
- send INIT IPI
- send start-up IPI, starts at given entry point
- think about what this means for the kernel (e.g. stack)

