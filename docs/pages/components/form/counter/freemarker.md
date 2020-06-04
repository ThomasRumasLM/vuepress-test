> To generate an input counter without having to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**.

## File to import

```ftl 
<#import "../../macros/common/form/base.ftl" as inputCounter>
```
<br >

## The upload macro

```ftl
<@inputCounter.input counterConfig />
```

### Specific options

```ftl
<#assign counterConfig ={
     "counter" : {
        "step" : 1
    },
    "validation" : {
        "pattern" : "[0-9]+([\\.,][0-9]{1,2})?",
        "mismatch" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "missing" : "Veuillez renseigner un nombre valide compris entre 0 et 10",
        "min" : "0",
        "max" : "10"
    }
}>
```

_Of course, those options are additionnal to the common ones available [here](/Components/form/freemarker/)_
