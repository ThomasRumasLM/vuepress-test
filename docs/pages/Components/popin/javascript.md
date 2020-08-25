> **To use the Popin component, you have to use the `lm.Popin` class**. <br >

### How to use it

> If you need to generate your Popin from javascript:<br>
> Pass a config object in the **content** variable

```js
lm.DOMReady(function () {
	this.testGenerationPopin = new popin({
        "content": {
            cssClass: "",
            title: "",
            subTitle: "",
            headerHTML: "" // overide title/subtitle
            contentHTML: "",
            footerHTML: ""
        }, // object -> popin generation
        "blocked": false, // Boolean default: false
        "desktopSize": "m", // s, m, l
        "fullscreen": false, // boolean
        "onOpen": () => {},
        "onClose": () => {}
    });
});
```
___

> If your Popin is already inserted in your DOM :
> Pass a selector string in the **content** variable

```js
lm.DOMReady(function () {
    this.myPopin = new lm.Popin({
        "content": '.js-myPopin'
    });
});
```
