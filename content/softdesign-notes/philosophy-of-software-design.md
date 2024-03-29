+++
title = 'Philosophy of Software Design'
+++
# Philosophy of Software Design
## Summary of Design Principles
- Complexity is incremental, even small things make a difference
- Working code isn't enough, don't introduce complexity just to finish faster
- Make continual small investments to improve system design
- Modules should be deep (provide powerful functionality, yet have simple interfaces)
- Interfaces should be designed to make most common usage as simple as possible
- simple interace > simple implementation (for a module)
- General-purpose modules are deeper
- Separate general-purpose and special-purpose code
- Different layers should have different abstractions. If two adjacent layers have similar abstractions, there's probably a probem with class decomposition.
- Pull complexity downward, make life as easy as possible for the user
- Define errors (and special cases) out of existence (when they pop up)
- Design it twice, consider multiple options for each major design decision
- Comments should describe things that are not obvious from the code
- Software should be designed for ease of reading, not ease of writing
- Increments of software development should be abstractions, not features. It's ok to put off an abstraction until it's needed by a feature, but once it's needed, take the time to design it cleanly.

## Summary of red flags
- Shallow module: one whose interface is complicated relative to the functionality it provides
- Information leakage: when the same knowledge is used in multiple places (e.g. two different classes both understand format of a particular type of file)
- Temporal decomposition: execution order is reflected in the code structure, which can lead to information leakage
- Overexposure: if API for commonly used features forces users to learn about other features that are rarely used, it increases cognotive load on the users
- Repetition: if the same piece of code appears multiple times, you probably haven't found the right abstraction
- Special-general mixture: when a general-purpose mechanism contains code specialised for a particular use of that mechanism, which makes it more complicated and creates information leakage
- Conjoined methods: it should be possible to understand each method independently, and if you can't, that's a red flag
- Comment repeats code: if information in a comment is already obvious from the code, that comment is useless
- Implementation documentation contaminates interface: when interface documentation describes implementation details that aren't needed to use what's being documented
- Vague name: if variable/method name is broad enough to refer to different things, it doesn't convey much info to the developer
- Hard to pick name: if it's hard to find a simple name for variable/method that creates a clear image of the underlying object, the underlying object may not have a clean design
- Hard to describe: comment describing method/variable should be simple and complete. If that's hard, there may be a problem with what you're describing
- Nonobvious code: if meaning and behavior of code can't be understood when skimming, it's a red flag.
