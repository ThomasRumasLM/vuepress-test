> To generate a carousel without having to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**.

## File to import

```ftl
<#import "../../macros/common/carousel.ftl" as carousel>
```

## The carousel macro

```html
<@carousel.carousel options = carouselOptions />
``` 

### Specific options

```ftl
<#assign carouselOptions = {
    "id":"js-my-carousel",
    "showOnHoverNav":true,
    "navSize":"l",
    "bevel":"right-l",
    "cssClass" : {
        "container" : "col-12"
    }
```
