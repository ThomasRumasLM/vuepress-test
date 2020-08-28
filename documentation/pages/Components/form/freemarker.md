## File to import

You just have to import one file 

```java 
<#import "../../macros/common/form/fields.ftl" as field>
```

**_Note :_** Every macro are build to generate a full combo with: label, required information, suggestion or details sentence and the field(s)

## How to use form macro

Unless you imported the macro field file, to use a form element macro you need to :

### Define a config object
Use the common macro options. Be carefull some options are mandatory to use form macro.
    
```ftl
<#assign config = {
    "name":"firstName", 
    "label": "Votre prénom",
    "required": true,
    "placeholder" : "Michel",
    "type" : "text"
} >
```
### Declare the macro and applied config object

```ftl
<@field.input config/>
```

## Common macros options

These options are available for all macros. Remember that every macro also have additionnal specific options.

> **`innerData`** object is used to display your own attributes, classnames etc. directly on the form element.

```json
{
    "name" : string,  // required
    "label" : string, // required
    "required" : true, 
    "suggest" : string, 
    "placeholder" : string,
    "disabled" : true,
    "validation" : {
        "pattern" : string,
        "mismatch" : string,
        "missing" : string,
        "min" : "yyyy-mm-dd",
        "max" : "yyyy-mm-dd",
        "maxlength" : number,
        "minlength" : number
    },
    "innerData": {
        "class": "myCustomClass myOtherClass",
        "data-blabla":"datatruc",
        "data-blibli": "otherDataTruc"
    }
}
```
