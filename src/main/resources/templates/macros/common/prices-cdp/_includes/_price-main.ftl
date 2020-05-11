<#import "../../common-macro.ftl" as macros>
<#include "../../tools/_format-price.function.ftl" />

<#--
    printSalePrice: Print the sale price
    @param mainPrice : 9999.9               sell price
    @param mainPriceUnit : "Litre"          expected values : "m²" || "litre" || "unité"...
    @param currency : "€"                   symbol of the currency
-->
<#macro printSalePrice mainPrice currency mainPriceUnit="">
    <#if (mainPrice)??>
        <#assign priceAriaLabel = mainPrice?string[",##0.00;; decimalSeparator=',' groupingSeparator=' '"] + " " + currency/>
        <p class="km-main-price">
            <span <@macros.cerberus attributeValue="ELEM_PRIX" /> aria-label="${priceAriaLabel} <#if (mainPriceUnit)?? && mainPriceUnit != "">par ${mainPriceUnit}</#if>">
            ${formatPrice(mainPrice, currency)}</span>
            <#if mainPriceUnit?has_content>
                <span class="km-main-price__unit" aria-hidden="true">/ ${mainPriceUnit}</span>
            </#if>
        </p>
    </#if>
</#macro>
