> **To use the input counter component, you have to import `assets/modules/_forms.js`**.

So, if you have not already read it, **take a look [here](/Components/form/javascript/), it's a prerequisite**.

### File to import

```js
import { Formulaire } from 'assets/modules/_forms.js';
```

### How to use it

```js
lm.DOMReady(function () {
    let counterElement = document.querySelector('#counterElement');
    let counterInstance = new Formulaire(counterElement);
});
```

_You can take a look [here](/Components/form/javascript/)_