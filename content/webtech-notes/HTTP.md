+++
title = 'HTTP'
+++
# HTTP
a request-response protocol

client is a user agent (browser), server is an application process running on a different computer

URI: uniform resource identifier

- URN: uniform resource name
    - unique name for resource (like a book's ISBN)
    - relies on some authority to provide information
- URL: uniform resource locator
    - location on the web
    - expect HTTP GET request to provide information about this resource
- a modern form is IRI (international resource identifier) which can also include unicode characters, not just ASCII

URLs:
`http://www.example.org:5678/a/b.txt?tc=win&r=10#para5`

- contain
    - authority
        - host (FQDN, fully qualified domain name)
        - port
    - request-URI
        - path
        - query
    - fragment
- browser connects to authority over TCP
- request-URI included in start line (/ is default)
- fragment is not sent to server, used to scroll user's view

Content negotiation

- multiple representations via the same URI
- client-server negotiation determines what shows up

Request methods

- GET: get documents, no body in request
- POST: e.g. when you click submit, form information is included in the boyd
- HEAD: requests only the header fields to be returned

Request example:

```
GET /test.html HTTP/1.1
HOST: [www.example.org](http://www.example.org)
…
```

Response example:

```
HTTP/1.1 200 OK
Date: <timestamp>
```

Header fields are included in the requests, like:

- user agent
- referrer
- content type
- acceptable MIME types (data types like text/html, image/png, vide/mp4)
- character encoding (most popular being UTF-8 encoding of unicode)

HTTP response codes:

- three-digit number
- first digit is the class
    - 1: information
    - 2: success
    - 3: redirect
    - 4: client fucked up
    - 5: server fucked up
- other two digits are extra information

HTTP servers:

- initially, there weren't that many, mostly FTP in the 90s
- then, NCSA made httpd for free, and promptly fucked off to work on Netscape (stopping all support)
- so developers started making patches, and turned it into "a patchy server"…the Apache server
- a main loop for a server looks like so:

	```
	while forever
	listen on TCP port 80
	read request
	send response
	```

- the server doesn't know its own hostname, because host names may be on the same machine (virtual hosts) and different responses may be needed for different hostnames
- the server uses a config file to determine where "/" is (the document root)
