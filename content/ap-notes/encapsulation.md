+++
title = 'Encapsulation'
+++
# Encapsulation
Encapsulation makes sure that sensitive stuff is hidden from users.

Idea: declare class variables/attributes as private, provide public getters and setters to use the variable.

```java
public class Safe {
    private String superPrivateInfo;

    public String getSuperPrivateInfo() {
        return superPrivateInfo;
    }

    public void setSuperPrivateInfo(String newInfo) {
        this.superPrivateInfo = newInfo;
    }
}
```

Classes can be:
- `public`: accessible by any other class
- default: only accessible in same package

Attributes/methods/constructors can be:
- `public`: accessible by any other class
- `private`: only accessible within declared class
- default: only accessible in same package
- `protected`: only accessible in same package and subclasses