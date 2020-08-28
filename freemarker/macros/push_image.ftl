<#import "icons.ftl" as icons>
<#import "image.ftl" as image>
<#import "link.ftl" as link>

<#--
    @param configPushImage : object
    * type : String
    exemple  :
    <#import "../../macros/common/push_image.ftl" as pushs>
    <#assign configPushImageParam  = {
        "title" : {
            "name": "Tous nos forfaits de pose",
            "semantics": "h3"
        },
        "description":"La pose de votre robinet par un professionnel",
        "image" : {
            "imageSrc":"/static/img/push.jpg",
            "alt": "La pose de votre robinet par un professionnel"
        },
        "button" : {
            "label" : "J'en profite",
            "link" : "/"
        }
    }/>
    <@pushImage.pushImage configPushImageParam>
    </@pushImage.pushImage>
-->

<#--  Macro pour générer le push  -->
<#macro pushImage configPushImageParam = {}>
    <#assign illu = configPushImageParam.image/>
    <#assign title = configPushImageParam.title/>
    <#assign button = configPushImageParam.button/>

    <#assign semantics = "h3"/>
    <#if title.semantics??>
        <#assign semantics = title.semantics/>
    </#if>

    <div class="km-push-image">
        <#if illu??>
            <div class="km-push-image__picture">
                <@image.image alt=illu.alt! class="km-push-image__picture--image lazy"  src="${illu.imageSrc!}?width=300&crop=1:1,smart&auto=webp"/>
            </div>
        </#if>
        <div class="km-push-image__content">
            <#if title??>
                <${semantics} class="km-push-image__title">${title.name!}</${semantics}>
            </#if>
            <#if (configPushImageParam.description)??>
                <p class="km-push-image__description">${configPushImageParam.description?truncate_w(130,'...')}</p>
            </#if>
            <#if button??>
                <@link.link class="mc-link km-push-image__link" href=button.link!>
                    ${button.label!}
                </@link.link>
            </#if>
         </div>
    </div>
</#macro>