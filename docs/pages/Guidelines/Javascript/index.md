---
title: 'Javascript'
order: 3
---

# Javascript

✔️ Every selector **shoud use a `js-` prefixed class**
_Unless the element contains an attribute ID or name_

```javascript
document.querySelector('.js-my-hanlder');

document.querySelectorAll('.js-my-handler');

document.getElementById('js-my-uniq-handler');
```

✔️ To define a state, **use a state class**
```javascript
myOpenerButton.addEventListener('click', () => {
    myBlock.classlist.add('is-open');
});
```

✔️ My class should start with a capital letter
```javascript
class MyClass {
    // Constructor
}
```

✔️ Every function and classes **have a JSDoc**
```javascript
/**
 * description
 * @param {type} name description
 * @param {type} name description
 * 
 * @returns {type} Explain what's return
*/
```

Prefer utility function for a better maintenability

✔️ 
```javascript
if (isValid) {
    // Do something
}

let isValid = (param) => {
    if (param !== null && param > 0 && param < 99 && typeof param === `number`) {
        return true;
    }
    else {
        return false;
    }
}
```
❌ 
```javascript
if (param !== null && param > 0 && param < 99 && typeof param === `number`) {
    // Do something
}
```

✔️ Export only what's necessary
```javascript
export const x;
const y;
const z;
```
