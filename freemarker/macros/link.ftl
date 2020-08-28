<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#import "./tokens/link.ftl" as jsonLink>

<#--  LINK
<#assign linkExample = {
    "color": "primary-02",
    "size": "m",
    "htmlTag": "link",
    "icon": {
        "side": "right",
        "iconOnly": false,
        "id": "Media_Camera_16px"
    }
}/>

<@link.link configLink=linkExample href="/tutu" target="_blank">my link</@link.link>
-->

<#macro link configLink = {} dataSup...>
    <#assign mainClass = jsonLink.json.class />
    <#assign iconClass = jsonLink.json.class + jsonLink.json.icon />

    <#assign dataAttributes=""/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != 'class'>
                <#assign dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>

    <#assign htmlTag = "a" />
    <#if configLink.htmlTag?has_content && configLink.htmlTag == 'button'>
        <#assign htmlTag = "button" />
    </#if>

    <#assign classes = mainClass />
    <#if configLink.size?has_content>
        <#assign classes = classes + " ${mainClass}--${configLink.size}"/>
    </#if>

    <#if configLink.color?has_content>
        <#assign classes = classes + " ${mainClass}--${configLink.color}"/>
    </#if>

    <#if dataSup.class?has_content>
        <#assign classes = classes + " ${dataSup.class}"/>
    </#if>

    <@compress single_line=true>
      <#if configLink.icon?has_content>
          <@icons.icon iconPath="${configLink.icon.id!}" symbolOnly=true />
          <#if configLink.icon.side?has_content>
              <#assign iconSideClass = "${iconClass}--${configLink.icon.side!}" />
          </#if>
          <#assign iconCode><@icons.icon iconPath="${configLink.icon.id}" class="${iconClass} ${iconSideClass!}"/></#assign>
      </#if>
    </@compress>

    <@compress single_line=true>
      <${htmlTag} class="${classes}" ${dataAttributes}>
          <#if configLink.icon?has_content>
              <#if !configLink.icon.side?has_content || configLink.icon.side == "left">
                  ${iconCode}
              </#if>
              <#if !configLink.icon.iconOnly?has_content || configLink.icon.iconOnly != true>
                  <#nested>
              </#if>
              <#if configLink.icon.side?has_content && configLink.icon.side == "right">
                  ${iconCode}
              </#if>
          <#else>
              <#nested>
          </#if>
      </${htmlTag}>
    </@compress>
</#macro>

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