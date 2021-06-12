+++
title = 'Separate compilation'
+++
# Separate compilation
as soon as project grows to multiple files, compilation must be managed

files involved depend on one another, updating one causes others to be recompiled

## make
- the first Unix tool to automate compile-and-build process
- reads a makefile, which describes dependencies
- also reads timestamps to determine which file is newest
- only re-compile the stuff that depends on a newer file

### makefile entries
syntax is as follows:

```
target: *list of sources*
	command of recipe steps (compilation)
```

has to be indented with a single tab, unless you set `.RECIPEPREFIX` like in [this article](https://tech.davis-hansson.com/p/make/).

can set variables and use them like in bash, for example for compiler or flags

wildcard: % (example: %.o)

automatic variables:

- $@ — filename of the target
- $< — filename of first prerequisite

### phony targets
`.PHONY`: can declare a phony target so that the target is run even if a file of the same name exists in the directory.

e.g.:

```make
.PHONY: clean
clean:
	rm *.o temp
```

### example:

```make
CC=g++
CFLAGS= -std=c++11 -stdlib=libc++ -Weverything

all: bank

account.o: account.h account.cpp
    $(CC) $(CFLAGS) -c account.cpp

bank.o: bank.cpp bank.h account.o
    $(CC) $(CFLAGS) -c bank.cpp

main.o: main.cpp bank.o
    $(CC) $(CFLAGS) -c main.cpp

bank: bank.o main.o
    $(CC) $(CFLAGS) main.o bank.o account.o -o bank

clean:
    rm *.o bank
	```
