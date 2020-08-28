## File to import

```ftl
<#import "../../macros/common/icons.ftl" as icon>
```

## The icon macro

```ftl
<@icons.icon iconPath="Navigation_Display_Setting_48px" />
<!-- iconPath : The icon's name without extension -->

<@icons.icon iconPath="Navigation_Publish_Edit_48px" class="icon-class" />
<!-- class : To add a css class on the svg tag -->

<@icons.icon iconPath="Navigation_Display_Setting_48px" symbolOnly=true />
<!-- symbolOnly : If this icon should be include only as a symbol to be reused later. 
Default : false -->
```
