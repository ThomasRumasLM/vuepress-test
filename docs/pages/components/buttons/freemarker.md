## File to import

```ftl
<#import "../../macros/common/button.ftl" as button>
```

## The Button macro

```ftl
<#assign buttonExample = {
    "color": "primary-02",
    "size": "s"
}/>

<@button.buttonMozaic configButton = buttonExample >Button text</@button.buttonMozaic>
```

#### Specific options

```ftl
"id": "js-button-example", // STRING, optionnal
"type": "submit", // STRING, optionnal - "button" if empty
"color": "primary-02", // STRING, optionnal - "primary-02", "danger", "neutral"
"style": "bordered", // STRING, optionnal - "solid" if empty - "bordered"
"displayStyle": "link", // STRING, optionnal - "button" if empty - Used to display a button with link style
"size": "s", // STRING, optionnal - "m" if empty - "s", "l"
"disabled": true, // BOOLEAN, optionnal
"width": "full", // STRING, optionnal - "full"
"icon": {
    "iconOnly": true, // BOOLEAN, optionnal
    "id": "Media_Camera_24px" // STRING, mandatory to insert icon
},
"cssClass": "myClass", // STRING, optionnal
"dataTagco": "{'titi' : 'tata', 'tutu' : 'toto'}", // STRING, optionnal
"dataTcevent": "tc-event-example", // STRING, optionnal
"cerberus": "BTN_addtocart", // STRING, optionnal
"ariaLabel": "Label", // STRING, optional
"dataAttributes": [
    {'name': 'truc', 'value': 'valeur de truc'}, // OBJECT, must contain "name" and "value" keys
    {'name': 'truc2', 'value': 'valeur de truc 2'}
]
```
