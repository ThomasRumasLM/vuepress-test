<#import "../common-macro.ftl" as macros>
<#include "../tools/_format-price.function.ftl" />
<#import "../tokens/priceCdp.ftl" as priceCdpJson>

<#include "_includes/_price-without-offer.ftl" />
<#include "_includes/_price-flag.ftl" />
<#include "_includes/_price-main.ftl" />
<#include "_includes/_price-secondary.ftl" />
<#include "_includes/_ecotaxes.ftl" />
<#include "_includes/_offer-refund.ftl" />

<#--
    showPriceCDP : show block price for a product with new offer's datas (product page, tile product in family page...)
    @param dataPrice
        "dataPrice" : {
            "mainPrice" : 9999.9,					[confirmed]     sell price
            "mainPriceUnit" : "Litre",				[confirmed]	    expected values : "m²" || "litre" || "unité"...
            "priceWithoutOffer" : 199.99,           [confirmed]     price without offer
            "priceEndDate" : "1565740800000",       [confirmed]       only if offer
            "currency" :                            [confirmed]
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "displayDiscount":                      [confirmed]
                {
                    "type": "PERCENTAGE",
                    "value": 14
                },
            "secondaryPrice" : 4.66,		        [confirmed]   only if product have conditionning
            "secondaryPriceUnit" : "m²",			[confirmed]   only if product have conditionning
            "refundsOfferProductLabel" : "20€ remboursés",      label of the refund offer
            "refundsOffermediaURL" : "http://leroymerlin.fr",   link to the file for the refund offer
            "type": "GOOD_PURCHASE", 		        [confirmed]   expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
            "ecotaxes" :                            [confirmed]
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
        }
    @param isLight{Boolean} - If full or light presentation
-->
<#macro showPriceCDP dataPrice isLight=false>
    <#assign mainCssClass = priceCdpJson.json.class />
    <#assign mainLightCssClass = mainCssClass + priceCdpJson.json.modifiers.light />
    <#assign mainDiscountCssClass = mainCssClass + priceCdpJson.json.modifiers.discount />
    <#assign cssClassLight = (isLight == true)?then(mainLightCssClass ,"")>
    <#assign cssClassWithoutOffer = ((dataPrice.priceWithoutOffer)?has_content)?then(cssClassLight + " " + mainDiscountCssClass ,cssClassLight)>
    <#assign cssClass = ((dataPrice.displayDiscount)?has_content)?then(cssClassWithoutOffer +  " " + mainDiscountCssClass ,cssClassWithoutOffer)>
    <div class="${mainCssClass} ${cssClass}">
        <#-- Price flag -->
        <@printPriceFlag
            type = dataPrice.type
            displayDiscount = dataPrice.displayDiscount
            currency = dataPrice.currency.value
            priceEndDate = dataPrice.priceEndDate
            isLight = isLight
        />
        <#-- Price without offer -->
        <#if (dataPrice.priceWithoutOffer)?has_content>
            <@printPriceWithoutOffer
                priceWithoutOffer = dataPrice.priceWithoutOffer
                currency= dataPrice.currency.value
            />
        </#if>
        <#-- primary price -->
        <@printSalePrice
            mainPrice = dataPrice.mainPrice
            mainPriceUnit = (dataPrice.mainPriceUnit)!""
            currency= dataPrice.currency.value
        />
        <#-- secondary price -->
        <#if (dataPrice.secondaryPrice)?has_content>
            <@printSecondaryPrice
                secondaryPrice = dataPrice.secondaryPrice
                secondaryPriceUnit = (dataPrice.secondaryPriceUnit)!""
                currency= dataPrice.currency.value
            />
        </#if>
        <#-- ecotaxes -->
        <#if isLight == false && (dataPrice.ecotaxes)?has_content>
            <@printEcotaxes
                ecotaxes = dataPrice.ecotaxes
                currency = dataPrice.currency.value
            />
        </#if>
       <#-- offerRefund tag -->
        <#if isLight == false && (dataPrice.refundsOfferProductLabel)?has_content>
            <@printOfferRefund
                refundsOfferProductLabel = dataPrice.refundsOfferProductLabel
                refundsOffermediaURL = (dataPrice.refundsOffermediaURL)!""
            />
        </#if>
    </div>
</#macro>
