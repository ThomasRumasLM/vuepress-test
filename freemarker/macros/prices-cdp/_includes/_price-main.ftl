<#import "../../common-macro.ftl" as macros>
<#include "../../tools/_format-price.function.ftl" />
<#import "locales/_fr.ftl" as language>
<#import "../../tokens/priceCdp.ftl" as priceCdpJson>
<#--
    printSalePrice: Print the sale price
    @param mainPrice : 9999.9               sell price
    @param mainPriceUnit : "Litre"          expected values : "m²" || "litre" || "unité"...
    @param currency : "€"                   symbol of the currency
-->
<#macro printSalePrice mainPrice currency mainPriceUnit="">
    <#local mainPriceCssClass = priceCdpJson.json.price.mainClass />
    <#local mainPriceUnitCssClass = mainPriceCssClass + priceCdpJson.json.price.unit />
    <#if (mainPrice)??>
        <#local priceAriaLabel = mainPrice?string[",##0.00;; decimalSeparator=',' groupingSeparator=' '"] + " " + currency/>
        <p class="${mainPriceCssClass}">
            <span <@macros.cerberus attributeValue="ELEM_PRIX" /> aria-label="${priceAriaLabel} <#if (mainPriceUnit)?? && mainPriceUnit != "">${language.by} ${mainPriceUnit}</#if>">
            ${formatPrice(mainPrice, currency)}</span>
            <#if mainPriceUnit?has_content>
                <span class="${mainPriceUnitCssClass}" aria-hidden="true">/ ${mainPriceUnit}</span>
            </#if>
        </p>
    </#if>
</#macro>
