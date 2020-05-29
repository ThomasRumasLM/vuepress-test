---
title: "Freemarker"
order: 2
---

## File to import

```json
<#import "../../macros/common/image.ftl" as image>
```

## The Button macro

```java
 <@image.image alt="" class="" src="" ratio="16by9"/>
```

#### Specific options

Here are **6 ratios available** :

- 16:9 `16by9`
- 3:2 `3by2`
- 4:3 `4by3`
- 1:1 `1by1`
- 3:4 `3by4`
- 2:3 `2by3`

```java
"alt" : "my description" //STRING, mandatory
"class": "myClass" //STRING, mandatory
"src": "myPicture" //STRING, mandatory
"prmLoad": "lazy" //STRING, optionnal - "" if empty
"ratio": "16by9" //STRING, optional - "" if empty, expectied values : "16by9 3by2 4by3 1by1 3by4 2by3"
```
