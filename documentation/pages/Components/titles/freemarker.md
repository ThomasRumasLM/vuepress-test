## File to import

```ftl
<#import "../../macros/common/title.ftl" as title>
```

## The Title macro

```ftl
<#assign titleExample = {
    "size": "m",
    "color": "darkest",
    "weight": "regular",
    "underline": true,
    "underlineColor: "primary-02-600"
    "align": "center",
    "heading": 3
  }
/>

<@title.heading configHeading = titleExample class="myClass" data\-toto="toto">Lorem ipsum dolor sit amet consectetur adipisicing elit.</@title.heading>
```

#### Specific options

```ftl
<#assign titleExample = {
    "size": "m",
    "color": "darkest",
    "weight": "regular",
    "underline": true,
    "underlineColor: "primary-02-600"
    "align": "center",
    "heading": 3
  }
/>
```
