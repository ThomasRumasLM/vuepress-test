> **To use the Accordion component, you have to import `assets/modules/_accordion.js`**. <br >

### File to import

```js
import Accordion from 'assets/modules/_accordion.js';
```

### How to use it

```js
lm.DOMReady(function () {
    const accMacro = {
        id: 'accMacro',
        mode: 'open', // optional
        defaultOpen: ['1', '2'] // optional
    };
    const AccordionInstanceMacro = new Accordion(accMacro);
});
```
