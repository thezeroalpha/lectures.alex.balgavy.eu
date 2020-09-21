+++
title = "Lecture 5: application security - simple attacks"
+++

# Lecture 5: application security - simple attacks
## Buffer overflow

Example program:

```c
#include <stdio.h>
#include <string.h>
void hello(char *name) {
    char buf[16];           # limited space
    strcpy(buf, name);      # no limit on copied data => buffer overflow
    printf("hello %s\n", buf);
}
int main(int argc, char **argv) {
    hello(argv[1]);
    return 0;
}
```

Three types of memory:
- stack: stores local (non-static variables)
- heap: stores explicitly allocated memory (malloc, new)
- global: memory stores global and static variables

In the example, `buf` is on the stack.

Stack frames:
- functions reserve part of stack for own use ("stack frame")
- stores variables, frame pointer (caller's stack frame), return address, saved registers
- stack pushed to at call, popped from at return
- stack grows downward (high address to low address, pushes decrement the stack pointer by words (8 bytes))

The buffer overflow in the example overwrites the return address, so the program fails when jumping to an invalid address.

Terminology:
- fault: incorrect step, process, or data definition in program
- error: difference between computed/observed/measured value and true/specified/correct value (in example, corrupted return address and/or frame pointer)
- failure: inability of system/component to perform required function within specified performance requirement
- vulnerability: faults with security impact (in example, missing size check before `strcpy`)
- exploit: passing input to program that triggers vulnerability (in example, argument of length >15)
- exploit impact: denial of service (breaks availability), privilege escalation (breaks confidentiality and/or integrity)

## Local privilege escalation
Local attacks: attacker can already execute code, privileges are restricted -- you want to impersonate another user with higher privileges

UNIX permissions:
- read (for directory, listing)
- write (for directory, creating/deleting files)
- execute (for directory, access files)

Files are owned by a user and group.
Three sets of permission bits for user, group, and others.

Process:
- container for state of running program
- state includes user on whose behalf it runs (UID and GID)
- process can access files based on user
- process owner starts with shell for user who logged in, child process inherit user

Impersonation:
- sometimes user needs to legit access a secure file
- setuid/setgid bits: program runs on behalf of file owner

Setuid process has multiple UIDs:
- effective: used for privilege checks, changed by setuid
- real: actual user, not modified by setuid
- saved: lets process return to old UID

For local attacks, you usually target setuid root binaries, or operating system kernel.

## Simple attacks
Program behavior depends on
- code being run (well-configured system shouldn't let attackers supply code)
- data being processed (commonly supplied by attacker)
- environment where program runs (security policies, attacker able to change config?)

Performing an attack:
- find a target: privileged code we can manipulate, look for vulnerabilities
- deployment vulnerabilities: privilege level, file access, etc
- implementation vulnerabilities: incorrect input/error handling, wrong assumptions on order of execution

environment attacks:
- programs run inside processes
    - fork() starts a clone of the process, replace the program using execv().
    - easier ways: system() to run command string using shell, popen() also creates pipe to communicate with new program, execvp() looks up program using \$PATH
- the easier ways depend on the environment, which can be attacked (change \$PATH, \$HOME, inject commands/arguments, etc).
- solutions:
    - always watch out with user input: sanitize it, fail on unexpected inputs
    - escaping: make sure special characters are processed as regular characters

file system attacks:
- symbolic links allow a file to point to another file
- program may open file without checking that it's a symbolic link
- if it's setuid, you end up with privilege escalation

race conditions: time-of-check to time-of-use attack (what if permission at time of use differs from time of check? e.g. symlink changes)

principle of least privilege:

> Every program and every privileged user of the system should operate using the least amount of privilege necessary to complete the job.
