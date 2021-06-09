+++
title = 'Devices'
+++
# Devices
Solid-State Drive (SSD)

- based on DRAM or NAND/NOR flash memory. no mechanical parts.
- NAND flash memory
    - organisation: cells, pages, blocks
    - controller can read/program by page
    - controller can erase by block
    - random/sequential access latency is comparable, but more efficient at reading than writing.

Hard Disk (HDD)

- platters and cylinders in a disk, as many tracks as heads. each track has N sectors
- addressing modes:
    - CHS (cylinder-head-sector), virtual/physical
    - LBA (logical block addressing), only virtual
- in order to transfer data, you have to seek, rotate, and actually transfer. this adds up.
- so how do you optimise it?
    - aaand we’re back to scheduling. this time we’re scheduling the disk arm.
        - first come first serve: do requests in order of arrival. but that’s not actually an optimisation.
        - shortest seek first: do requests with a shortest seek time. but that has to be calculated.
        - elevator algorithm: go up the disk, then down the disk, then back up the disk…do requests along the way.
- error handling
    - programming errors (if you’re requesting a nonexistent sector)
    - transient errors (e.g. shit getting on the head of the arm)
    - permanent errors (if a disk block is physically damaged)
    - seek errors (the arm went to the wrong place)
    - controller errors (controller is a lil bitch and stops accepting commands)
    - disk track with bad sector
        - in this case you can remap
        - switch spare for bad sector, or shift all sectors to bypass the bad one

Clock

- Hardware function
    - simple clocks send hardware interrupts every voltage cycle of power supply
    - advanced clocks have own crystal oscillator which decrements a counter in a register. send hardware interrupt every time the counter is 0
- Software function
    - Maintains time of day (real time) — system boot time (backup cock) + uptime (ticks)
    - Stops processes from running too long — on every tick, decrement current process’ quantum
    - Accounts for CPU usage — on every tick, increment current process’ CPU time
    - Handle alarm syscall — on every tick, decrement alarm counter
    - Give the system watchdog/software timers — generate system notifications for synchronous alarms
    - Profile, monitor, gather statistics — on every tick, increment some set of counters
