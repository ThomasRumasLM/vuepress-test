> To generate a tooltip without having to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**.

## File to import

```ftl
<#import "../../macros/common/tooltip.ftl" as tooltips>
```

## The tooltip macro

```html
<@tooltips.tooltip options = tooltipOptions>
``` 

### Specific options

```ftl
<#assign tooltipOptions = {
    "jsClass":"js-tooltips", //if you want a click behavior.
    "text":"string",
    "position":"bottom",
    "customClass":"m-mon-context",
    "onlyOnClick":"false",
    "iconPosition": "right",
    "displayOnTextHover": "false"
}/>
```

🍄 **Bonus** :

_If you add a_ `"customClass":"m-mon-context"` _it creates automaticaly a_ `"customClassIcon":"m-mon-context__icon"` _on the svg tag_
