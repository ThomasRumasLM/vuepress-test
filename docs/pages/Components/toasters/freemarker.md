## How to use

>  Build a **macro that generate toaster**, based on a predefined type. 

## File to import

```ftl
<#import "../../macros/common/toaster.ftl" as toasters>
```
<br >

## The Toaster macro

You can **use 4 different types**: `success`, `info`, `warning`, or `danger`.
See [Mozaic documentation](http://mozaic.adeo.cloud/Components/Notification/) to know each case available.

```ftl
<#assign toasterSuccessOpt = {
    "type":"success", // STRING, mandatory - "success"/"info"/"warning"/"danger"
    "title" : {
        "content": "My notificatition title", // STRING, optionnal
        "heading": 3 // NUMBER, optionnal
    },
    "link" : {
        "content" : "my link content", // STRING, mandatory if link has content
        "href" : "/tutu", // STRING, mandatory if link has content
        "data" : { // STRING, optionnal
            "data-cerberus": "mycerberus-tag",
            "id": "myLinkId"
        }
    },
    "closable": true, // BOOLEAN, optionnal
    "buttonClass" : "myButton" // STRING, optionnal
}/>

<@toasters.toaster configToaster=toasterSuccessOpt class="myContainerClass" data\-toto="toto" id="myContainerId">
    <p>Success</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id magna mattis,
    sodales urna et, commodo mauris. Curabitur feugiat, neque eu dignissim semper,
    risus mauris fringilla felis, et sagittis eros velit dictum orci.
    Etiam sit amet ornare est.</p>
</@toasters.toaster>
```

