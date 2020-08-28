---
title: 'forEach'
order: 1
---

# forEach

## Why
The `Array.forEach` method is pretty usefull.  
Sadly, it can't be used for all iterable type of variable on all browser.  
For example, after a `document.querySelectorAll()`, we get a `NodeList` object, without `forEach supported` on IE11

## Where
This method is available in the global object `lm`  
This object is defined by common.js file

To read the whole function in **lmfr-int-socle-js**, 
[visit gitlab](http://gitlab-xnet.fr.corp.leroymerlin.com/fr-lm-internet-refonte/lmfr-int-socle-js/blob/master/assets/commons/_foreach.js)

<'JS_helpers/foreach/example.md'>

:::: tabs

::: tab Specs
<'JS_helpers/foreach/specs.md'>
:::

::::