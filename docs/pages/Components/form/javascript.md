> **Documentation provide you a way to validate your form** using HTML5 validation override with javascript to allow us to customize feedback messages and its appearance to respect our design brand system

> **Documentation provide progressive enhancement on some element** like select, textarea or file uploader to give better feedback on form filling status  

> **Documentation provide custom element** like quantity counter and all their behavior

> **Documentation provide captcha handling** for securing your forms
## File to import

```javascript
import { Form } from '../assets/modules/_forms.js';
```
**This module imports all these field scripts** :
  
_Form validation module_
* `_validation.js`

_Input type specific behavior_
* `_select.js`
* `_upload.js`
* `_textarea.js`
* `_captcha.js`
* `_counter.js`

## How to use

Until the form module is imported you have to declare a `new Formulaire()` with the ID to select the form HTML Tag.

```html
<form id="my-form">
    <!-- All your form elements -->
</form>
```

```javascript
import { Form } from '../assets/modules/_forms.js';

let myForm = document.querySelector('form#my-form');
let formInstance = new Form(myForm);
```
