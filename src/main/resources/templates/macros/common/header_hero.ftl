<#import "common-macro.ftl" as macros>

<#--  Generate a header hero  -->
<#macro headerHero configHeaderHero = {}>
    <#assign dataAttr = "" />

    <#--  Add DATA: TagCo, TcEvent, Cerberus, custom data attributes  -->
    <#if configHeaderHero.dataTagco?has_content>
      <#assign dataAttr = dataAttr + ' data-tagco="${configHeaderHero.dataTagco!}"' />
    </#if>
    <#if configHeaderHero.dataTcevent?has_content>
      <#assign dataAttr = dataAttr + ' data-tcevent="${configHeaderHero.dataTcevent!}"' />
    </#if>
    <#if configHeaderHero.cerberus?has_content>
      <#assign dataCerberus> <@macros.cerberus "${configHeaderHero.cerberus!}" /></#assign>
      <#assign dataAttr = dataAttr + dataCerberus />
    </#if>
    <#if configHeaderHero.dataAttributes?has_content>
      <#list configHeaderHero.dataAttributes as attr>
        <#assign dataAttr = dataAttr + ' data-${attr.name!}="${attr.value!}"' />
      </#list>
    </#if>

    <div class="ko-header-hero ${configHeaderHero.cssClass!}" ${dataAttr!}>
        <div class="col-container">
            <div class="ko-header-hero__content col-12">
                <h1 class="ko-header-hero__title">${configHeaderHero.title!}</h1>
                <p class="ko-header-hero__description">${configHeaderHero.description!}</p>
            </div>
        </div>
        <div class="ko-header-hero__bloc-img">
            <img class="ko-header-hero__img" src="${configHeaderHero.image.src!}" alt="${configHeaderHero.image.alt!}"/>
        </div>
    </div>
</#macro>
