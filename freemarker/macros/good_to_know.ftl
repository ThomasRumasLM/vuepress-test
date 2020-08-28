<#import "common-macro.ftl" as macros>
<#import "./tokens/goodToKnow.ftl" as goodJson>

<#--  Generate a good-to-know component  -->
<#macro goodToKnow configGoodToKnow = {}>
    <#assign title = goodJson.json.class + goodJson.json.title />
    <#assign description = goodJson.json.class + goodJson.json.description />
    <#assign link = goodJson.json.class + goodJson.json.link />
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

    <div class="${goodJson.json.class} ${configGoodToKnow.cssClass!}" ${dataAttr!}>
        <h3 class="${title}">${configGoodToKnow.title!}</h3>
        <p class="${description}">${configGoodToKnow.description!}</p>
        <#if configGoodToKnow.link?has_content>
          <a href="${configGoodToKnow.link.href!}" target="_blank" class="mc-link ${link}">${configGoodToKnow.link.label!}</a>
        </#if>
    </div>
</#macro>
