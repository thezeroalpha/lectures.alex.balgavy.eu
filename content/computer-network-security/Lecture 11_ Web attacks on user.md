+++
title = "Lecture 11: Web attacks on user"
+++

# Lecture 11: Web attacks on user
## Accessing user info
User info can be accessed in many ways:
- drive-by-download attacks let malicious server execute arbitrary commands on user's host
- host under control of attacker can impersonate legitimate security-critical server
- JS code can be injected in a page to steal critical info associated with web app (cross-site scripting)

### Cross-site scripting (XSS)
Used to bypass JS's same origin policy.
- reflected attacks
    - injected code reflected off web server, like in error message or search result
    - essentially in any response that includes some of input sent to server as part of request
    - for example, if server uses requested path in HTML of error page, you can embed `<script>` tags with JS in the requested path
- stored attacks
    - injected code permanently stored on target servers, e.g. in database, forum, visitor log, comment field
    - two-step: first store the code as part of a message, then victim downloads and executes code when page containing attacker's input is viewed

Preventing XSS:
- every piece of data returned to the user that can be influenced by inputs *must be sanitized*
- languages often provide routines for this
- sanitization is different depending on where data is used
- follow some rules:
    1. never insert untrusted data except in allowed locations
    2. HTML escape before inserting untrusted data into HTML element content
    3. attribute escape before inserting untrusted data into HTML common attributes
    4. JS escape before inserting untrusted data into HTML JS data values
    5. CSS escape before inserting untrusted data into HTML style property values
    6. URL escape before inserting untrusted data into HTML URL attributes
- use `httponly` in cookie -- means cannot be accessed through client side script
- [XSS prevention cheat sheet](http://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet)

### Cross-site request forgery (CSRF/XSRF)
Allows attacker to execute requests on behalf of victim.
Embed a request in e.g. an image tag on a malicious page, like:

```html
<img src="http://bank.com/transfer.php?amount=100000&dest=52345235" />
```

It's a "confused deputy attack":
- deputy == browser
- confused so that it uses victim's authority to do what attacker says

Preventing CSRF:
- CSRF tokens:
    - HTML only:
        - web server embeds token (secret unique per request) in all HTML forms, verified on server side
        - every legit request will have it
        - token may be generated using any method ensuring unpredictability and uniqueness
    - Header-based for web apps with JS
        - on login, app sets cookie containing random token that remains for whole session
        - JS on client side reads value, copies into custom HTTP header sent with each transactional request
        - server validates presence
        - only JS running in same origin will be able to read the cookie

## HTTP response splitting
Exploits fact that user provided data is in header of reply.

For example, a redirect header includes the location.
If that's added verbatim, the attacker might be able to add terminating CRLFs to build a second header.
This poisons the web cache, associating the attacker-generated reply with the address.

HTTP request smuggling is possible in a similar way.

## Language problems
There are also language-specific vulnerabilities.
PHP:
- infers types, could lead to issues
- people might do loose comparisons (`==`) instead of strict (`===`)

Pyhon pickle
- serialization library
- pickle can handle arbitrary objects, including `subprocess.Popen`
    - can't do this directly in Python
    - but pickle allows pickling arbitrary objects with a `__reduce__` method returning string or tuple of callable and argument tuple
- you can pickle a `subprocess.Popen` that calls a shell
- if server unpickles header/body, you own it
