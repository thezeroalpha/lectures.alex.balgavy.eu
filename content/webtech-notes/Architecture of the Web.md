+++
title = 'Architecture of the Web'
+++
# Architecture of the Web
- biggest info system ever
- success because flexible & incremental
    - layers on top of already functional layers

REST (Representational State Transfer)

- key principles
    - all sources are resources, uniquely accessible via URI
    - clients & servers need to know:

        1. URI of resource
        2. Allowed actions (GET, POST, HEAD...)
        3. Allowed representations (text/html or others)

    - client doesn't need to kno how server generates representation
    - server doesn't need to know how client renders content
    - neither have to be aware of intermediate proxies
    - there is no HTTP communication state (response doesn't depend on previous request, no side effects)
        - delete/put are unsafe but idempotent
        - get and similar are safe
        - post needs warning, can happen multiple times
- typical HTTP requests
    - GET data
    - POST (e.g. submit form)
    - PUT (update info)
    - DELETE
