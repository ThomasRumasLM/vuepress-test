## How to use

The **get-font-size()** SCSS function only accept 2 params:

* **type** : Define the type of font-size you need `text` or `title`
* **size** : Depending on the selected type, declare the size you want.

```scss
.my-element {
    @include set-font-scale('07', 'm');
}
```
To go into the detail of sizes, you read the [typography foundation](/Foundations/Typography).<br /><br />

The **bold()**, **regular()** or **light()** SCSS functions define the weight of the font you need `light`, `regular` or `bold`.

```scss
.my-element {
    font-weight: get-font-weight('bold');
}
```

### Good to know

The **get-font-size()** SCSS function use `$title-size` and `$font-size` variables which define sizes of title or text.

These variables are available in the following file : `_common/01-setting-tools/_font.variables.scss`
