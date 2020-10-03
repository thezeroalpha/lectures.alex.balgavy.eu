+++
title = "Lecture 10: Web attacks"
+++

# Web attacks
## Authentication
Which is the best way to auth web users?
- IP address based: IP source can be spoofed, NAT can cause multiple users to have same IP, same user can have different IP (e.g. because of DHCP renewals)
- HTTP-based: hard to scale and manage at app level
- Cert-based: works for SSL-based, but few users have real certificates or know how to use them
- Form-based: form data might be sent as cleartext

Basic auth:
- form used to send username and password over SSL channel to server-side app
- the app:
    - verifies credentials (e.g. by checking database)
    - generates session authenticator, sends it back to user as part of header
- next time browser contacts same server, includes authenticator
- better auth: generate random value, store with other session info in file or backend db
- if app includes authenticator in URL, browsers may leak info as part of "Referer" field (which btw can also be spoofed for attacks if used for auth)
- authenticators shouldn't be long lived

Attacking authentication
- eavesdropping credentials/authenticators
    - if HTTP connection not protected by SSL, can be eavesdropped
    - name and pass sent as part of HTTP basic auth exchange
    - auth included as cookie, URL param, or hidden field in form
    - setting 'secure' flag on cookie is good way to prevent accidental info leaking
- bruteforce or guess credentials/authenticators
    - if authenticators have limited value domain (like 4 digits), can be bruteforced
    - if chosen in non-random way, can be easily guessed (sequential session ID, user-specified password)
- bypass authentication (session fixation, SQL injection)
    - weak pass recovery procedures can be leveraged to reset password to known value
    - session fixation forces user's session ID to known value (e.g. by passing session ID in URL)

## Authorization
Authorization: what can a user do?

attacks:
- path/dir traversal attacks: break out of document space with relative paths (`GET /show.php?file=../../../etc/passwd`)
- forceful browsing:
    - web app dev assumes application will be accessed through links
    - user is not bound to follow prescribed links, can jump to any publicly available resource
- automatic directory listing abuse: browser may return listing of directory if there's no index
- parameter manipulation
    - resources accessible are determined by params to query
    - if client-side info blindly accepted, one can modify parameter to get more information
- parameter creation
    - if params from command line blindly imported, one might modify behavior of application (like adding `&admin=1` to the end)
- PHP `register_globals`
    - makes request info (GET/POST vars and cookies) available as globals
    - vars can be provided so that unexpected execution paths are followed
    - vars could be set regardless of condition checks
    - all vars should be initialized/sanitized along every path
    - check `php.ini` or `.htaccess` to make sure of its state
- server misconfiguration
    - FTP and web sometimes run on same host
    - if data can be uploaded with FTP and requested with Web server, you can run programs using CGI and run commands using Server-Side Include

## Command Injection attacks
Main problem:
- wrong or no validation of user input that lets you run commands on the server
- use of unsanitized input to compose strings passed to function that can eval code or include code from a file

Server-side includes (SSI)
- simple interpreted server-side scripting language
- lets you introduce directives into web pages as `<!-- #element attribute=value attr2=val2 ... -->`, run when included
- can use `exec`! so a user can run any command. for example, by adding directive `<!-- #exec cmd="cat /etc/passwd" -->`

PHP's `allow_url_fopen` allows URLs when including files with `include()`/`require()`, if user input used for this then bad

HTML injection:
- injection of HTML tags can be used to change behavior of web page
- with iframe tags, browser forced to access malicious web page

How do you survive? Don't trust user input, use built-in sanitization functions.

## SQL injection
Input validation error where SQL queries built using unsanitized parameters provided by users.

For example, if logins are verified by checking with a database like this:

```asp
var sql = "select * from user_accounts \
    where username = '" + username + "' and \
    password = '" + password + "'";
```

If you enter `' or 1=1 --` as the username, you get this query, returning the whole table:

```sql
select * from user_accounts where username='' or 1=1 --' and password="
```

SQL injection can modify any type of query (SELECT, INSERT, UPDATE, DELETE)

With MySQL, double-dash comment requires the second dash to be followed by at least one whitespace/control character.
You can use subqueries to get more info, e.g. `(select version())` as one of the fields in an INSERT query.
If results aren't seen immediately, see if they are reflected somewhere else on the page.

Number of columns in query can be determined by using `UNION SELECT NULL`, `UNION SELECT NULL, NULL`, etc. progressively longer.
Type of columns can be determined by adding e.g. a string to the `UNION SELECT`.

To determine table/column names, rely on database-specific techniques.
Want to look at metadata tables, schema tables, etc.

Second Order SQL injection
- SQL code injected into app, but statement invoked at later time
- even if app escapes single quote, second order may be possible
    - attacker sets username to `john'-`, app escapes value to `john''-`
    - at later point, attacker changes pass and sets a new pass for victim John, creating new SQL command with unsanitized data

Blind SQL injection (when no output/error from web app)
- prohibiting display of error messages is typical countermeasure, but blind injection might still work
- when looking for vulnerability, 1=1 is always true. so similarly, use AND statement to check if other properties are true.

Dealing with SQL injections
- don't let client-supplied data modify SQL statements
- stored procedures: isolate apps from SQL, put the statements on the database server
- prepared statements: compiled before user input is added