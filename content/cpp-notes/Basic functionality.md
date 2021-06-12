+++
title = 'Basic functionality'
+++
# Basic functionality
## Variables
```cpp
int inch;
bool answer=true;
```

## Fundamental types
- integral: boolean (bool), character (char), integer (int)
- arithmetic: floating-point (double), integral types
- user-defined types: enumeration (enum) and classes
- absence of information (void)

from these, you can construct:
- pointer types (int*, char*,…)
- arrays (int[], char[], …)
- reference (double&), data structures

## Operators
- arithmetic: +, -, /, *, %
- comparison: ==, !=, <, >, <=, >=
- ‘put to’: <<
- ‘get from’: >> — type accepted depends on the right-hand operand

## Tests (conditionals)
```cpp
// simple function that asks user to proceed
bool accept() {
    cout << “Do you want to proceed (yN)?\n”;
    char answer=0;
    cin >> answer;

    if (answer == ‘y’) return true;
    return false;
}

// more complex function, with a switch statement
bool accept2() {
    cout << “Do you want to proceed (yN)?\n”;
    char answer=0;
    cin >> answer;
    switch (answer) {
    case ‘y’:
        return true;
    case ’n’:
        return false;
    default:
        cout << “Whatever, it’s a no.\n”;
        return false;
    }
}
```

## Loops
```cpp
while (condition) {
    // execute code
    // opt. increment iterator
}

for (int i=0; i<10; i++) {
    // execute code
}
```

## Pointers & arrays
- array declaration:
	```cpp
	char v[10];    // array of 10 chars, with 0 as lower bound
	```
- pointer declaration:
	```cpp
	char* p;    // pointer to a char element
	```
- setting a pointer:
	```cpp
	p = &v[3];    // p points to address of index 3 of array v
	```
