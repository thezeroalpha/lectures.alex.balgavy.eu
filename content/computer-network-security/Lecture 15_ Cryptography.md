+++
title = 'Lecture 15: Cryptography'
template = 'page-math.html'
+++

# Lecture 15: Cryptography

Allows secure comms between parties when an attacker can intercept/modify their messages.
Goals:
- confidentiality: message between parties can't be read
    - in apps, ideal is end-to-end encryption (only sender and recipient have key)
- integrity: message between parties can't be changed without them finding out
    - in apps, digital signatures (not valid if message or sender changes)
- authentication: attacker can't impersonate a party
- non-repudiation: a party can't deny that they sent a message
    - use asymmetric digital signatures

Terms:
- plaintext: readable text to be transmitted
- ciphertext: unreadable text actually sent
- encryption: converting plaintext into ciphertext
- decryption: recovering plaintext from ciphertext

Kerckhoffs' Principle: when encrypting, separate algorithm from key. Assume attacker knows algorithm, keep key secret

Caesar cipher: shift letters in alphabet by a fixed amount
- attacks: bruteforce, frequency analysis (some letters more common in natural languages)

Cryptographic hashes:
- hash function maps message (arbitrary length) to hash (fixed length), should be computationally hard to reverse
- often used to identify message, because it's hard to find message with same hash
- properties:
    - pre-image resistance: given hash, hard to find message that hashes to it
    - second pre-image resistance: given message, it's hard to find another message with the same hash
    - collision resistance: hard to find any two messages that have the same hash
- well-known types: old and insecure (MD5, SHA-1), SHA-2, SHA-3

Random numbers:
- CPUs are deterministic so can't generate truly random numbers
- Pseudo-random number generator (PRNG) computes number from seed, which is updated for every generated number

Blockchain:
- Bitcoin: decentralised digital currency using blockchain
- each block of transactions contains hash of previous block, so can't change past transactions without changing later ones
- real chain is what more than 50% of users agree on

Perfect encryption:
- never reuse the key
- key is perfectly random
- no information is leaked from ciphertext

## Symmetric cryptography
Uses single key to encrypt and decrypt.
Properties:
- provides confidentiality
- signature schemes provide integrity and authentication

One-time pad:
- assume we have message and key both with n bits
- encrypt: ciphertext = msg ⨁ key
- decrypt: msg = ciphertext ⨁ key
- holds because ciphertext ⨁ key = msg ⨁ key ⨁ key = msg ⨁ 0
- provides perfect encryption because doesn't leak any information (0 bit could be 0⨁0 or 1⨁1 with equal probability)
- breaks if key is reused

Stream ciphers:
- use PRNG to generate key for one-time pad
- initial seed becomes real key

Block ciphers:
- divide data in blocks
- perform computation using key to map plain block into cipher block

Cipher block chaining:
- make each block depend on the previous one
- for first block, use initialization vector instead (doesn't have to be secret, shouldn't be reused)

Padding:
- if message sizes not multiple of block size, must be padded
- don't add zeros, because impossible to recover original if it ends with zeros
- instead, pad with bytes containing padding length

Signatures:
- message authentication code is signature for message
- combine key with message and apply hash function
- key needed to generate and to validate code
- provides integrity and authentication, but not non-repudiation (any verifier can sign)

## Asymmetric cryptography
Uses two keys: anyone encrypts with public key, only owner decrypts with private key

RSA:
- sender generates public and private key together
- public key available to anyone, private key kept secret
- mathematically not viable to derive d from e
- to generate key, generate large number _m_, public key _e_, private key _d_ such that: $(n^{e})^{d} = n \enspace (\text{mod $m$})$ for any _n_
- relies on difficulty of writing _m_ as product of prime number factors
- special random padding
- only works for data that fits inside key size
- signatures:
    - to sign, compute hash of message and encrypt hash with private key
    - to verify, compute hash of message and decrypt with signer's public key, then compare with encrypted hash received from signer

## Key management
Symmetric: key distribution center:
- one trusted party which shares symmetric keys with all others
- Kerberos is a system for key communication, but need constant access to center and is single point of failure
- possible to establish key without sending any revealing info (e.g. Diffie-Hellman Key Exchange)

Asymmetric:
- Certification Authority (CA)
    - issues certificates, keeps revocation list of certificates that may be compromised
        - X5.09 certificates containing e.g. identity of holder, public key of holder, expiration date, signature from CA
    - verifies identities of users
    - typically company that must be trusted
- Self-signed certificate:
    - signed with own private key
    - can be made by anyone so not trusted by default

## SSL and HTTPS
SSL (Secure Sockets Layer) ensures crypto protection for network connection on top of TCP (aka TLS)
Goals:
- end-to-end encryption, Diffie-Hellman to create shared key
- authenticates using X5.09 certificate (prevents MITM attack)
- typically doesn't authenticate client

## Password storage
Hash password when storing.

Bruteforce solutions:
1. Use salted hash:
    - when storing password, generate random string and concatenate with password before hashing
    - store salt with hash.
2. Use slow hash: e.g. apply hash 1000 times

