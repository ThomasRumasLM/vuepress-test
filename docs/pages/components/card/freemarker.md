## File to import

```json
<#import "../../macros/common/card.ftl" as card>
```

## The Card macro

```java
<#assign cardExample = {
    "type": "benefits",
    "icon": "User_Contact_Mail_48px",
    "title": "My title",
    "description": "My description"
}/>

<@card.card configCard = cardExample />
```

#### Specific options

```java
"type": "benefits", // STRING, mandatory - "benefits"/"steps"
"icon": "icon_id_24px", // STRING, mandatory
"cssClass": "myClass mySecondClass", // STRING, optionnal
"title": "My title", // STRING, optionnal
"description": "My description", // STRING, optionnal
"dataTagco": "{'titi' : 'tata', 'tutu' : 'toto'}", // STRING, optionnal
"dataTcevent": "tc-event-example", // STRING, optionnal
"cerberus": "data_cerberus", // STRING, optionnal
"dataAttributes": [
    {'name': 'name1', 'value': 'my value 1'}, // OBJECT, must contain "name" and "value" keys
    {'name': 'name2', 'value': 'my value 2'}
]
```
