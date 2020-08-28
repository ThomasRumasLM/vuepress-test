<#include "../../tools/_format-price.function.ftl" />
<#import "../../tokens/priceCdp.ftl" as priceCdpJson>
<#--
    printPriceWithoutOffer: Print the sale price
    @param priceWithoutOffer : 9999.9       sale price without offer
    @param currency : "€"                   symbol of the currency
-->
<#macro printPriceWithoutOffer priceWithoutOffer currency>
    <#local priceFromCssClass = priceCdpJson.json.price.class + priceCdpJson.json.price.from />
    <#local priceWithoutOfferCssClass = priceFromCssClass + priceCdpJson.json.price.withoutoffer />
    <#if (priceFromCssClass)??>
        <p class="${priceFromCssClass}">
            <span class="${priceWithoutOfferCssClass}">${formatPrice(priceWithoutOffer, currency)}</span>
        </p>
    </#if>
</#macro>
