+++
title = 'Recursion'
+++
# Recursion
Recursion: when a method calls itself…how would you use that? will explain, let’s start with something everyone here knows

Used for quicksort and divide and conquer algorithms.
Divide and conquer:
1. Divide problem into smaller ones
2. Compute subproblems recursively
3. Combine partial results to overall solution

## Factorial — n!
Everyone here knows what the factorial is.

Important definition — 1! = 1. may seem obvious, but very important, because lets us get definite answer for the factorial of a number.

For this example, let’s choose a nice round number. 5.

`5! = 120`. How do we know that? `5*4*3*2*1`

so `5! = 120 = 5*4*3*2*1`

but the mathematicians here know that:
- `5! = 5*4! = 5*4*3! = 5*4*3*2! = 5*4*3*2*1!. 1!=1` from definition, therefore
- `5! = 5*4*3*2*1 = 120`


## Java implementation — recursion

Keep that in mind. Now, Java code which you can follow along with. Do any of you know ternary operator? No…I will write expanded. Otherwise, ternary operator.

```cpp
public class Factorial {
	public static void main(String[] args) {
		System.out.println(fact(5));
	}

	public static int fact(int n) {

		// Done simply using ternary operator:
		// return (n==1)? 1 : n*fact(n-1);

		if (n==1) {
			return 1; // If n is 1, return 1
		}

		else {
			return n*fact(n-1); // Otherwise, return n times factorial of a number one less
		}
	}
}
```

In the else statement, there is *recursion*. The method fact is calling itself. If you don’t understand what that does yet, let me show it to you.

## Code flow explanation
Indentation shows different levels of execution within the program.

Method main runs and asks the factorial method — what is fact5?

```
main: fact(5)?

fact:
fact5 - 5*fact4 - fact4?
fact4 - 4*fact3 - fact3?
fact3 - 3*fact2 - fact2?
fact2 - 2*fact1 - fact1?
     fact1 - 1 (‘if’ part of statement runs)
fact2 - 2*1 - return 2
fact3 - 3*2 - return 6
fact4 - 4*6 - return 24
fact5 - 5*24 - return 120

main: fact(5) = 120
```

Basically, it’s just a huge stack of the method calling itself over and over again until it hits the ‘if’ part of the statement (until n is 1) and returns a specific value, and that’s passed back along the stack until you get a concrete result. That’s recursion.

## Ruby implementation

```ruby
def fact n
     return n==1? 1 : n*fact(n-1)
end

puts fact(5)
```
