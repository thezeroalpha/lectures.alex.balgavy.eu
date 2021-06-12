+++
title = 'The Standard Library'
+++
# The Standard Library
## The minimal program
```cpp
int main() {}
```

Every program needs a main method. A nonzero return value indicates failure.

## Hello world
```cpp
#include <iostream>
int main() {
    std::cout << “Hello, world!\n”;
}
```

## The standard library namespace

Everything provided by the standard library needs a `std::` prefix. Either include headers and use prefix, or make everything global, such as this:

```cpp
#include <string> // include the standard string facilities
using namespace std; // make std names available without prefix
string s=“Ignorance is bliss!” // cool, string is std::string
```

But making everything global is generally in poor taste. Albeit easier.

## Output
By default, values to output are converted to a sequence of characters.
You can combine values in an obvious way:

```cpp
void f(int i) {
    cout << “The value of i is “;
    cout << i;
    cout << “.\n”;
}
```

To simplify it, you can use the result of an output expression for further output:

```cpp
void g(int i) {
    cout << “The value of i is “ << i << “.\n”;
}
```

## Strings
the standard library provides string concatenation, using the + operator.

```cpp
string s3 = “Hello “ + “world.” + “\n”;
cout << s3;
```

you can also append to a string:

```cpp
s1 = s1 + “\n”;    // verbose
s1 += “\n”;        // shorthand
```

manipulating substrings is also straightforward:

```cpp
string name=“Niels Stroustrup”;

string s=name.substr(6,10);    // s=“Stroustrup” — starting at 6, with a len of 10

name.replace(0,5,”Nicholas”);  // name becomes “Nicholas Stroustrup”
```

## Input
```cpp
int main() {
    string str;
    cout << “Please enter your name:\n”;
    cin >> str;
    cout << “Hello “ << str << “!\n”;
}
```

## Vectors
```cpp
struct Entry {
    string name;
    int number;
}

vector<Entry> phone_book(1000);    // Initial size: 1000
void print_entry(int i) {
    cout << phone_book[i].name << ‘ ‘ << phone_book[i].number << ‘\n’;
}
void add_entries(int n) {
    phone_book.resize(phone_book.size()+n);
}
```
