## How to use

>  Build a **macro that generate a layer** that must be present inside your initial DOM.  
>  *(Probably because some information are present in your data model)*

## File to import

```ftl
<#import "../../macros/common/layer.ftl" as layers>
```
<br >

## The Layer macro

```ftl
<#assign layerOptions = {
    "content": "js-layer-name"
    "title": "My title",
    "icon": "id-icon", //optional
    "cssClass": {
        "layer": "", //optional
        "header": "", //optional
        "body": "", //optional
        "footer": "" //optional
    },
    "footer": {
        "firstButton": { //optional
            "label": "Button label",
            "class": "my-custom-class", //optional
            "config": {}  // Use same config as macros/common/button.ftl
            "dataAttributes":  //optional
            {
                "data-XXXXX": "data-value", // (e.g. data-cerberus)
                "other-attribute": "value" // (e.g. aria-label)
            }
        },
        "secondButton": { //optional
            "label": "Button label 2",
            "class": "my-custom-class", //optional
            "config": {} // Use same config as macros/common/button.ftl
            "dataAttributes":  //optional
            {
                "data-XXXXX": "data-value", // (e.g. data-cerberus)
                "other-attribute": "value" // (e.g. aria-label)
            }
        }
    }
}>
```

> Then you can use the macro to **build your layer**.

```ftl
<@layers.layer options=layerOptions>
    LAYER CONTENT  
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla voluptas reiciendis, voluptatum, consequuntur officia assumenda esse placeat earum commodi nostrum, ratione magni dolorum ad voluptates, magnam excepturi odit iste iure.
</@layers.layer>
```
