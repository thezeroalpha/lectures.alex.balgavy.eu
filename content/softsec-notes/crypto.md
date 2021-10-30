+++
title = 'Crypto'
template = 'page-math.HTML'
+++
# Crypto
Allows secure communication between two or more parties in presence of an attacker

Goals:
- confidentiality: Eve can't read Alice's message to Bob
- integrity: Eve can't alter Alice's message without Bob finding out
- authentication: Eve can't convince Bob she is Alice
- non-repudiation: Even can't deny she sent a message to Bob

Terms:
- plaintext: readable text
- ciphertext: unreadable text actually sent
- encryption: convert plaintext to ciphertext
- decryption: convert ciphertext to plaintext

Kerckhoff's principle:
- separate algorithm from key
- assume attacker knows algorithm
- keep key secret

Can't make the plaintext space larger ⇒ use a larger key space
- instead of shifting by fixed amount, generate random permutation, mapping each letter to an arbitrary other one → 26! possible keys

Attacks:
- brute force
- frequency analysis: some letters much more common than others, such as 'e' and 'a' in English

End-to-end encryption: only sender and recipient have key

Cryptographic hashes:
- hash function maps message (arbitrary length) to hash (fixed length)
- computationally hard to reverse -- "one-way function"
- pre-image resistance: hard to find message m such that hash(m)=h
- second pre-image resistance: given message m1, hard to find another message m2 such that hash(m1)=hash(m2)
- collision resistance: hard to find any two messages m1 and m2 that have same hash

Well-known hashes:
- MD5: collision resistance long broken
- SHA-1: collision resistance recently broken
- SHA-2: collision resistance probably secure for some time
- SHA-3: eliminates some theoretical weakness of earlier hashes

Random numbers
- CPUs are deterministic, so can't generate truly random numbers without special hardware
- pseudo-random (PRNG): compute from seed, seed updated for every generated number
- sequence is often predictable

Blockchains:
- each block of transactions contains hash of previous block
    - ⇒ can't change past transactions without changing later ones
- real chain is what above 50% of users (by compute power) agree on

## Symmetric crypto
Uses single key to encrypt and decrypt.

One-time pad:
- n-bit message, n-bit key
- XOR key with message to encrypt/decrypt

Perfect encryption
- never reuse key
- key is perfectly random
- e.g.: one-time pad

Stream ciphers:
- use PRNG to generate key
- initial seed is now real key

Block ciphers:
- divide data in blocks
- compute using key to map each plain block into cipher block
- e.g. DES, AES

Cipher block chaining (CBC)
- ECB still reveals repetitions, allows ordering blocks
- CBC: make each block depend on previous one
- first block: use initialization vector (IV) instead
    - doesn't need to be secret
    - shouldn't be reused

Padding blocks:
- message sizes often not multiple of block size
- must be padded with extra bytes containing padding length
- add block of padding even if multiple of key size

Padding oracle attack:
- assumptions: attacker can send encrypted message, server decrypts message and return error if padding incorrect, server uses block cipher with CBC
- under these conditions, attacker can decrypt last block
    - take: Dk decryption function with key k, n number of ciphertext blocks, Pi and Ci the plaintext and ciphertext block i
    - $P_{n-1} = D_{k} (C_{n-1}) \oplus C_{n-2}$
    - if we modify penultimate block of ciphertext ($C_{n-2}$), we change plaintext that server sees for last block ($P_{n-1}$)
    - example:
        1. Write bytes of ciphertext c0-c15, plaintext p0-p15
        2. send c0..c7 ⨁ b...c15, for each b ∈ [0, 256)
            - because block size 8, c7 is used to compute p15
        3. find that only b=0 (unchanged) and b=2 work
            - so p15 ⨁ 2 = 1 (length 1 padding)
            - so p15 = 1 ⨁ 2 = 3
            - so plaintext has 3 bytes of padding
            - so p13 = p14 = p15 = 3
        4. Now send c0...c4 ⨁ b, c5 ⨁ 7, c6 ⨁ 7, c7 ⨁ 7...c15
            - 7 because 3 (plaintext) ⨁ 4 (new padding length) == 7
            - c4 used to compute p12, because block size 8
        5. Find thatonly b=0x36 works
            - so p12 ⨁ 0x36 = 4 (legnth 4 padding)
            - so p12 = 0x36 ⨁ 4 = 0x32 = ASCII "2"
        6. Now send c0...c3 ⨁ b, c4 ⨁ 0x37, c5 ⨁ 6, c6 ⨁ 6, c7 ⨁ 6...c15
            - 6 because 3 (plaintext) ⨁ 5 (padding) == 6
            - 0x37 because 0x32 (plaintext) ⨁ 5 (padding) == 0x37
            - c3 used to compute p11 (because block size 8)
            - only b=0x31 works
            - so p11 ⨁ 0x31 = 5 (length 5 padding)
            - so p11 = 0x31 ⨁ 5 = 0x34 = ASCII "4"
        7. etc.

Symmetric signatures/message authentication code
- if message altered, no longer valid
- key needed to generate valid
- same key needed to validate


## Asymmetric crypto
Two keys:
- anyone can encrypt with Bob's public key
- only Bob knows private key, needed to decrypt

Example is RSA

## Key management
Cannot trust Bob to tell Alice public key online:
- either provide public key through separate trusted channel
- or get trusted third party to authenticate keys

Key distribution center (KDC):
- trusted party
- shares symmetric keys with all others
- verifies identities of key owners

Certification authority (CA)
- asymmetric crypto alternative to KDC
- issues certificates to verify identities
- keeps revocation list of certificates that may be compromised
- we need to trust these companies
- X5.09 certificates contain identity, domain name(s), public key, expiration date, signature from CA

Symmetric encryption key establishment
- agree on key e.g. via Diffie-Hellman Key Exchange

SSL and HTTPS
- SSL (also known as TLS) is layer on top of TCP
- any TCP protocol can be modified to run on top of SSL (e.g. HTTP ⇒ HTTPS)
- end-to-end encryption: Diffie-Hellman to create shared encryption key
- authenticate server using X5.09 certificate
- typically does not authenticate client (server can do this in application layer)

Password storage
- hash the password
- to make brute forcing harder:
    - salt the hash (concatenate password and salt before hashing, store salt with the hash)
    - use a slow hash, which slows down brute forcing but not normal use
