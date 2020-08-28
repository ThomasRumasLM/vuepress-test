<#import "common-macro.ftl" as macros>
<#import "./tokens/flag.ftl" as jsonFlag>

<#--  Generate a flag  -->
<#macro flag configFlag = {}>
    <#assign dataAttr = "" />

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configFlag.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configFlag.dataTagco!}"' />
    </#if>
    <#if configFlag.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configFlag.dataTcevent!}"' />
    </#if>
    <#if configFlag.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configFlag.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configFlag.dataAttributes?has_content>
      <#list configFlag.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

    <span class="ka-flag <#if configFlag.type?has_content>ka-flag--${configFlag.type!} </#if><#if configFlag.color?has_content>ka-flag--${configFlag.color!} </#if>${configFlag.cssClass!}" ${dataAttr!}>
        ${configFlag.label!}
    </span>
</#macro>

<#macro flagMozaic configFlag = {} dataSup...>
  <#assign mainClass = jsonFlag.json.class />
  <#assign labelClass = jsonFlag.json.class + jsonFlag.json.label />
  <#assign classes = mainClass />

  <#assign dataAttributes = "" />
  <#if dataSup?is_hash>
    <#list dataSup as key, value>
        <#if key != 'class'>
            <#assign dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
        </#if>
    </#list>
    <#if dataSup.class?has_content>
      <#assign classes = classes + " ${dataSup.class}"/>
    </#if>
  </#if>

  <#assign classes = mainClass />
  <#if configFlag.theme?has_content>
    <#assign classes = classes + " ${mainClass}--${configFlag.theme}" />
  </#if>

  <div class="${classes}" ${dataAttributes}>
    <span>
      <#nested/>
    </span>
  </div>
</#macro>
