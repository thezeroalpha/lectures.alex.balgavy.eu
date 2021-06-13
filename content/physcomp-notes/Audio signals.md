+++
title = 'Audio signals'
+++
# Audio signals
## Representation
patterns of variations that represent/encode information

expressed in terms of waves — sinusoidal, sawtooth, triangle, square

waves have period, amplitude, frequency, wavelength
- period: T (sec)
- frequency: 1/T (per sec)
- wavelength: velocity/frequency (m)

## As functions
a function of time and volume (amplitude) — time t => s(t)

continuous if there is a volume for each point in time

speech is one-dimensional — only changes in time

an image is two-dimensional — has x and y

## Digitisation of signals
real signals are analog signals that are continuous in all dimensions

a computer has limited space and can’t process them

therefore, digitise — sampling + quantisation

Sampling

- has period/frequency, result in samples at specific points in time
- x axis is now discrete

Quantisation

- representation of real numbers with finite numbers of bits
- the more bits, the more information you can store

## Converting analog and digital
analog to digital converter (ADC) — converts from analog (continuous) to digital (discrete) signal

takes input analog and reference voltage, outputs the fraction of input voltage in reference voltage

digital-to-analog converter — ‘reconstruction'

## Digital representation
- Ts — sampling period
- fs — sampling frequency

a discrete signal is represented by a sequence of samples s[n]

s[n] = s(nTs)

## Shannon (Nyquist) theorem
the sampling rate must be at least twice the highest frequency

the highest useful frequency from an FFT is half of the sampling frequency

if it’s not obeyed and your sample rate is too low, you get aliasing (false data)
