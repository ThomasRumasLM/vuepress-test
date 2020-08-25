> To generate a radio list without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl
<#import "../../macros/common/form/fields.ftl" as field>
```

## The radio list macro

> **WARNING** : Even for only one radio you have to use the radio list generator

```ftl
<@field.radioList config/>
```

### Options

```ftl
<#assign config ={
     "values" : [{
        "label" : string,
        "value" : string,
        "checked" : boolean,
        "variants": {
            "type": string, // Use "buttons" to transform radio into buttons
            "size": string, // default medium | available in "small"
            "width": string // Apply a grid column class
        },
        "CSSClass": string, 
        "suffix" : { 
            "label" : string,
            "cssClass" : string,
            "data" : {  
                "attribute" : "value"
            }
        }
    }]
}>
```

### Options to add an image in the check box buttons
The variants type must be set as 'buttons' to display an image
```ftl
    "config" : [{
        "values" : [
            {
                "value" : string,
                "label" : string, 
                "checked" : boolean,
                "image": string //add the url of the image
            },
    }]
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_
