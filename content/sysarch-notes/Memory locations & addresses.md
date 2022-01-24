+++
title = 'Memory locations & addresses'
+++
# Memory locations & addresses
memory has storage cells, each for one bit

bits are handled in groups — words

modern word length — 32 or 64 bits

32-bit can store four ASCII characters or 32-bit signed number in one word (4 bytes)

to retrieve a single item of info, an address is used

successive addresses refer to successive byte locations in memory (byte-addressable memory)

in a 32-bit processor, words are located at addresses {0, 4, 8, …}

two ways of assignment across words:

- big-endian: lower byte addresses are used for more significant (leftmost) bytes of the word (the end bit has the biggest address)
- little-endian: lower byte addresses are used for less significant bytes (the end bit has the lowest address)

alignment — if words begin at byte addresses that are a multiple of the byte length of a word
