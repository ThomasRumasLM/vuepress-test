> To generate a checkbox list without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl
<#import "../../macros/common/form/fields.ftl" as field>
```

## The checkbox list macro

> **WARNING** : Even for only one checkbox you have to use the checkbox list generator

```ftl
<@field.checkboxList config/>
```

### Options

```ftl
<#assign config = {
    "name":"string",
    "label": "string",
    "suggest" : "string",
    "required" : boolean,

    "CSSClass" : {
        "wrapper" : "mu-mt-150"
    },
    
    "values" : [
        {
            "label": "string",
            "value": "string"
        },
        {
            "label": "string",
            "value": "string"
        },
        {
            "label": "string",
            "value": "string"
        },
        {
            "label": "string",
            "value": "string"
        }
    ]
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_
