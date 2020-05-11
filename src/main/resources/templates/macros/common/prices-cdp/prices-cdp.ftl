<#import "../common-macro.ftl" as macros>
<#include "../tools/_format-price.function.ftl" />

<#include "_includes/_price-without-offer.ftl" />
<#include "_includes/_price-main.ftl" />
<#include "_includes/_ecotaxes.ftl" />

<#--
    showPriceCDP : show block price for a product with new offer's datas (product page, tile product in family page...)
    @param dataPrice
        "dataPrice" : {
            "mainPrice" : 9999.9,					[confirmed]     sell price
            "mainPriceUnit" : "Litre",				[waiting]	    expected values : "m²" || "litre" || "unité"...
            "priceWithoutOffer" : 199.99,           [confirmed]     price without offer
            "priceEndDate" : "1565740800000",       [waiting]       only if offer
            "currency" :                            [confirmed]
                {
                    "label" : "EUR",
                    "value" : "€"
                },
            "displayDiscount":                      [waiting]
                {
                    "type": "PERCENTAGE",
                    "value": 14
                },
            "secondaryPrice" : 4.66,		        [waiting]   only if product have conditionning
            "secondaryPriceUnit" : "m²",			[waiting]   only if product have conditionning
            "refundsOfferLabel" : "20€ remboursés",	[waiting]   "ODR"
            "type": "GOOD_PURCHASE", 		        [waiting]   expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
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
    <#assign cssClassLight = (isLight == true)?then("kl-price--light" ,"")>
    <#assign cssClass = ((dataPrice.priceWithoutOffer)?has_content)?then(cssClassLight + " kl-price--discount" ,cssClassLight)>
    <div class="kl-price ${cssClass}">
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
        <#-- ecotaxes -->
        <#if isLight == false && (dataPrice.ecotaxes)?has_content>
            <@printEcotaxes
                ecotaxes = dataPrice.ecotaxes
                currency = dataPrice.currency.value
            />
        </#if>
    </div>
</#macro>
