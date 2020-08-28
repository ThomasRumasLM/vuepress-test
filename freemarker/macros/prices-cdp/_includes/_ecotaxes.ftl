<#import "../../common-macro.ftl" as macros>
<#import "../../icons.ftl" as icons>
<#import "../../link.ftl" as link>
<#include "../../tools/_format-price.function.ftl" />
<#import "locales/_fr.ftl" as language>
<#import "../../tokens/priceCdp.ftl" as priceCdpJson>
<#--
    printEcotaxes: Print list of ecotaxes
    @param ecotaxes : List of ecotaxes
        [{
            "linkLabel" : "link label 0",                         link label for pop-in
            "title" : "title popin 0",                            title for ecotax popin
            "text" : "Explanatory text of the ecotax 0",          text / content for ecotax popin
            "type": 0,                                            type of DEEE
            "price": 2.3                                          amount of DEEE
        },
        {
            "linkLabel" : "link label 1",                         link label for pop-in
            "title" : "title popin 1",                            title for ecotax popin
            "text" : "Explanatory text of the ecotax 1",          text / content for ecotax popin
            "type": 1,                                            type of DEEE
            "price": 2.5                                          amount of DEEE
        }]
    @param currency : "€"   symbol of the currency
-->
<#macro printEcotaxes ecotaxes currency>
    <#list ecotaxes as ecoTaxe>
        <#local ecoTaxeLinkCssClass = priceCdpJson.json.ecotaxes.class + priceCdpJson.json.ecotaxes.link />
        <#local ecoTaxeLinkIconCssClass = ecoTaxeLinkCssClass + priceCdpJson.json.ecotaxes.icon />
        <#local confPopin = {
            "title": "${ecoTaxe.title}",
            "footerHTML": "",
            "cssClass": {
                "popin": "js-popin-deee-${ecoTaxe?index}"
            },
            "desktopSize": "m",
            "fullscreen": true,
            "blocked": false,
            "role": "dialog"
        }>
        <div class="km-ecotaxes">
            ${language.which} ${formatPrice(ecoTaxe.price, currency)}
            <#local popinAttributeValue = "js-popin-deee-" + ecoTaxe?index />
            <#local popinCssClass>
            ${ecoTaxeLinkCssClass} js-popin-deee__button
            </#local>
            <@link.link href="#" class="${popinCssClass}" ariaLabel="" data\-popin="${popinAttributeValue}">${ecoTaxe.linkLabel}
                <@icons.icon iconPath="Navigation_Notification_Information_24px" class="${ecoTaxeLinkIconCssClass}" />
            </@link.link>
            <@macros.popin confPopin>
                ${ecoTaxe.text}
            </@macros.popin>
        </div>
    </#list>
</#macro>
