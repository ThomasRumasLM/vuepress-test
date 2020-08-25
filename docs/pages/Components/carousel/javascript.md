> **To use the carousel component, you have to import its js file.**


### File to import

```js
import { Carousel } from "/assets/modules/_carousel.class.js";
```

### How to use it

```js
class DemoCarroussel extends lm.Composant {
constructor(id) {
    super(id);
    let _options = {
      container: '#js-my-carousel'
    };

    let slider = new Carousel(_options);
    }
}
```
