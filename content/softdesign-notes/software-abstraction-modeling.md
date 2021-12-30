+++
title = 'Software abstraction & modeling'
+++
## Software abstraction & modeling
software engineering: the application of engineering to software. a programmer writes a complete program, a software engineer creates a component.

engineers abstract away from details that can be _safely_ ignored.

model: simplified/partial representation of reality, defined to accomplish a task or reach an agreement

abstraction: generalizing – setting aside specific and individual features

software design: creating models representing an abstract view of the system

### Models
what is a model?
* mapping feature: a model is based on an original
* reduction feature: a model only reflects a relevant selection of the original's properties
* pragmatic feature: a model needs to be usable in place of an original with respect to some purpose

consumer and intent influence the abstraction level of a model

descriptive models:
* a subject is described by the model
* sketches and throw-away models – short life time, used to better understand the reality
* models of ideas and vision about the system to be developed – to exploit model for having feedback before actually implementing the system
* models extracted from a running system or code – e.g. to visualize all calls between Java classes

prescriptive models:
* a model prescribes the subject
* the subject does not yet exist
* the models guide the development of the system
* most common consumers are code generators
* often used for development, so their importance may decay when the system is implemented

