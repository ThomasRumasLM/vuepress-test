> To generate a textarea field without need to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**

## File to import

Normally, **you already have imported this** :

```ftl 
<#import "../../macros/common/form/fields.ftl" as field>
```

## The textarea macro

```ftl
<@field.textarea config/>
```

### Specific options

```ftl
<#assign config ={
    "validation" : {
        "minlength" : number,
        "maxlength" : number
    }
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_