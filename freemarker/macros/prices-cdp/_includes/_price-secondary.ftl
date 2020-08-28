<#include "../../tools/_format-price.function.ftl" />
<#import "locales/_fr.ftl" as language>
<#import "../../tokens/priceCdp.ftl" as priceCdpJson>
<#--
    printSecondaryPrice: Print the secondary sale price if product have conditionning
    @param secondaryPrice : 4.66,		[confirmed]   only if product have conditionning
    @param secondaryPriceUnit : "m²",	[confirmed]   only if product have conditionning
    @param currency : "€"               symbol of the currency
-->
<#macro printSecondaryPrice secondaryPrice currency secondaryPriceUnit="">
    <#local secondaryPriceCssClass = priceCdpJson.json.price.class + priceCdpJson.json.price.secondary />
    <#local priceAriaLabel>
        ${language.either} ${secondaryPrice?string[",##0.00;; decimalSeparator=',' groupingSeparator=' '"]} ${currency}
        <#if (secondaryPriceUnit)?has_content>
            ${language.by} ${secondaryPriceUnit}
        </#if>
    </#local>
    <p class="${secondaryPriceCssClass}" aria-label="${priceAriaLabel} ">
        ${language.either} ${formatPrice(secondaryPrice, currency)}
        <#if secondaryPriceUnit?has_content>
            <span aria-hidden="true">/ ${secondaryPriceUnit}</span>
        </#if>
    </p>
</#macro>
