<#import "../../icons.ftl" as icons>
<#import "../../link.ftl" as link>
<#include "../../tools/_format-price.function.ftl" />

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
        <#assign confPopin = {
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
            dont ${formatPrice(ecoTaxe.price, currency)}
            <#assign popinAttributeValue = "js-popin-deee-" + ecoTaxe?index />
            <#assign linkDeee = {
                "href": "#",
                "cssClass": "km-ecotaxes__link js-popin-deee__button",
                "ariaLabel": "",
                "dataAttributes": [
                    {'name': 'popin', 'value': popinAttributeValue }
                ]
            }/>
            <@link.linkMozaic configLink = linkDeee >${ecoTaxe.linkLabel}
                <@icons.icon iconPath="Navigation_Notification_Information_24px" class="km-ecotaxes__link-icon" />
            </@link.linkMozaic>
            <@macros.popin confPopin>
                ${ecoTaxe.text}
            </@macros.popin>
        </div>
    </#list>
</#macro>
