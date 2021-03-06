+++
title = 'Personas, Scenarios, and use cases'
+++

## Personas, Scenarios, and use cases
### Goal directed design
Design activity that links requirements to implementation (what do you need, why? what are you solving?)

Generally, you have marketers, decision makers, and developers making decisions, and the result is shit.
What's missing is the user's perspective: goals, actions, motivations, responses, and the context (how it fits into the user's wider activities)

Design interactions - mental models
The user's mental model is not the implementation model, the user has to adapt to understand the implementation.
It's better if design model is good fit for user model (unless it hides important features)

Steps in design process:
* Research users: observation, interview, etc
* Discover non-user goals (business, technical, whatever else)
* Develop personas
* Use personas in scenarios to establish design requirements
* Find the functional requirements - use cases

Users react to a product on 3 levels:
* Visceral - the user's _immediate_ reaction before even using the product, should trigger emotional responses that are appropriate
* Behavioural - we need design that fits where the user currently is with knowledge, assumptions, and mental models
* Reflective - integrating product and its values into wider life, and if done well, you get brand loyalty

User goals:
* Experience: how the user wants to feel (visceral)
* End goals: what the user wants to do
* Life goals: who the user wants to be

Non-user goals:
* Customer goals (the customer is _not_ the user, like corporate IT buyers)
* Business/organisational goals (increasing profit, market share, reducing costs, increase QOS)
* Technical goals (maintaining security, cross-platformness, backwards compatibility)

User stories & goals:
* As a <type of user> I want <some goal> so that <some reason>
* As a <persona> I want <action> so that <expected outcome>
* When <situation> I want to <motivation> so I can <expected outcome>

### Personas - archetypal users
Modelling users: identify major goals and behaviours, then build models of idealised users ("personas")

There isn't an 'average user', you use personas that capture important characteristics of users.

Persona:
* Demographic details: name, occupation, age
* Personal details: short biographical summary
* Attitudinal details: mental model, pain points, feelings about stuff that has to be done
* Goals and motivations: for using the product (maybe for life in general™)
* Behavioural details: how they act when using the product
* generally about half a page in length

Why?
* Coordination, getting a shared vision of the users and market
* Communication between devs, designers, marketers, other stakeholders
* Determining functionality and behaviour o product
* Help design decisions without testing on users
* they work. you don't focus on edge cases but on normal use, avoids the self-referential user (developers thinking users are like them), and avoids the elastic user (cuz users won't bend to your will, they don't give a shit)

### Scenarios
Informal narrative descriptions:
* describe human activities in short stories
* You can explore needs, requirements, contexts
* Don't explicitly mention tech
* Are written in the users' language (well, english in our case)
* Have varying levels of detail
* You focus on the user's perspective

### Design Requirements & principles
1. Establish needs & goals
    * what info do users need?
    * what capabilities?
    * what goals must be achieved (business, technical)?
2. Brainstorm
    * time-limited, like half an hour
    * write them _all_ down
    * no criticism allowed
    * ideas are culled and refined later

Don't make the user feel stupid.
Define what the product will do before designing how.

### Use Case
Focus on user-system interaction instead of user's task itself.
Describe processes as text or use case diagram

structure:
* users are actors - user types or categories
* use case consists of:
    * header:
        * name of use case
        * goal of use case
        * scope and level use case is covering
        * preconditions
        * success/failure conditions
        * trigger that starts use case
        * notes on performance, frequency, etc.
    * steps (each assumed to be successful):
        * description narrative
        * variations
        * notes
    * exceptions
        * notation is per step
