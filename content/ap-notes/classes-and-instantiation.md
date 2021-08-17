+++
title = 'Classes and instantiation'
+++
# Advanced Programming
Classes have the form:

```java
public class ClassName {
}
```

Instantiate classes with `new`:

```java
ClassName instance = new ClassName();
```

The name of the Java file should match the class name.
One (main) class per file.

Access variables via dot syntax: `car.brand`

Instance variables are declared in the body of a class.
`static` variables and methods are class variables/methods.

Constructors are public, and have the same name as the class:

```java
public class Main {
    int x;

    public Main() {
        x = 42;
    }

    public static void main(String[] args) {
        Main myMain = new Main();
        System.out.printf("The constructor sets the value: %d", myMain.x); // 42
    }
}
```

There are no destructors, as Java is garbage-collected.