> To generate an input HTML tag without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl 
<#import "../../macros/common/form/fields.ftl" as field>
```

## The input macro

```ftl
<@field.input config/>
```

### Options

```ftl
<#assign config ={
    "type" : "", // required | https://developer.mozilla.org/fr/docs/Web/HTML/Element/Input
    "icons": string, // You can pass the icon name you want
    "size": "s",
    "validation" : {
        "criterions" : { // Multicriteria object
            "Minimum 8 letters" : "pattern",
            "One uppercase" : "pattern"
        }
    }
    "inputmode" : "", // change the default keyboard mode | https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_