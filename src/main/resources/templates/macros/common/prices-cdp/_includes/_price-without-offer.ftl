<#include "../../tools/_format-price.function.ftl" />
<#--
    printPriceWithoutOffer: Print the sale price
    @param priceWithoutOffer : 9999.9       sale price without offer
    @param currency : "€"                   symbol of the currency
-->
<#macro printPriceWithoutOffer priceWithoutOffer currency>
    <#if (priceWithoutOffer)??>
        <p class="km-price-without-offer">
            ${formatPrice(priceWithoutOffer, currency)}
        </p>
    </#if>
</#macro>
