+++
title = 'Firmware analysis & rehosting'
+++
# Firmware analysis & rehosting
Why is firmware analysis hard?
- platform variety: different ISAs, file formats, peripherals, and not enough docs
- fault detection: finding vulnerabilities often means to find a crash, and on desktop you get segfaults/canaries, but maybe not on embedded systems
- scalability: embedded devices are slow, and for testing you may need high execution speed and fast resets
- instrumentation: source-based often infeasible, binary-based may assume specific ISA and OS, maybe not enough storage to store modified firmware on flash

## Rehosting
Rehosting: migrating firmware from original hardware environment into virtual environment

Tools:
- Unicorn: QEMU-based CPU emulation framework, bindings for Python
- avatar2: multi-target (emulators/tools) orchestration system, focus on firmware analysis and rehosting

Hardware-in-the-loop rehosting: forward hardware interaction to device (usually requires debugging ports or stubs)
- Avatar: early HITL frameworks, requires JTAG or injectable debug stub. Separates execution and memory, forwards peripheral interaction.
- Surrogates: high-performant HITL, eliminates performance issues of avatar, requires very specialized hardware

Hardware-less rehosting: semi-automatically create hardware models, completely eliminate device dependency (higher likelihood for inaccuracies)
- Pretender: based on avatar2, HITL rehosting only during learning, and hardware models after.
- PartEMU: rehosting TrustZone Operation Systems, based on QEMU, manual mapping of registers to pattern-based models
- P2IM: for Type-2/3 firmware, uses heuristics to identify register types, instantiate model based on register type
- HALucinator: identify HAL functions -- hardware accesses typically go through hardware abstraction layers (HAL)
- Fuzzware: every MMIO access is fuzzing input, uses dynamic symbolic execution to reduce input space
- Firmadyne: unpacks Linux-based firmware and extracts file-system, runs it in QEMU with custom kernel

## Large-scale analysis
Retrieve many firmware samples, try to find vulnerabilities in some of them.

Identified problems:
- hardcoded passwords
- private certs included in firmware updates
- backdoors in plain sight
- known exploits often reusable, even across firmware from different vendors -> code-reuse
- insecure usage of crypto libs is common
- many bugs on Linux-based firmware are based on multi-binary interactions
- insecure usage of Bluetooth Low Energy is very common for bare-metal IoT devices

Approaches:
- '14: unpacking based on Binary Analysis Toolkit, only static analysis
- Firmadyne: unpacking based on binwalk, emulation/rehosting approach
- CryptoREX: unpacking based on binwalk, tried to discover violation of cryptographic 'rules', taint analysis with angr
- Karonte: multi-binary data-flow analysis -- identify "border binaries", track dataflow to unsafe functions
- FirmXRy: extract firmware from APKs, automated base address recognition, vulnerability detection via policies
