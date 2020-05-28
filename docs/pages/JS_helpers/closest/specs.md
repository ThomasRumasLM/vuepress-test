---
title: 'Specs'
order: 2
---


## How
**lm.getClosest**
```javascript
	/**
	* Go up into the DOM tree searching for a parent matching the given selector parameter
	* @param  {Object<Element>} 	elem    		Starting element
	* @param  {String} 				selector     	Parent selector
	* @return {Object<Element>}         			Return the first matching ancestor or false
	*/
```

### Parameters detail
**elem**  
It's the starting element from which you search for an ancestor in the DOM tree.
It must be a DOM Element.

**selector**  
A string containing a selector expression to match elements against.

### Return value
Return the first DOM Element found in the DOM tree
If no Element was found, return false
