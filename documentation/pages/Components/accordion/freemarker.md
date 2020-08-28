## How to use

>  Build a **macro that generate an accordion**. 

## File to import

```ftl
<#import "../../macros/common/accordion.ftl" as accordion>
```
<br >

## The Accordion macro
You have to specify the **id of the accordion** in a config variable.<br >
by setting the optional **headerIcon** key to true you can generate the **default icon in the accordion header** (`Navigation_Control_More` / `Navigation_Control_Less`)

```ftl
<#assign conf = {
  "id": "accMacro",
  "customClass": "my-accordion-macro",
  "headerIcon": true
}>
```

Then you can use the macro to **build your accordion**.

```ftl
<@accordion.accordionContainer conf>
    <@accordion.accordionHeader conf>
        Title 1
    </@accordion.accordionHeader>
    <@accordion.accordionContent conf>
        ACC CONTENT <br>
        LIGNE 2
    </@accordion.accordionContent>
    <@accordion.accordionHeader conf>
        Title 2
    </@accordion.accordionHeader>
    <@accordion.accordionContent conf>
    ACC CONTENT <br>
        LIGNE 2
    </@accordion.accordionContent>
</@accordion.accordionContainer>
```
