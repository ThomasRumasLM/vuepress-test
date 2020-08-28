## File to import

```ftl
<#import "../../macros/common/flag.ftl" as flag>
```

## The Flag macro

```ftl
<#assign flagExample = {
    "theme": "solid-primary-02"
}/>

<@flag.flagMozaic configFlag = flagExample class="myFlag" data\-toto="toto">My flag</@flag.flagMozaic>
```

#### Specific options

```ftl
"theme": "solid-primary-02" 
```
