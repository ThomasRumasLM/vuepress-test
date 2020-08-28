---
title: 'Specs'
order: 2
---

## How
**lm.delegateEvent**
```javascript
	/**
	 * Allow to delegate event in vanilla while keeping the event.target as the element targeted with the selector
	 * @param  {String} eventName   The listened event name Ex: 'click'
	 * @param  {String} selector 	The selector necessary to match to trigger the event function 
	 * @param  {String} fn 			The function excecuted when the event is triggered
	*/

```
### Parameters detail
**eventName**  
The name of the event type to be listened

**selector**  
A selector used to define the descendent triggering the event
The handler is called only when the originalTarget is a descendent matching this selector

**fn**  
The function that will be executed when event is triggered  
Get the native event object as param  
event.target is overwritten to be the element targeted by the provided selector

### Return value
There is no return value
