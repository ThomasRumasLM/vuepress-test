## File to import

```ftl
<#import "../../macros/common/good_to_know.ftl" as goodToKnow>
```

## The Good-To-Know macro

```ftl
<#assign goodToKnowExample = {
    "title": "My title",
    "description": "My description",
    "link": {
        "label": "my link label",
        "href": "/my-url"
    }
}/>

<@goodToKnow.goodToKnow configGoodToKnow = goodToKnowExample />
```

#### Specific options

```ftl
"title": "My title", // STRING, optionnal
"description": "My description", // STRING, optionnal
"link": {
    "label": "my link label", // OBJECT, must contain "label" and "href" keys
    "href": "/my-url"
},
"dataTagco": "{'titi' : 'tata', 'tutu' : 'toto'}", // STRING, optionnal
"dataTcevent": "tc-event-example", // STRING, optionnal
"cerberus": "data_cerberus", // STRING, optionnal
"dataAttributes": [
    {'name': 'name1', 'value': 'my value 1'}, // OBJECT, must contain "name" and "value" keys
    {'name': 'name2', 'value': 'my value 2'}
]
```
