---
title: 'How to use'
order: 2
---

## How to use

The **add-separator()** SCSS mixin is a separator pseudo-element to an html element.

```scss
.my-element {
    @include add-separator( $position: 'top', $color: 'pink', $height: '3px');
}
```

### Good to know

The **add-separator()** is a mixin, but you can also use it as a function, like this:

```scss
.my-element {
    @include add-separator( $position: 'top', $color: 'pink', $height: '3px'){
        margin: 1rem 0;
    };
}
```

The variable is available in the following file: `_common/01-setting-tools/_separator.mixins.scss`
