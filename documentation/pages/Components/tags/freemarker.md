## How to use
Chose the macro you want to use:
- `tagMozaic` to display only one tag (type text, selectable, link or removable)
- `tagMozaicList` to display a list only with selectable tags (type list)

## File to import

```ftl
<#import "../../macros/common/tags.ftl" as tags>
```

## The Tags macro

#### Basic example

```ftl
<#assign tagText = {
    "type": "text"
}/>
<@tags.tagMozaic configTag=tagText class="mycustomClass" data\-toto="toto" id="myId">Tag text custom</@tags.tagMozaic>
```

#### List example

```ftl
 <#assign  tagListRegular  = {
     "type": "list"
 }/>

<@tags.tagMozaicList configTag=tagListRegular class="customClassList" data\-toto="toto" id="myId">
    <@tags.tagMozaic configTag=tagListRegular class="mycustomClassItem" disabled="disabled" data\-toto="tata">item regular 1</@tags.tagMozaic>
    <@tags.tagMozaic configTag=tagListRegular class="mycustomClassItem" data\-toto="toto">item regular 2</@tags.tagMozaic>
    <@tags.tagMozaic configTag=tagListRegular class="mycustomClassItem" data\-toto="yoyo">item regular 3</@tags.tagMozaic>
    <@tags.tagMozaic configTag=tagListRegular class="mycustomClassItem" data\-toto="yolo">item regular 4</@tags.tagMozaic>
 </@tags.tagMozaicList>
```

#### Specific options

```ftl
"type": "link", // STRING, optionnal - "text" if empty - "text" / "link" / "selectable" / "removable" / "list"
"theme": "dark",// STRING, optionnal - light by default - "dark" / "danger" (danger is a specific LM theme)
"size": "s",// STRING, optionnal - m by default
```
