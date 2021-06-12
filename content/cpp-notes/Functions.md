+++
title = 'Functions'
+++
# Functions
defined by types of input parameters, its name, type of return value, and algorithm that computes return value from input values

example:

```cpp
int add(int a, int b) {
  return a+b;
}
```

when a function is called, thread of execution continues within code of function

as soon as it returns, code that called the function continues
a function returns if:
1. It reaches a return statement
2. It reaches the end of its code block

a void function is allowed to reach end of its code block

a function that has a return value must reach a return statement or throw an exception

## Parameters
parameters in declaration of function are called *formal parameters*
parameters in call of function are called *actual parameters*

Rules of thumb:
1. Use pass-by-value for small objects
2. Use pass-by-const-reference for large objects that you don’t need to modify
3. Return a result rather than modifying parameter through reference
4. Use pass-by-reference only when you have to — when there’s no alternative

pass-by-value:

- copies actual parameters into formal parameters
- formal parameters in function can’t modify anything outside the function
- happens by default
- inefficient with large parameters
- `void print(vector<double> v) {}`

pass-by-const-reference

- passes address of values (reference)
- efficient, no copying of data
- safe, parameter is const and can’t be overwritten
- `void print(const vector<double>& v) {}`

pass-by-reference

- if we want to modify contents of parameters, pass by reference
- `void init(vector<double>& v) { v[2]=2; }`
