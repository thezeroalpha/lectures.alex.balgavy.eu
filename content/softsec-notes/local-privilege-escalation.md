+++
title = 'Local privilege escalation'
+++
# Local privilege escalation
UNIX permissions:
- read (or list files in directory)
- write (or create/delete files in directory)
- execute (or access files in directory)

Files are owned by user and group.

Three sets of permission bits for user, group, and others.

Processes:
- OS creates process for a running program
- state includes user on whose behalf it runs
- process can access files based on user
- user/group determined by: first shell for user who logged in, then inherited from parent processes

Impersonation:
- when user has legitimate need to access a secured file
- setuid/setgid bits: program runs on behalf of file owner
- a setuid process has multiple UIDs and GIDs:
    - effective (EUID): for privilege checks, modified by setuid
    - real (RUID): actual user, not modified by setuid
    - saved (SUID): lets process return to old uid
- UID manipulation in C:
    - `setuid(uid)`: sets RUID, EUID, and SUID to `uid`
    - `seteuid(id)`: sets EUID to `uid`
    - `setresuid(ruid, euid, suid)`: sets all three
    - any target UID is allowed only if EUID is 0
