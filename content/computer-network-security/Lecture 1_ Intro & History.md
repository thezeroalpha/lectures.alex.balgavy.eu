+++
title = "Lecture 1: Intro & History"
+++
# Lecture 1: Intro & History
## QUANTUM - the NSA is always watching
SSO (special source operations site) connected to internet router sees the "QUANTUM tasked" packet to a legitimate server, forwards it to TAO's FOXACID server
- TAO: tailored access operations (NSA project)
- FOXACID: NSA's "exploit orchestrator" that can attack target computers in different ways

Then, FOXACID injects a URL into the packet and sends back to computer, often beating the legitimate packet reply back.
The server checks if the target browser is exploitable, and if yes, it sends exploit back to target.

QUANTUM affects linkedin, youtube, facebook, twitter, and basically everything else.
Oh and the NSA also has partners in other countries, so they cover other national services too.

First stage:
- VALIDATOR: backdoor Trojan on Windows that contacts a Listening Post, allows it to add more sophisticated malware
- OLYMPUSFIRE: software implant on Windows, gives complete access, essentially adds your computer to a botnet

**The lesson:** many security threats start in the network, such as this one, where a legitimate reply was spoofed

## Security
Combination of:
- confidentiality (privacy)
- integrity (consistency)
- availability

Systems are made by people, so they're not perfect.
Some apps work as designed but contain vulnerabilities.

Security *error*: made by human
Security *bug*: consequence of error (also "vulnerability"), can be "exploited", compromising the security of the system

## Security analysis
Determining the security of the system, wrt:
- set of known design guidelines
- set of known security problems
- its environment

## Some history
Started with phone phreaking and "Captain Crunch" (John Draper), who used the whistle that comes in boxes of Capn Crunch to authorise long-distance calls.

The Morris worm:
- consisted of main program and bootstrap program
- first step:
    - buffer overflow in `fingerd`, bug in `sendmail` program allowing commands to be executed
    - sucks in bootstrap program from infecting machine
- second step: bootstrap program compiled and run, fetching precompiled version of main program
