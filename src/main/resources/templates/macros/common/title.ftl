<#import "common-macro.ftl" as macros>

<#--  MOZAIC HEADINGS

  <#import "../../macros/common/title.ftl" as title>

  <#assign titleExample = {
    "size": "s", // STRING, optionnal - "m" if empty - "s" / "l"
    "color": "lightest", // STRING, optionnal - "lightest"
    "underline": true, // BOOLEAN, optionnal
    "underlineColor": "primary-02-600", // STRING, optionnal - "primary-01" if empty - "primary-02-600" / "primary-01-200" / "primary-02-200"
    "align": "center", // STRING, optionnal - "left" / "center" / "right"
    "htmlTag": "h3", // STRING, optionnal - "h1" if empty - "h2" / "h3" etc.
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

  <@title.title titleExample >Lorem ipsum dolor sit amet consectetur adipisicing elit.</@title.title>

-->

<#--  Mozaic titles  -->
<#macro title configTitle = {}>
    <@compress single_line=true>
    <#assign prefix = "mt-heading" />
    <#assign dataAttr = "" />

    <#assign classes = prefix />

    <#--  Set HTML tag  -->
    <#assign tag = configTitle.htmlTag!"h1" />

    <#--  Add size class  -->
    <#if configTitle.size?has_content >
        <#assign classes = classes + " ${prefix}--${configTitle.size!}" />
    <#else>
        <#assign classes = classes + " ${prefix}--m" />
    </#if>

    <#--  Add weight class  -->
    <#if configTitle.weight?has_content >
        <#assign classes = classes + " ${prefix}--${configTitle.weight!}" />
    </#if>

    <#--  Add color class  -->
    <#if configTitle.color?has_content >
        <#assign classes = classes + " ${prefix}--${configTitle.color!}" />
    </#if>

    <#--  Add underline class  -->
    <#if configTitle.underline?has_content && configTitle.underline == true >
        <#assign classes = classes + " ${prefix}--underline" />
        <#if configTitle.underlineColor?has_content >
            <#assign classes = classes + " ${prefix}--line-${configTitle.underlineColor!}" />
        </#if>
    </#if>

    <#--  Add alignment Class  -->
    <#if configTitle.align?has_content >
        <#assign classes = classes + " ${prefix}--${configTitle.align!}" />
    </#if>

    <#--  Add custom CSS Class  -->
    <#if configTitle.cssClass?has_content >
        <#assign classes = classes + " ${configTitle.cssClass!}" />
    </#if>

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configTitle.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configTitle.dataTagco!}"' />
    </#if>
    <#if configTitle.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configTitle.dataTcevent!}"' />
    </#if>
    <#if configTitle.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configTitle.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configTitle.dataAttributes?has_content>
      <#list configTitle.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

    <${tag} class="${classes!}" ${dataAttr!}>
        <#nested>
    </${tag}>
    </@compress>
</#macro>
