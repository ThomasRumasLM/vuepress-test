<#import "../prices.ftl" as prices>
<#import "../prices-cdp/prices-cdp.ftl" as pricesCDP>
<#--  BLADE : PRICE (mandatory) -->
<div class="kl-blade kl-blade--price">
    <#assign values = item.price />
    <#if values?has_content>
        <#if (item.priceCDP)?? && item.priceCDP>
            <@pricesCDP.showPriceCDP values true />
        <#else>
            <!-- If price > new data and call macro showprice -->
            <#if (values.mainPrice)??>
                <@prices.showPrice values true />
            <#elseif (values.price)??> <!-- else > old data and call macro price -->
                <@prices.price values true />
            </#if>
        </#if>
    </#if>
</div>
<#--  /BLADE : PRICE  -->
