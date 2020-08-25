---
title: 'localstorage'
order: 1
---

# localstorage

## Why
We wanted to provide a tool to use local and session storage instead of cookie and still provide expire date   
This allow to minimize the use of cookie and lighten request weight  
This use session cookie as a fallback if localstorage is not available

## Where
This method is available in the global object `lm`  
This object is defined by common.js file  

To read the whole function in **lmfr-int-socle-js**, 
[visit gitlab](http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-internet-refonte/lmfr-int-socle-js/blob/master/assets/commons/_localStorage.js)

<'JS_helpers/localstorage/example.md'>

:::: tabs

::: tab Specs
<'JS_helpers/localstorage/specs.md'>
:::

::::