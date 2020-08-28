## How  
**lm.cookie.set**
```javascript
	/**
	 * Write a cookie
	 * @param  {String} cname		the cookie name to be written
	 * @param  {String} cvalue		the cookie value 		
	 * @param  {Number} exdays 		(optional) number of days before expiration
	*/
	lm.cookie.set = (cname, cvalue, exdays) => { /*...*/ }
```
### Parameters detail
**cname**  
It's the cookie name to be written  
⚠️ If this cookie already exists, it will be overwritten

**cvalue**  
The value stored in the cookie  
⚠️ The max length supported by cookies is 4096

**exdays**  
The number of days before the cookie expire  
If no value is given, the cookie expire with the session

### Return value
There is no return value

---
**lm.cookie.get**
```javascript
	/**
	 * Read a cookie
	 * @param  {String} cname     The name of the cookie to read
	 * @return {String}           Return the value of the cookie 
	*/
	lm.cookie.get = (cname) => { /*...*/ }
```
### Parameters detail
**cname**  
The name of the cookie you want the value  

### Return value
The value of the cookie you asked for  
If no cookie exist with that name, return an empty string


--- 
**lm.cookie.delete**
```javascript
	/**
	* Delete a cookie
	* @param  {String} cname     Le nom du cookie à supprimer
	*/
	lm.cookie.delete = (cname) => { /*...*/ }
```
### Parameters detail
**cname**  
The name of the cookie you want to delete

### Return value
There is no return value
