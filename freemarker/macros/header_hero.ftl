<#import "common-macro.ftl" as macros>
<#import "title.ftl" as title>
<#import "./tokens/headerHero.ftl" as heroJson>

<#--  Generate a header hero  -->
<#macro headerHero configHeaderHero = {}>
    <#assign contentClass = heroJson.json.class + heroJson.json.content/>
    <#assign titleClass = heroJson.json.class + heroJson.json.title/>
    <#assign descriptionClass = heroJson.json.class + heroJson.json.description/>
    <#assign imgContainerClass = heroJson.json.class + heroJson.json.imageContainer/>
    <#assign imageClass = heroJson.json.class + heroJson.json.image/>
    <#assign dataAttr = "" />

    <#assign titleHero = {
        "size": "l",
        "color": "lightest",
        "weight": "bold",
        "underline": false,
        "heading": 1
      }
    />

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

    <div class="${heroJson.json.class} ${configHeaderHero.cssClass!}" ${dataAttr!}>
        <div class="col-container">
            <div class="${contentClass} col-12">
                <@title.heading configHeading = titleHero class="${titleClass}">${configHeaderHero.title!}</@title.heading>
                <p class="${descriptionClass}">${configHeaderHero.description!}</p>
            </div>
        </div>
        <div class="${imgContainerClass}">
            <img class="${imageClass}" src="${configHeaderHero.image.src!}" alt="${configHeaderHero.image.alt!}"/>
        </div>
    </div>
</#macro>
