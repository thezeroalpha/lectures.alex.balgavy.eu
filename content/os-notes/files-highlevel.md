+++
title = 'Files'
+++
# Files

Files:
- abstraction of storage device (possibly real)
- can read/write
- starts at root dir “/"
- absolute (/Users/user/Documents) and relative (../Documents) paths

File permissions:

- throuh bit permission tuples (read-write-execute)
- x for directories is something like ‘cd'

Special files:

- everything is a file (descriptor)
- hardware: block (disks), character (serial port)
- symlinks to link to other files
- named/anonymous FIFOS (sockets/pipes)

Pipes:

- pseudofiles for processes to communicate over FIFO channel
- has to be set up in advance
- looks like a “normal” file