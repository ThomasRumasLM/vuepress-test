> **To use the upload component, you have to import `assets/modules/_forms.js`**. <br >
So, if you have not already read it, **take a look [here](/Components/form/javascript/), it's a prerequisite**.


### File to import

```js
import { Form } from 'assets/modules/_forms.js';
```

### How to use it

```js
lm.DOMReady(function () {
  let formId = document.querySelector('#js-formId');
  let formInstance = new Form(formId);
});
```

_You can take a look [here](/Components/form/javascript/)_
