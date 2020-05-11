<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>

<#--  MOZAIC LINK

  <#import "../../macros/common/link.ftl" as link>

  <#assign linkExample = {
    "id": "js-button-example", // STRING, optionnal
    "href": "/my-component", // STRING, optionnal - don't use it with "type"
    "type": "submit", // STRING, optionnal - "button" if empty, don't use it with "href"
    "color": "primary-02", // STRING, optionnal - "light", "primary", "primary-02", "danger"
    "displayStyle": "button", // STRING, optionnal - "link" if empty - Used to display a link with button style
    "size": "s", // STRING, optionnal - "m" if empty - "s"
    "targetBlank": true, // BOOLEAN, optionnal
    "icon": {
        "side": "right",
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

  <@link.linkMozaic configLink = linkExample >Link text</@link.linkMozaic>

-->

<#--  Mozaic links  -->
<#macro linkMozaic configLink = {}>
	<@compress single_line=true>
        <#if configLink.displayStyle?has_content && configLink.displayStyle == "button" >
            <#assign prefix = "mc-button" />
        <#else>
            <#assign prefix = "mc-link" />
        </#if>
        <#assign dataAttr = "" />
		<#assign classes = prefix />

		<#--  Insert symbol first if config contains an icon  -->
		<#if configLink.icon?has_content >
			<@icons.icon iconPath="${configLink.icon.id!}" symbolOnly=true />
		</#if>

		<#--  Build style and color class  -->
        <#if !(configLink.displayStyle?has_content && configLink.displayStyle == "button") >
            <#if configLink.color?has_content >
                <#assign classes = classes + " ${prefix}--${configLink.color!}" />
            </#if>
        <#else>
            <#if configLink.style?has_content && configLink.color?has_content >
                <#assign classes = classes + " ${prefix}--${configLink.style!}-${configLink.color!}" />
            <#elseif configLink.style?has_content && !configLink.color?has_content >
                <#assign classes = classes + " ${prefix}--${configLink.style!}" />
            <#elseif !configLink.style?has_content && configLink.color?has_content >
                <#assign classes = classes + " ${prefix}--solid-${configLink.color!}" />
            </#if>
        </#if>


		<#--  Add size class  -->
		<#if configLink.size?has_content >
			<#assign classes = classes + " ${prefix}--${configLink.size!}" />
		</#if>

		<#--  Build icon DOM  -->
		<#if configLink.icon?has_content >
            <#assign iconSideClass = "" />
            <#if !configLink.icon.iconOnly?has_content >
                <#assign iconSideClass = "${prefix}__icon--${configLink.icon.side!}" />
            </#if>
			<#assign iconCode><@icons.icon iconPath="${configLink.icon.id!}" class="${prefix}__icon ${iconSideClass!}" /></#assign>
		</#if>

  		<#--  Add custom CSS Class  -->
		<#if configLink.cssClass?has_content >
			<#assign classes = classes + " ${configLink.cssClass!}" />
		</#if>

        <#--  Add button type  -->
        <#if configLink.type?has_content >
            <#assign type = configLink.type />
        <#else>
			<#assign type = "button" />
		</#if>

        <#--  Add ariaLabel  -->
		<#if configLink.ariaLabel?has_content >
			<#assign ariaLabel = configLink.ariaLabel />
		</#if>

        <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
        <#if configLink.dataTagco?has_content>
            <#assign dataAttr = dataAttr + ' data-tagco="${configLink.dataTagco!}"' />
        </#if>
        <#if configLink.dataTcevent?has_content>
            <#assign dataAttr = dataAttr + ' data-tcevent="${configLink.dataTcevent!}"' />
        </#if>
        <#if configLink.cerberus?has_content>
            <#assign dataCerberus> <@macros.cerberus "${configLink.cerberus!}" /></#assign>
            <#assign dataAttr = dataAttr + dataCerberus />
        </#if>
        <#if configLink.dataAttributes?has_content>
            <#list configLink.dataAttributes as attr>
                <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
            </#list>
        </#if>

		<a href="${configLink.href!}" <#if configLink.id?has_content>id="${configLink.id!}" </#if>class="${classes!}" ${dataAttr!} <#if configLink.targetBlank?has_content && configLink.targetBlank >target="_blank"</#if> <#if configLink.ariaLabel?has_content >aria-label="${ariaLabel!}"</#if> >
            <#if ( configLink.icon?has_content && !configLink.icon.side?has_content ) || ( configLink.icon?has_content && configLink.icon.side?has_content && configLink.icon.side == "left" ) >${iconCode!}</#if>

			<#if !(configLink.icon?has_content && configLink.icon.iconOnly?has_content) >
                <#if (configLink.displayStyle)?? && configLink.displayStyle == "button">
                    <span class="mc-button__label"><#nested></span>
                <#else>
                    <#nested>
                </#if>
            </#if>

			<#if configLink.icon?has_content && configLink.icon.side?has_content && configLink.icon.side == "right" >${iconCode!}</#if>
		</a>
	</@compress>
</#macro>
