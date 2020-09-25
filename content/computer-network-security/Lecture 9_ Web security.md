+++
title = "Lecture 9: Web security"
+++

# Lecture 9: Web security
## Overview
Requests:
- request is composed of header and optional body separated by CRLF
- header contains method, resource, protocol version, other info
- body is considered as byte stream

Resource can be specified by absolute URI or absolute path.
In HTTP/1.1, Host field is required to specify server to receive request.
HTTP/2 lets server to push content (respond with data for more queries than client requested).

Replies:
- composed of header and body separated by CRLF
- header contains protocol version, status code, diagnostic text, other info
- body is a byte stream

Header fields:
- general: refer to message (date, pragma, cache-control, transfer-encoding, etc.)
- request: accept (MIME type), host, authorization, from, if-modified-since, user-agent, referer, etc.
- response: location, server, www-authenticate
- entity: allow (methods that can be invoked), content-encoding, content-length (required if body not null), content-type (MIME type of body), expires, last-modified

URIs
- syntax: {scheme}://{authority}{path}?{query}
- can be absolute or relative

Authentication
- simple challenge-response theme
- challenge returned by server as part of 401 reply, specifies auth schema to be used
- auth request refers to realm (set of resources on server)
- client must include Authorization header field with required valid credentials
- examples:
    - Basic HTTP auth:
        - server replies to unauthorized request wit 401 message containing header field: `WWW-Authenticate: Basic realm="ReservedDocs"`
        - client retries access including in header a field containing cookie composed of base64 encoded username and password: `Authorization: Basic <token>`
    - HTTP1.1 auth:
        - defines additional auth scheme based on cryptographic digests
            - server sends nonce as challenge
            - client sends request with digest of username, password, given nonce value, HTTP method, and request URL
        - to authenticate users, web server must have access to plaintext user passwords
    - WebAuthn

Maintaining State
- HTTP is stateless, but many apps require maintaining state across requests
- ways:
    - embedding information in URLs: app embeds user-specific info in every link contained in page returned to user
    - putting information in forms: use hidden input tags, contains names/values
    - cookies: set by server by including Set-Cookie header, cookies are passed in every further transaction with the site, accessible only by site that set them
    - sessions: implemented at app level, at the beginning of session a unique ID is generated for the user, and is used to index info stored on server side

## Server side
Common Gateway Interface:
- mechanism to invoke programs on server side
- program's output returned to client
- input parameters passed using URL in GET, or using body in POST
- programs can be written in any language
- input to program passed to process' stdin
- parameters passed by setting environment variables (REQUEST_METHOD, PATH_INFO, QUERY_STRING, CONTENT_TYPE, etc.)

Active Server Pages (ASP, ASP.NET)
- Microsoft's version of CGI scripts
- pages containing mix of text, HTML tags, scripting directives (VBScript, JScript), server-side includes
- directives executed on server side before serving page

Servlets, JavaServer pages
- Servlets: Java programs executed on server, similar to CGI programs, can be executed within existing JVM without making new process
- JavaServer pages (JSP): static HTML intermixed with Java code, similar to ASP, compiled into servlets

PHP:
- scripting language embedded in HTML pages
- PHP code executed on server side when page containing code request
- common setup is LAMP (Linux+Apache+MySQL+PHP)

Web Application Frameworks
- provide support for fast development of web apps
- might be based on existing web servers, or have a new environment
- often based on Model-View-Controller architecture
- provide automatic translation of objects from/to database
- provide templates for generating dynamic pages

## Client side
Java applets:
- compiled Java programs downloaded into browser and executed in context of web page
- access to resources regulated by implementation of Java Security Manager
- dead

ActiveX controls
- binary, native code downloaded and executed in context of page
- only supported by Windows-based browsers
- code signed using Authenticode mechanism
- once executed, complete access to client's environment
- dead

JavaScript/JScript, EcmaScript/VBScript
- scripting languages for dynamic behavior in web pages
- JS initially introduced by NetScape, JScript is Microsoft's version
- EcmaScript standardised version of JS
- VBScript is based on Microsoft Visual Basic

asm.js:
- subset of JS allowing for fast code
- can use special compiler passes to e.g. translate C to asm.js

webassembly
- low-level bytecode for in-browser client-side scripting
initial aim to support compilation from C and C++
- initial implementation support in browsers based on feature set of asm.js

Code is embedded into HTML pages using script tag.
Window is top of hierarchy of objects.
DOM (Document object model) lets your script manipulate content.
BOM (Browser object model) is interface to browser's properties.

JS security policies:
- same origin: JS code can only access resources (e.g. cookies) associated with same origin/host
    - every frame in browser's window is associated with domain (origin = URI scheme, hostname, port number)
    - web browser only lets scripts contained in web page A to access data in web page B if they have the same origin
    - even iframes/included scripts execute within frame domain
- signed script: signature on JS code is verified and principal identity extracted; principal identity compared to policy file to determine level of access
- configurable: user can manually modify policy file to allow/deny access to specific :/methods for code from specific sites

Site isolation
- site-dedicated processes, with browser process as interface
- cross-origin read blocking: stop access to specific types of data

AJAX (asynchronous JavaScript and XML)
- way to modify page based on result of request, without need of explicit user action
- relies on JS-based DOM manipulation, and XML-HTTP request object
- using `onreadystatechange` property of XML-HTTP request, set callback for result of query

Possible attacks:
- bug in renderer process
- universal cross-site scripting bugs let attacker bypass same origin policy
- side channel attacks like Spectre/RIDL let attacker read arbitrary renderer process memory
