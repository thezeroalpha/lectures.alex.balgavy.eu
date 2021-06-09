+++
title = 'Process management'
+++
# Process management
Minimal shell:
1. Wait for command
2. Start process to execute command
3. Wait until process finished

`pid_t fork()`

- duplicates current process
- negative value — unsuccessful
- zero — returned to newly created child process
- positive — returned to parent or caller, value is PID of new process

`pid_t wait(int *wstatus)`

- waits for child processes to change state
- writes status to wstatus

`int exec(const char *path, char *constargv[])`

- loads new binary from path in current process
- constargv — program arguments
- last argument is NULL (e.g. constargv = {“/bin/ls”, “-a”, NULL})

signals

- processes may need to be interrupted
- a signal is sent to process that needs to be interrupted
- interrupted process catches signal using signal handler
- sighandler_t signal(int signum, sighandler_t handler)
    - registers signal handler
- unsignedint alarm(unsigned int secs)
    - deliver SIGALARM in seconds
- `int kill(pd_t pid, int sig)`
    - deliver signal to pid

pipes

- `pipe(fd)` sets up a pipe
- fd is array of 2 ints
