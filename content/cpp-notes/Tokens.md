+++
title = 'Tokens'
+++
# Tokens
## What is it?
a token is a sequence of characters that represents a unit

- float literals: 3.14, 0.274e2, 42
- operators: +,-,*,/,%
- parentheses: ()

tokenising is the first step of a compiler run

## Representing/storing tokens
storing as chars/strings is not handy, need to still be extracted

predefined types from C++, but nothing that suits a token. so define own with classes.

## Implementing tokens
token consists of kind and value. value is only used for numbers.

```cpp
class Token {
public:
  char kind;
  double value;
}

Token t,t2,t3; // declare tokens
t.kind = ‘+’;  // token 1 is a +
t2.kind=‘8’;   // indicating number
t2.value=3.14; // value
t3=t;          // copy initialisation
```

Now, `(1.5+4)*11` can be shown as:

<table>
<tr>
<td>'('</td>
<td>'8'</td>
<td>'+'</td>
<td>'8'</td>
<td>')'</td>
<td>'*'</td>
<td>'8'</td>
</tr>
<tr><td></td>
<td>1.5</td><td></td>
<td>4</td><td></td><td></td>
<td>11</td></tr>
</table>

## Using tokens
```cpp
Token get_token();
vector<Token> toks;

int main() {
    while (cin) {
        Token t=get_token();
        tok.push_back(t);
    }
}
```
