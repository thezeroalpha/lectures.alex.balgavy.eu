+++
title = 'Format strings'
+++
# Format strings
e.g. in `printf`.

`printf` looks at registers, then stack.
- if user controls format string, can leak info
- `%P$c`: read character at position P
- `%n`: stores corrent length of string. use `$` and width modifiers to write data to some address

arbitrary write!

