<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#import "./tokens/buttons.ftl" as jsonButtons>

<#--  MOZAIC BUTTON

  <#import "../../macros/common/button.ftl" as button>

  <#assign buttonExample = {
    "id": "js-button-example", // STRING, optionnal
    "type": "submit", // STRING, optionnal - "button" if empty, don't use it with "href"
    "color": "primary-02", // STRING, optionnal - "primary-02", "danger", "neutral"
    "displayStyle": "link", // STRING, optionnal - "button" if empty - Used to display a button with link style
    "style": "bordered", // STRING, optionnal - "solid" if empty - "bordered"
    "size": "s", // STRING, optionnal - "m" if empty - "s", "l"
    "disabled": true, // BOOLEAN, optionnal
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
  }/>

  <@button.buttonMozaic configButton = buttonExample >Button text</@button.buttonMozaic>

-->

<#--
<#assign myButton = {
    "color": "primary-02",
    "style": "solid",
    "size" : "m",
    "width" : "full",
    "htmlTag: "link",
    "icon": {
        "iconOnly": false,
        "id": "Media_Camera_24px"
    }
}/>

<@button.button configButton=myButton data\-toto="toto" data\-titi="titi" class="myCustomClass">mon bouton</@button.button >
-->

<#macro button configButton={} dataInherit = {} dataSup...>
    <#assign mainClass = jsonButtons.json.class />
    <#assign labelClass = jsonButtons.json.class + jsonButtons.json.label />
    <#assign iconClass = jsonButtons.json.class + jsonButtons.json.icon />

    <#assign classes = "${mainClass}"/>
    <#assign dataAttributes=""/>
    <#if dataInherit?is_hash>
        <#list dataInherit as key, value>
            <#if key != 'class'>
                <#assign dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>

    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != 'class'>
                <#assign dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>

    <#assign htmlTag = "button" />
    <#if configButton.htmlTag?has_content && configButton.htmlTag == 'link'>
        <#assign htmlTag = "a" />
    </#if>

    <#--  Insert symbol first if config contains an icon  -->
    <@compress single_line=true>
      <#if configButton.icon?has_content >
          <@icons.icon iconPath="${configButton.icon.id!}" symbolOnly=true />
          <#if configButton.icon.iconOnly?has_content && configButton.icon.iconOnly == true>
            <#assign classes = classes + " ${mainClass}--square"/>
            <#if configButton.icon.side?has_content>
              <#assign iconSideClass = "${iconClass}--${configButton.icon.side!}" />
            </#if>
          </#if>
          <#assign iconCode><@icons.icon iconPath="${configButton.icon.id}" class="${iconClass} ${iconSideClass!}"/></#assign>
      </#if>
    </@compress>

    <#if configButton.style?has_content>
        <#assign classes = classes + " ${mainClass}--${configButton.style}"/>
        <#if configButton.color?has_content>
            <#assign classes = classes + "-${configButton.color}"/>
        </#if>
    </#if>
    <#if configButton.size?has_content >
        <#assign classes = classes + " ${mainClass}--${configButton.size}"/>
    </#if>
    <#if configButton.width?has_content >
        <#assign classes = classes + " ${mainClass}--${configButton.width}" />
    </#if>
    <#if dataSup.class?has_content>
        <#assign classes = classes + " ${dataSup.class}"/>
    </#if>

    <@compress single_line=true>
      <${htmlTag} class="${classes}" ${dataAttributes}>
          <#if configButton.icon?has_content>
              <#if !configButton.icon.side?has_content || configButton.icon.side == "left">
                  ${iconCode}
              </#if>
              <#if !configButton.icon.iconOnly?has_content || configButton.icon.iconOnly != true>
                  <span class="${labelClass}"><#nested></span>
              </#if>
              <#if configButton.icon.side?has_content && configButton.icon.side == "right">
                  ${iconCode}
              </#if>
          <#else>
              <span class="${labelClass}"><#nested></span>
          </#if>
      </${htmlTag}>
    </@compress>
</#macro>

<#--
<#assign myButton = {
    "color": "primary-02",
    "style": "solid",
    "size" : "m",
    "width" : "full",
    "htmlTag: "link"
}/>

<@button.addToCart configButton=myButton data\-toto="toto" data\-titi="titi" class="myCustomClass"/>
-->

<#macro addToCart config = {} dataInherit = [] dataSupAdd...>
  <#compress>
    <#assign classes = "js-cart-add" />

    <#assign dataAttributes = dataSupAdd />
    <#list dataInherit as data>
      <#assign dataAttributes = dataAttributes + { "${data.name}" : "${data.value}" } />
    </#list>

    <#if dataSupAdd?is_hash>
      <#if dataSupAdd.class?has_content>
        <#assign classes = classes + " ${dataSupAdd.class}"/>
      </#if>
    </#if>

    <#assign defaultOptions = {
        "textContent": "Ajouter au panier",
        "icon": {
            "id": "Product_Basket_Add_48px"
        }
    } />

    <#assign icon = {
      "id": (defaultOptions.icon.id)!,
      "iconOnly": (config.icon.iconOnly)!false
    } />

    <#if (config.displayIcon)?? && !config.displayIcon>
      <#assign icon = {} />
    </#if>

    <#assign options = config + {
        "textContent": (config.textContent)!defaultOptions.textContent,
        "icon": (icon)!
    } />

    <@button configButton = options class="${classes}" dataInherit = dataAttributes>
      <#if !(options.icon.iconOnly?has_content && options.icon.iconOnly) >${options.textContent}</#if>
    </@button>
  </#compress>
</#macro>
