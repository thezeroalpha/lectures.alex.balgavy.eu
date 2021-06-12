+++
title = 'Client-side: JavaScript'
+++
# Client-side: JavaScript
- interpreted, no compilation
    - interpreter is embedded in another app (browser)
- scripts operate in document/browser
- dynamically typed — untyped variables, typed values
- objects
    - an object is a set of properties
    - no classes!
    - a property is a unique-name key:value pair
    - created with a constructor:

		```js
		var ob = new Object();
		ob.testing = "test";
		```

    - deleted with delete:

		```js
		delete ob.testing;
		```

    - built in: window (browser window), document (page in window)
- DOM API (Document Object Model)
    - by W3C recommendations
    - works with document tree
    - functions from JS are called through HTML attributes
    - can add noes, remove nodes, change attributes
- Events
    - when should shit happen?
    - after page loads, while(forever) wait for event
    - predefined: click, mouseover, mouseon, mouseout, keypress, resize, scroll, etc.
    - write a function to respond to event, then subscribe/register/bind it
    - browser calls it when needed
    - event "bubbling": events execute from lowest node upwards
- AJAX (more like AJAJ or whatever, not really XML anymore, but AJAX sounds cooler)
    - recipe (always the same)

        1. Make initial page
        2. Set up event handlers

        3. When called, handlers do magic (request new data from server over HTTP in XML/JSON/whatever)

            - asynchronous, execution continues all the time, there's no wait for the server
            - shitty using XMLHttpRequest, better with jQuery
    - fast, easier for users
    - weak browser integration (e.g. back button), low search engine indexing, accessibility, response time, security
    - same origin policy: requests to other sites will be blocked, unless the target site opts in explicitly
    - some AJAX calls return HTML, others JSON (originally XML)
- libraries — jQuery
