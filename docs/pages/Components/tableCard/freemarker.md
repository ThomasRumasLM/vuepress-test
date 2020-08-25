## File to import

```ftl
<#import "../../macros/common/tableCard.ftl" as tableCard>
```

## The table Card macro

```ftl
<#assign cardExample = {
    "title":{
        "text":"my title"
    },
    "steps":[
        {
            "pictogram":{
                "url":"myImage.png",
                "alt":"My alt",
            },
            "title":"My title step",
            "description":"My text"
        }                           
    ],
    "subtitle":"My subtitle Title"    
}/>

<@tableCard.tableCard config=config>
    <p>my detail</p>
</@tableCard.tableCard>
```

#### Specific options

```ftl
"title":{
   "text" : "my title", // STRING, mandatory
   "semantic" : "3" // STRING, optionnal default 3
},
"steps":[
    {
        "pictogram" : { // optional
            "url" : "myImage.png", // STRING, mandatory
            "alt" : "My alt" // STRING, mandatory
        }, 
        "title" : "My title step", // STRING, optionnal
        "description" : "My text" // STRING, optionnal
    }                           
],
"subtitle" : "My subtitle Title" // STRING, optionnal
"theme" : "black" // STRING, optionnal default white
```
