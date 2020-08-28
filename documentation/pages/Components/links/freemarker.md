## File to import

```ftl
<#import "../../macros/common/link.ftl" as link>
```

## The Link macro

```ftl
<#assign linkExample = {
    "color": "primary-02",
    "size": "m",
    "htmlTag": "link",
    "icon": {
        "side": "right",
        "iconOnly": false,
        "id": "Media_Camera_16px"
    }
}/>

<@link.link configLink = linkExample href="/tutu" target="_blank">my link</@link.link>
```

#### Specific options

```ftl
<#assign linkExample = {
    "color": "primary-02",
    "size": "m",
    "htmlTag": "link",
    "icon": {
        "side": "right",
        "iconOnly": false,
        "id": "Media_Camera_16px"
    }
}/>
```
