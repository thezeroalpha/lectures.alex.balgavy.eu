+++
title = 'Namespaces'
+++
# Namespaces
Scopes: global, class, function, local, statement

Namespaces help distinguish between identical variable names from different contexts.

## Using
using declaration:

- `using std::string` — “when I write string, I mean std::string”
- specific to one function/class

using directive:

- `using namespace std` — “when you can’t find a name in this scope, look in std”
- can be dangerous, you might not get what you’re looking for
