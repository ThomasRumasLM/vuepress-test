<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#import "./tokens/card.ftl" as cardJson>

<#--  Generate a card based on type  -->
<#macro card configCard = {}>
    <#assign dataAttr = "" />

    <#switch configCard.type>
      <#case "benefits">
        <#assign mainClass = cardJson.json.benefits />
        <#break>
      <#default>
        <#assign mainClass = cardJson.json.steps />
        <#break>
    </#switch>

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configCard.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configCard.dataTagco!}"' />
    </#if>
    <#if configCard.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configCard.dataTcevent!}"' />
    </#if>
    <#if configCard.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configCard.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configCard.dataAttributes?has_content>
      <#list configCard.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

   <div class="${mainClass} ${configCard.cssClass!}" ${dataAttr!}>
        <div class="${mainClass}${cardJson.json.picto}">
            <@icons.icon iconPath="${configCard.icon!}" class="km-card-${configCard.type!}__picto--svg" />
        </div>
        <div class="${mainClass}${cardJson.json.content}">
            <h3 class="${mainClass}${cardJson.json.title}">${configCard.title!}</h3>
            <p class="${mainClass}${cardJson.json.description}">${configCard.description!}</p>
        </div>
    </div>
</#macro>
