<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>

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

<#-- addToCart
  @param {String} type                : Submit by default (Can be button)
  @param {String} wrapperCustomClass  : Class use only for wrapper html tag
  @param {String} customClass         : Unique class for both button and icon /!\ IF YOU NEED MULTIPLE CLASSES USE wrapperCustomClass
  @param {Boolean} displayIcon        : Display Basket icon, by default true
  @param {String} textContent         : Text of button, by default "Ajouter au panier"
  @param {Object} dataTagco           : data tag commander
  @param {String} dataTcevent         : data tc-event
  @param {String} cerberus            : data cerberus

  How to use :

  Default display :
  <@button.addToCart />

  Will generate :
  <button type="submit" class="ka-button js-cart-add">
  <svg class="ku-icon-48 ka-button__icon"><use href="#Product_Basket_Add_48px"></use></svg>
  Ajouter au panier
  </button>

  Custom display :
  <#assign buttonConfig = {
    "type" : "button",
    "wrapperCustomClass" : "parent classes" //multiple classes,
    "customClass" : "my-class" //unique classe,
    "eventAddToCart" : true || false // optional (defaut: true) add class js-tagGA for send event on click
    "textContent" : "",
    "dataTagco"   : "{'titi' : 'tata', 'tutu' : 'toto'}", //optional
    "dataTcevent" : "tc-event-example", //optional
    "cerberus"    : "BTN_addtocart", // optional
    "displayIcon": false // optional, true if not set
    "dataAttributes" : [
      {
        "name" : "merch-pos",
        "value" : "merch position value"
      }
    ] //optional

  } />

  <@button.addToCart buttonConfig />

  Will generate :
  <button id="js-button-example" type="button" class="ka-button js-cart-add parent classes my-class js-tagGA" data-merch-pos="merch position value" data-tagco="{'titi' : 'tata', 'tutu' : 'toto'}" data-tcevent="tc-event-example" data-cerberus="BTN_addtocart">
    <svg class="ku-icon-48 ka-button__icon my-class__icon"><use href="#Product_Basket_Add_48px"></use></svg>
  </button>

-->

<#--  Mozaic buttons  -->
<#macro buttonMozaic configButton = {}>
  <@compress single_line=true>
    <#if configButton.displayStyle?has_content && configButton.displayStyle == "link" >
      <#assign prefix = "mc-link" />
    <#else>
      <#assign prefix = "mc-button" />
    </#if>
    <#assign dataAttr = "" />
    <#assign classes = prefix />

    <#--  Insert symbol first if config contains an icon  -->
    <#if configButton.icon?has_content >
      <@icons.icon iconPath="${configButton.icon.id!}" symbolOnly=true />
    </#if>

    <#--  Build style and color class  -->
    <#if configButton.displayStyle?has_content && configButton.displayStyle == "link" >
      <#if configButton.color?has_content >
          <#assign classes = classes + " ${prefix}--${configButton.color!}" />
      </#if>
    <#else>
      <#if configButton.style?has_content && configButton.color?has_content >
        <#assign classes = classes + " ${prefix}--${configButton.style!}-${configButton.color!}" />
      <#elseif configButton.style?has_content && !configButton.color?has_content >
        <#assign classes = classes + " ${prefix}--${configButton.style!}" />
      <#elseif !configButton.style?has_content && configButton.color?has_content >
        <#assign classes = classes + " ${prefix}--solid-${configButton.color!}" />
      </#if>
    </#if>

		<#--  Add size class  -->
		<#if configButton.size?has_content >
			<#assign classes = classes + " ${prefix}--${configButton.size!}" />
		</#if>

		<#--  Add width class  -->
		<#if configButton.width?has_content && configButton.width=="full" >
			<#assign classes = classes + " ${prefix}--${configButton.width!}" />
		</#if>

    <#--  Add ariaLabel  -->
		<#if configButton.ariaLabel?has_content >
			<#assign ariaLabel = configButton.ariaLabel />
		</#if>

		<#--  Build icon DOM  -->
		<#if configButton.icon?has_content >
            <#assign iconSideClass = "" />
            <#if !configButton.icon.iconOnly?has_content >
                <#assign iconSideClass = "${prefix}__icon--${configButton.icon.side!}" />
            </#if>
			<#assign iconCode><@icons.icon iconPath="${configButton.icon.id!}" class="${prefix}__icon ${iconSideClass!}" /></#assign>
		</#if>

		<#--  Add symbol only class  -->
		<#if configButton.icon?has_content && configButton.icon.iconOnly?has_content && configButton.icon.iconOnly >
			<#assign classes = classes + " ${prefix}--square" />
		</#if>

  		<#--  Add custom CSS Class  -->
		<#if configButton.cssClass?has_content >
			<#assign classes = classes + " ${configButton.cssClass!}" />
		</#if>

  	<#--  Add button type  -->
		<#if configButton.type?has_content >
			<#assign type = configButton.type />
    <#else>
      <#assign type = "button" />
    </#if>

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configButton.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configButton.dataTagco!}"' />
    </#if>
    <#if configButton.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configButton.dataTcevent!}"' />
    </#if>
    <#if configButton.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configButton.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configButton.dataAttributes?has_content>
      <#list configButton.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

		<button <#if configButton.id?has_content>id="${configButton.id!}" </#if>type="${type!}" class="${classes!}" ${dataAttr!} <#if configButton.disabled?has_content && configButton.disabled >disabled</#if> <#if configButton.ariaLabel?has_content >aria-label="${ariaLabel!}"</#if>>
			<#if ( configButton.icon?has_content && !configButton.icon.side?has_content ) || ( configButton.icon?has_content && configButton.icon.side?has_content && configButton.icon.side == "left" ) >${iconCode!}</#if>

      <#if !(configButton.icon?has_content && configButton.icon.iconOnly?has_content && configButton.icon.iconOnly) >
          <span class="mc-button__label"><#nested></span>
      </#if>

      <#if configButton.icon?has_content && configButton.icon.side?has_content && configButton.icon.side == "right" >${iconCode!}</#if>
    </button>
  </@compress>
</#macro>

<#macro addToCart config = {}>
  <#compress>
    <#assign eventAddToCart = (config.eventAddToCart)!true />

    <#if eventAddToCart == true>
        <#assign cssClass = "js-cart-add js-tagGA" />
    <#else>
        <#assign cssClass = "js-cart-add" />
    </#if>

    <#assign defaultOptions = {
        "type": "submit",
        "cssClass": cssClass,
        "textContent": "Ajouter au panier",
        "icon": {
            "id": "Product_Basket_Add_48px"
        }
    } />

    <#assign icon = {
      "id": (defaultOptions.icon.id)!,
      "iconOnly": (config.icon.iconOnly)!false,
      "cssClass": ""
    } />

    <#if (config.displayIcon)?? && !config.displayIcon>
      <#assign icon = {} />
    </#if>

    <#assign options = config + {
        "type": (config.type)!defaultOptions.type,
        "cssClass": "${defaultOptions.cssClass!} ${config.cssClass!}",
        "textContent": (config.textContent)!defaultOptions.textContent,
        "dataAttributes": (config.dataAttributesAddToCart)![],
        "icon": (icon)!
    } />

    <@buttonMozaic options >
      <#if !(options.icon.iconOnly?has_content && options.icon.iconOnly) >${options.textContent}</#if>
    </@buttonMozaic>
  </#compress>
</#macro>
