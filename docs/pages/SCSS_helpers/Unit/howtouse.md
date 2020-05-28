---
title: 'How to use'
order: 2
---

## How to use

The **px-to-rem()** SCSS function only accept a `number` value which represent a pixel value.

```scss
    .my-element {
        max-height: px-to-rem(220); // Convert 220px to a rem value
    }
```

### Good to know

The **px-to-rem()** SCSS function use `$magic-unit` variable which define the default rem value for all the website.

The variable is available in the following file : `_common/01-setting-tools/_magic-unit.variables.scss`
