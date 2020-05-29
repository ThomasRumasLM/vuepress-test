---
title: 'Tester'
order: 1
---
## Presentation
Same test for all, and less code to read on each template Freemarker.

This macro return true if :
- key exist and :
    - Number more than 0
    - String not empty
    - Boolean return true
    - Key is Sequence `[]` and not empty
    - Key is Hash `{}` and not empty

## Why
Currently, to display an element, we have do this : 

```java
<#assign myNumber   = 1>
<#assign myString   = "Hello">
<#assign myBoolean  = true>
<#assign mySequence = [{"0":"Hello"}]>
<#assign myHash     = {"0":"Hello"}>
```

In case we have only one element : 

```html
<#if (myString)?? && myString != "">
  <div>
    ${myString}
  </div>
</#if>
```

In this case, we have some elements to display in a `div` wrapper, to not display an empty wrapper we have do this, for each items :

```html
<#if (myString)?? && (key?is_number && key != 0 || key?is_string && key != "" || key?is_boolean && key == true || (key?is_sequence || key?is_hash) && key?size > 0)>
  <div>
    ${myNumber}
    ${myString}
    ${myBoolean}
    ${mySequence}
    ${myHash}
  </div>
</#if>
```

With the macro notEmpty, you have do this :

```html
<@notEmpty myNumber, myString, myBoolean, mySequence, myHash>
  <div>
    ${myNumber}
    ${myString}
    ${myBoolean}
    ${mySequence}
    ${myHash}
  </div>
</@notEmpty>
```