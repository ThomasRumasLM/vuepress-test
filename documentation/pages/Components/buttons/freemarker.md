## File to import

```ftl
<#import "../../macros/common/button.ftl" as button>
```

## The Button macro

```ftl
<#assign buttonExample = {
    "color": "primary-02",
    "size": "s"
}/>

<@button.button configButton = buttonExample class="myClass" data\-toto="toto" id="myId">Button text</@button.button>
```

#### Specific options

```ftl
<#assign buttonExample = {
    "color": "primary-02",
    "style": "solid",
    "size" : "m",
    "width" : "full",
    "htmlTag: "link",
    "icon": {
        "iconOnly": false,
        "id": "Media_Camera_24px"
    }
}/>
```
