
<#import "icons.ftl" as icons>
<#import "image.ftl" as image>

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
    <div class="km-push-image">
        <#if (configPushImageParam.image)??>
            <div class="km-push-image__picture">
                <@image.picture alt="${configPushImageParam.image.alt!}" class="lazy" src="${configPushImageParam.image.imageSrc!}" imgClass="km-push-image__picture--image" />
            </div>
        </#if>
        <div class="km-push-image__content">
            <#if (configPushImageParam.title)??>
                <<#if (configPushImageParam.title.semantics)??>${configPushImageParam.title.semantics!}<#else>h3</#if> class="km-push-image__title">${configPushImageParam.title.name!}</<#if (configPushImageParam.title.semantics)??>${configPushImageParam.title.semantics!}<#else>h3</#if>>
            </#if>
            <#if (configPushImageParam.description)??>
                <p class="km-push-image__description">${configPushImageParam.description!}</p>
            </#if>
            <#if (configPushImageParam.button)??>
                <a class="ka-link km-push-image__link" href="${configPushImageParam.button.link!}">${configPushImageParam.button.label!}</a>
            </#if>
         </div>
    </div>
</#macro>

