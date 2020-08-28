> To generate a select box without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl
<#import "../../macros/common/form/fields.ftl" as field>
```

## The new select macro

```java
<@field.select config/>
```

### specific options of macro select

```ftl
<#assign selectConfig = {
    "order": "select one item",
    "htmlTag": "fieldset",
    "size":"s"
} >
```

### Simple select

```ftl
<#assign selectConfig = {
    "order": "select one item",
    "values": [
        {
            "value": "value_1",
            "content": "content_1",
        }, {
            "value": "value_2",
            "content": "content_2",
            "disabled": true
        }, {
            "value": "value_3",
            "content": "content_3",
            "selected": true
        }
    ]
} >
```

### select with options group 

```ftl
<#assign selectConfig = {
    "order": "select one item",
    "values": [
        {
            "optGroupLabel": "myGroupLabel 1",
            "disabled": true,
            "options": [{
                "value": "value_1-1",
                "content": "content_1-1",
                "disabled": true
            }, {
                "value": "value_1-2",
                "content": "content_1-2"
            }]
        }, {
            "optGroupLabel": "myGroupLabel 2",
            "options": [{
                "value": "value_2-1",
                "content": "content_2-1",
                "disabled": true
            }, {
                "value": "value_2-2",
                "content": "content_2-2"
            }, {
                "value": "value_2-3",
                "content": "content_2-3",
                "selected": true
            }]
        }
    ]
} >
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_