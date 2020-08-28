> To generate a radio list without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl 
<#import "../../macros/common/form/fields.ftl" as field>
```

## The radio list macro

> **WARNING** : Even for only one radio you have to use the radio list generator

```ftl
 <@field.radioList config=unitRadio class="customClasses" data\-toto="dataCustom"/>
```

### Options

```ftl
<#assign config ={
     "values" : [{
        "name": "string",
        "label" : "string",
        "value" : "string",
        "checked" : boolean,
        "htmlTag" : boolean,
        "inline" : boolean,
         "innerData": {
            "data-test": "data-attribute",
            "class": "class-inner"
            },
        "variants": {
            "type": "string", // Use "buttons" to transform radio into buttons
            "size": "string", // default medium | available in "small"
            "width": "string" // old support=> put in innerData
        },
        "CSSClass": "string", 
        "suffix" : { 
            "label" : "string",
           "innerData": {
            "data-test": "data-attribute",
            "class": "class-inner"
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
            "image": string, //add the url of the image
            "innerData": {
            "data-test": "data-attribute-input",
            "class": "class-inner-input"
            }
        }
    ]
}]
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_