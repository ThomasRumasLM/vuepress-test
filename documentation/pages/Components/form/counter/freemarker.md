> To generate an input counter without having to think about HTML semantic, accessibility or validation message and criteria, you can use **freemarker macros**.

## File to import

```ftl 
<#import "../../macros/common/form/fields.ftl" as inputCounter>
```

## The upload macro

```ftl
<@inputCounter.counter counterConfig />
```

### Specific options

```json
<#assign counterConfig ={
    "cerberusInput" : "INPUT_quantity", // to set cerberus on input
    "cerberusBtnMinus" : "BTN_quantity_less", // to set cerberus on minus button
    "cerberusBtnPlus" : "BTN_quantity_plus", // to set cerberus on plus button
    "label": "My label", //required but let empty if you don't need label
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