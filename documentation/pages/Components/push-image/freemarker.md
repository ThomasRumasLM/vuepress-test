> The macro of **push image** allows to modify the name and the semantic of the title, the description, the source image and its alt, the url and the label of the link .

## File to import

```ftl
<#import "../../macros/common/push_image.ftl" as pushs>
```

## The Card macro

```html
<@pushs.pushImage configPushImageParam></@pushs.pushImage>
``` 

#### Specific options

```ftl
<#assign configPushImageParam  = {
    "title" : {
        "name": "Tous nos forfaits de pose",
        "semantics": "h3"
    },
    "description":"La pose de votre robinet par un professionnel",
    "image" : {
        "imageSrc":"/static/img/push.jpg",
        "alt": "La pose de votre robinet par un professionnel"
    },
    "button" : {
        "label" : "J'en profite",
        "link" : "/"
    }
}/>
```
