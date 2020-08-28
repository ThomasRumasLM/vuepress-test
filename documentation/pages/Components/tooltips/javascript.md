> **To use the tooltips componen**t, you have to import its js file.


### File to import

```js
import { Tooltip } from "assets/modules/_tooltip.class.js";
```

### How to use it

```js
class Tooltip extends lm.Composant {
constructor(id) {
    super(id);
    
    let TooltipsModule1 = new Tooltip({
    element: ".js-tooltip1", 
    onOpen: () => { console.log('open') }, 
    onClose: () => { console.log('close') } 
    });

    new Tooltip({ element:".js-tooltip2" });
    }
}
```
