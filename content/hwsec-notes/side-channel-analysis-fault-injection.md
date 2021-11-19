+++
title = 'Side Channel Analysis & Fault Injection'
+++

# Side Channel Analysis & Fault Injection
## Side channel analysis
An attacker with physical access can use the device side effects to leak sensitive info.

### Power side channel analysis
Computation works using transistors, so we can see based on changing power what's happening.

Measuring power trace: PC communicates with target and oscilloscope, which measures power usage on the target.
Put a shunt resistor between power supply to pin of chip that it uses to power up, and measure voltage across the resistor.

Alternative: electromagnetic probes, no physical modifications needed, but not as accurate measurement. Another advantage, can be placed above parts of a chip that you want to monitor.

Simple power analysis: comparing power consumption on success/fail.

Power consumption is proportional to the number of transistors switching.
Power consumption is proportional to the hamming weight of processed data.
- Hamming weight: number of bits set to 1 in a number.

E.g. to attack AES, you can guess some key bytes, and then compute the correlation between the guessed Sbox output's hamming weight and the power trace samples. Only one will always correlate, leaking the secret key byte.
- but need to ensure power traces are aligned

## Fault injection
An attacker with physical access can disrupt operating conditions to bypass security checks.

All chips require specific conditions to work correctly (e.g. voltage), and if you don't respect them, you get glitches.

Many different ways to glitch: clock fault injection, electromagnetic fault injection, lasers, physical probing...
