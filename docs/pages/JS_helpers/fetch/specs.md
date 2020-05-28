---
title: 'Specs'
order: 2
---

## How
**lm.fetch**
```javascript
	/**
	 * Make a fetch call and handle response through simple success/error 
	 * @param  {data} 	object 	An object containing method parameters
	 *  - {method} 		string 	GET or POST, default "GET"
	 *  - {url} 		string	the URL you want to call (mandatory)
	 *  - {headers}		object	a Headers object default headers: { "Content-Type": "text/html", "Cache": "no-cache" }
	 *  - {credentials}	string	how fetch handle cookie, default "same-origin"
	 *  - {success}		function 	Function called after the call has succeed
	 *  - {error}		function 	Function called after the call has failed
	 *  - {complete}	function 	Function called after the call has succeed or failed
	 *  All others parameters are added as the query parameters
	 */
```
### Parameters detail
**method**  
The method used for the call. Most frequently GET or POST  
https://developer.mozilla.org/fr/docs/Web/HTTP/M%C3%A9thode

**url**  
The URL you want to reach

**headers**  
If you need to change the request headers, you can provide them with a `new Headers({})` function  
https://developer.mozilla.org/en-US/docs/Web/API/Headers/Headers

**credentials**
By default the request is send with all the cookie form the same domain.  
If you need to not send no or all cookies, you can change this parameters according to documentation  
https://developer.mozilla.org/fr/docs/Web/API/Request/credentials

**success / error**
This methods are called after the request status is known  
The stream response from your request is passed in the `data` parameter, in the `fetchResult` parameter, you will have the status and headers of the request

**complete**
This methods is called after the success/error function has run 
The stream response from your request is passed in the `data` parameter, in the `fetchResult` parameter, you will have the status and headers of the request

### Return value
There is no return value, you can handle the response with the different success/error/complete method
