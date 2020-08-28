---
title: 'Picture'
order: 1
---

# Picture

> **Picture** is used to define image porfil according to the screen resolution.

## File to import

```ftl
<#import "../../macros/common/image.ftl" as image>
```

```ftl
<#assign mySize = {
    "960" : "150", 
    "1920" : "300", 
    "1921" : "300"
}/>

<@image.picture alt="" src="" class="" imgClass="" sizes=mySize/>
```
### Specific options

Here are 5 width available base on max-width :

- 320
- 640
- 960
- 1280
- 1920

and there is one more width base on min-width for **screen grather than 1920px** : 1921

if a size is not indicated the image takes **the maximum size of the ratio**, for example if u don't assigne the **640 ratio** in a screen **between 320px and 640px** the image will take a **size of 640px**

#### All options
- alt `string` : description of image **(required)**
- src `string` : url of image **(required)**
- class `string` : class for picture tag **(required)**
- imgClass `stirng` : class for img tag **(required)**
- sizes `map` : specific witdh for specific ration **(optional)**