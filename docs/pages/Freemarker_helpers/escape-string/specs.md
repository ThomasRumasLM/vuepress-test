---
title: 'Specs'
order: 2
---
## File to include

```json
<#include "../../macros/common/tools/_escape-string.function.ftl">
```
## How tu use the function
With variable : 
```json
<#assign simpleQuoteString = "jusqu'à ">
${escapeString(simpleQuoteString)}
```
```json
<#assign doubleQuoteString = '37" de diamètre'>
${escapeString(doubleQuoteString)}
```
With string directly : 
```json
${escapeString("jusqu'à ")}
```
