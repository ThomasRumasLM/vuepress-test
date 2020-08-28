<#import "locales/_fr.ftl" as language>
<#import "../../tokens/priceCdp.ftl" as priceCdpJson>
<#--
    printPriceFlag: Print a flag info
    @param type: "GOOD_PURCHASE", 		    [confirmed]   expected values : "FIRST_PRICE", "GOOD_PURCHASE", "STAR_PRODUCT", "DESTOCKING", "OPE_COM", ""
    @param currency : "€"                   symbol of the currency
    @param priceEndDate" : "1565740800000"  [confirmed]       only if offer
    @param isLight{Boolean}                 If full or light presentation
    "displayDiscount":                      [confirmed]
        {
            "type": "PERCENTAGE",
            "value": 14
        },
-->
<#macro printPriceFlag type currency displayDiscount="" isLight=false priceEndDate="">
    <#local flagToken = priceCdpJson.json.flagsPrice />
    <#local flagTokenModifiers = priceCdpJson.json.modifiers />
    <#local flagCssClass = priceCdpJson.json.price.class + flagToken.flagPrice />
    <#local flagClearanceCssClass = flagCssClass + flagTokenModifiers.clearance />
    <#local flagDiscountCssClass = flagCssClass + flagTokenModifiers.discount />

    <#switch type>
        <#case "FIRST_PRICE">
            <div class="${flagCssClass}${flagTokenModifiers.firstprice}">
                ${language.flag_first_price}
            </div>
        <#break>
        <#case "GOOD_PURCHASE">
            <div class="${flagCssClass}${flagTokenModifiers.bestvalue}">
                ${language.flag_good_purchase}
            </div>
        <#break>
        <#case "HIGH_QUALITY">
            <div class="${flagCssClass}${flagTokenModifiers.highquality}">
                ${language.flag_high_quality}
            </div>
        <#break>
        <#case "STAR_PRODUCT">
            <div class="${flagCssClass}${flagTokenModifiers.starproduct}">
                ${language.flag_star_product}
            </div>
        <#break>
        <#case "DESTOCKING">
            <#if (displayDiscount)?has_content>
                <div class="${flagClearanceCssClass}">
                    <div class="${flagClearanceCssClass}${flagToken.label}">${language.flag_destocking}</div>
                    <div class="${flagClearanceCssClass}${flagToken.amount}">
                        <#if displayDiscount.type = "PERCENTAGE">
                            <#local discountUnitLabel = "%" />
                        <#else>
                            <#local discountUnitLabel = currency />
                        </#if>
                        - ${displayDiscount.value?string["0"]} ${discountUnitLabel}
                    </div>
                </div>
            </#if>
        <#break>
        <#case "OPE_COM">
            <#if (displayDiscount)?has_content>
                <div class="${flagDiscountCssClass}">
                    <#if displayDiscount.type = "PERCENTAGE">
                        <#local discountUnitLabel = "%" />
                    <#else>
                        <#local discountUnitLabel = currency />
                    </#if>
                    - ${displayDiscount.value?string["0"]} ${discountUnitLabel}
                </div>
                <div class="${flagDiscountCssClass}${flagToken.enddate}">${language.flag_ope_com} ${priceEndDate?string["dd MMMM"]}</div>
            </#if>
        <#break>
        <#case "DISCOUNT">
            <#if (displayDiscount)?has_content>
                <div class="${flagDiscountCssClass}">
                    <#if displayDiscount.type = "PERCENTAGE">
                        <#local discountUnitLabel = "%" />
                    <#else>
                        <#local discountUnitLabel = currency />
                    </#if>
                    - ${displayDiscount.value?string["0"]} ${discountUnitLabel}
                </div>
            </#if>
        <#break>
    </#switch>
</#macro>
