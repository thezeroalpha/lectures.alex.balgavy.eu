+++
title = "Physical: Basis for data communication"
+++

# Physical: Basis for data communication
information can be transmitted by varying voltage on a wire

a link has properties:

- bit rate: bits per second, depends on channel’s bandwidth
- delay: how long it takes a bit to get to the end of the link
- error rate: probability of bit flipping
- bandwidth: analog (cutoff frequency in Hz) or digital (max data rate in bits per sec)

there are some limits to how data can be transmitted:

- bandwidth-delay product: bits have a physical size on the channel
    - a channel can store (bit rate × delay) bits
- signal has a finite propagation speed, noise increases, and the signal is attenuated by km
- lower bandwidth limits the harmonics that can be transmitted (and decreases quality, as seen in Fourier analysis)
- a channel has a maximum data rate
    - Nyquist (perfect noiseless channel):
        - 2B log2V bits/sec
        - B bandwidth
        - V number of signal levels)
    - Shannon (more realistic):
        - B log2(1 + S/N) bits/sec
        - B bandwidth
        - S/N signal strength to noise ratio
