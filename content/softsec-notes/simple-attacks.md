+++
title = 'Simple attacks'
+++
# Simple attacks
Program behavior depends on:
- code being run
- data being processed
- environment in which it runs
    - e.g. setting `$PATH`, `$HOME`

find a target:
- privileged code we can manipulate
- vulnerabilities:
    - deployment: privilege level, file access
    - implementation: input handling, error handling, assumptions on order of execution

File system attacks, e.g. symbolic links which aren't checked, or which can change between calls (time-of-check to time-of-use attack -- that's why `access()` is insecure)
- better to open file, then check using file handle
- or drop privilege whenever possible

Principle of least privilege: every program and privileged user of system should operate using the least amount of privilege necessary to complete the job
