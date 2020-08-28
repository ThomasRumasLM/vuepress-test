## How to use

>  Build a **macro that generate a popin** that must be present inside your initial DOM.  
>  *(Probably because some information are present in your data model)*

## File to import

```ftl
<#import "../../macros/common/common-macro.ftl" as macros>
```
<br >

## The Popin macro
> You have to specify the **title** in a config variable. This is the only required variable

```ftl
<#assign conf = {
    "title": "Popin tilte",
    "subTitle": "Popin sub-title",
    "footerHTML": "<button>Close</button>",
    "cssClass": {
        "popin" : "my-popin"
        "header" : "my-popin__header",
        "inner" : "my-popin__inner",
        "content" : "my-popin__content",
        "footer" : "my-popin__footer"
    },
    "desktopSize": "l",
    "fullscreen": true,
    "blocked": true,
    "role": "dialog"
}>
```

> Then you can use the macro to **build your popin**.

```ftl
<@macros.popin conf>
    POPIN CONTENT  
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla voluptas reiciendis, voluptatum, consequuntur officia assumenda esse placeat earum commodi nostrum, ratione magni dolorum ad voluptates, magnam excepturi odit iste iure.
</@macros.popin>
```

## Custom Header
> Alternatively, you can specify a whole custom header, thus overwriting title, subTitle and native close button.

```ftl
<#assign conf = {
    "headerHTML": "<h1>my custom title</h1><div class=''>other custom tags</div>"
}>
```
