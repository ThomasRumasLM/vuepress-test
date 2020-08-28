> To generate a checkbox list without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```java 
<#import "../../macros/common/form/fields.ftl" as field>
```

## The checkbox list macro

> **WARNING** : Even for only one checkbox you have to use the checkbox list generator

```java
 <@field.checkboxList config=configDemo class="myClass" data\-anything="myAttribute"/>
```

### Options

```json
<#assign configDemo = {
    "name":"string",
    "label": "string",
    "suggest" : "string",
    "htmlTag" : "string",
    "formInline": boolean,
    "required" : boolean,

    "innerData": {
        "data-truc": "data-on-li",
        "class": "class-on-li"
    },
    
    "values" : [
        {
            "label": "string",
            "value": "string",
            "innerData": {
                "data-truc": "data-on-li",
                "class": "class-on-li"
            },
            "suffix": {
            "label": "(33)",
            "innerData": {
                "data-test": "data-attribute-suffix",
                "class": "is-invalid"
                }
            }
        },
        {
            "label": "string",
            "value": "string",
            "disabled": boolean
        },
        {
            "label": "string",
            "value": "string",
            "checked": boolean
        },
        {
            "label": "string",
            "value": "string"
        }
    ]
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_