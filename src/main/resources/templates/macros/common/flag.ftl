<#import "common-macro.ftl" as macros>

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
