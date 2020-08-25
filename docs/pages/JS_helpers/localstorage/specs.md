## How  

**lm.localStorageLM.init**  
```javascript
	/**
	 * This function check if the key exist 
	 * If it exists, all the data inside are checked with their expire date and old one are cleaned
	 * If not, the key is created with an empty object
	 * 
	 * @param  {String} LMDataKey		the key to init/clean
	*/
	lm.localStorageLM.init = (LMDataKey = 'LMData') => { /*...*/ }
```
### Parameters detail
**LMDataKey**  
_(optional)_  
Its the key you want to init and clean
Default "LMData"
⚠️ This method is called by `common.js`, use it only if you _need_ to use another key

### Return value
There is no return value


--- 
**lm.localStorageLM.get**
```javascript
	/**
	* Read the value stored in localstorage
	* 
	* @param  {String} key     		The key you want to get the value
	* @param  {String} type    		If you want to select in wich storage you check Default 'localstorage'
	* @param  {String} LMDataKey    If you want to select in wich localstorage object you check Default 'LMDataKey'
	*
	* @return {*} 					Return "" or the value stored
	*/
	lm.localStorageLM.get = (key) => { /*...*/ }
```
### Parameters detail
**key**  
localStorage are key/value pair  
you give the key you get the value

**type**  
_(optional)_  
If you have stored your data in session storage you need to specify it

**LMDataKey**  
_(optional)_  
If you dont have store your data in the default object, you need to specify the object you used


### Return value
Return the value store in the corresponding storage if it exist
If no value exist, return an empty string and log a warning in your console


--- 
**lm.localStorageLM.set**
```javascript
	/**
	* Write a value in localstorage
	* 
	* @param  {String} key     		The key you use to store your value
	* @param  {*} value     		The value you want to store
	* @param  {String} expire     	The number of days before expiration, Default 1
	* @param  {String} type     	If you want to select in wich storage you write Default 'localstorage'
	* @param  {String} LMDataKey    If you want to select in wich localstorage object you write Default 'LMDataKey'
	*
	* @return {*} 					Return the value you stored
	*/
	lm.localStorageLM.set = (key, value) => { /*...*/ }
```
### Parameters detail
**key**  
The key you want to use to store your value  
you'll need it to retrieve the value with the get method

**value**  
The value you want to store  
⚠️ The value is stringified when stored

**expire**  
_(optional)_  
The number of day before expiration
If the expiration is passed, the key/value pair will before delete on the next init call 

**type**  
_(optional)_  
If you want to store your data in sessionStorage you need to specify it

**LMDataKey**  
_(optional)_  
If you don't want to store your data in the default object, you need to specify the object you want to use

### Return value
Return the value stored after writing it


--- 
**lm.localStorageLM.delete**
```javascript
	/**
	* Delete a key stored in localstorage before its expiration date
	* 
	* @param  {String} key     		The key you want to delete
	* @param  {String} type     	If you want to select in wich storage you write, Default 'localstorage'
	* @param  {String} LMDataKey    If you want to select in wich localstorage object you write, Default 'LMDataKey'
	*/
	lm.localStorageLM.delete = (key) => { /*...*/ }
```
### Parameters detail
**key**  
The key you want to delete from your storage

**type**  
_(optional)_  
If you want to delete your data in sessionStorage you need to specify it

**LMDataKey**  
_(optional)_  
If you want to delete a data not stored in the default object, you need to specify the object you want to use


### Return value
Return the new object after your deletion


--- 
**lm.localStorageLM.exist**
```javascript
	/**
	* Verify if a key exist in your storage
	* 
	* @param  {String} key     		The key you want to check
	* @param  {String} type     	If you want to select in wich storage you check, Default 'localstorage'
	* @param  {String} LMDataKey    If you want to select in wich localstorage object you check, Default 'LMDataKey'
	*
	* @return {Boolean} 			Return true if the key was found, false otherwise
	*/
	lm.localStorageLM.exist = (key) => { /*...*/ }
```
### Parameters detail
**key**  
The key you want to check

**type**  
_(optional)_  
If you want to heck your data in sessionStorage you need to specify it

**LMDataKey**  
_(optional)_  
If you want to check a data not stored in the default object, you need to specify the object you want to use

### Return value
Boolean


--- 
**lm.localStorageLM.getExpireDate**
```javascript
	/**
	* Get the expiration date of a specific key
	* 
	* @param  {String} key     		The key you want the expiration date 
	* @param  {String} type     	If you want to select in wich storage you check, Default 'localstorage'
	* @param  {String} LMDataKey    If you want to select in wich localstorage object you check, Default 'LMDataKey'
	*
	* @return {Number} 				Return a timestamp coresponding to the expiration date
	*/
	lm.localStorageLM.getExpireDate = (key) => { /*...*/ }
```
### Parameters detail
**key**  
The key you want the expiration date 

**type**  
_(optional)_  
If you want to heck your data in sessionStorage you need to specify it

**LMDataKey**  
_(optional)_  
If you want to check a data not stored in the default object, you need to specify the object you want to use


### Return value
Return a timestamp coresponding to the expiration date
