<#import "common-macro.ftl" as macros>

<#--  Generate a good-to-know component  -->
<#macro goodToKnow configGoodToKnow = {}>
    <#assign dataAttr = "" />

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configGoodToKnow.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configGoodToKnow.dataTagco!}"' />
    </#if>
    <#if configGoodToKnow.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configGoodToKnow.dataTcevent!}"' />
    </#if>
    <#if configGoodToKnow.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configGoodToKnow.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configGoodToKnow.dataAttributes?has_content>
      <#list configGoodToKnow.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

    <div class="km-good-to-know ${configGoodToKnow.cssClass!}" ${dataAttr!}>
        <h3 class="km-good-to-know__title">${configGoodToKnow.title!}</h3>
        <p class="km-good-to-know__description">${configGoodToKnow.description!}</p>
        <#if configGoodToKnow.link?has_content>
        <a href="${configGoodToKnow.link.href!}" target="_blank" class="mc-link km-good-to-know__link">${configGoodToKnow.link.label!}</a>
        </#if>
    </div>
</#macro>
