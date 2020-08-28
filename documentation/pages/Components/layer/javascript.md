> **To use the layer component**, you have to import its js file.


### File to import

```js
import {Layer} from 'assets/modules/_layer.class.js';
```

### How to use it

```js
myButton.addEventListener('click', () => {
    this.layer = new Layer({
        'content': `.js-layer-name`
    });
    this.layer.open();
});
```

