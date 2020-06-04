## File to import

```ftl
<#import "../../macros/common/header_hero.ftl" as headerHero>
```

## The Header Hero macro

```ftl
<#assign headerHeroExample = {
    "title": "My title",
    "description": "My description",
    "image": {
        "src": "/my-src-url",
        "alt": "My image alt"
    }
}/>

<@headerHero.headerHero configHeaderHero = headerHeroExample />
```

#### Specific options

```ftl
"title": "My title", // STRING, optionnal
"description": "My description", // STRING, optionnal
"image": {
    "src": "/my-src-url", // OBJECT, must contain "src" and "alt" keys
    "alt": "My image alt"
},
"dataTagco": "{'titi' : 'tata', 'tutu' : 'toto'}", // STRING, optionnal
"dataTcevent": "tc-event-example", // STRING, optionnal
"cerberus": "data_cerberus", // STRING, optionnal
"dataAttributes": [
    {'name': 'name1', 'value': 'my value 1'}, // OBJECT, must contain "name" and "value" keys
    {'name': 'name2', 'value': 'my value 2'}
]
```
