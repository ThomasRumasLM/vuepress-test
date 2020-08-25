> To generate a file uploader without having to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**.

## File to import

Normally, **you already have imported this** :

```ftl
<#import "../../macros/common/form/fields.ftl" as field>
```

## The upload macro

```ftl
<@field.upload config/>
```

### Specific options

```ftl
<#assign config ={
    "validation" : {
        "size" : 2000,
        "accept" : "image/png, image/jpg, image/jpeg",
        "maxItems": 6
    }
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_
