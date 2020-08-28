<#import "../../tags.ftl" as tags>
<#import "../../tokens/tags.ftl" as tagsJson>
<#--
    printOfferRefund: Print a refund's offer
    @param refundsOfferProductLabel : "20€ remboursés",      label of the refund offer
    @param refundsOffermediaURL : "http://leroymerlin.fr",   link to the file for the refund offer //optional
-->
<#macro printOfferRefund refundsOfferProductLabel refundsOffermediaURL="">
    <#local tagDangerTextClass = tagsJson.json.class + "-" + tagsJson.json.types[0] + "--" + tagsJson.json.themes[1] />
    <#local tagDangerLinkClass = tagsJson.json.class + "-" + tagsJson.json.types[1] + "--" + tagsJson.json.themes[1] />

    <#if (refundsOffermediaURL)?has_content>
        <#local tagLink = { "type" : "link" } />
        <@tags.tagMozaic configTag=tagLink href="${refundsOffermediaURL}" class="${tagDangerLinkClass}" target="_blank">
            ${refundsOfferProductLabel}
        </@tags.tagMozaic>
    <#else>
        <#local tagText = { "type" : "text" } />
        <@tags.tagMozaic configTag=tagText class="${tagDangerTextClass}">${refundsOfferProductLabel}</@tags.tagMozaic>
    </#if>
</#macro>
