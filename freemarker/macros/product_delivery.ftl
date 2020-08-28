<#--
    productDelivery : Show delivery informations for a product

        Retrait 2h en magasin à Villeneuve d'Ascq       GRATUIT
        Livraison en 5 jours chez vous                    9.99€
        Livraison en 2 jours en point relais              3.99€

    @param deliveryInfos<object> [required] : array of delivery methods having the following structure :
        deliveryInfos = [
            {
                "deliveryType" : "storeDelivery",       // Possible values : storeDelivery || homeDelivery || relayDelivery
                "formatedDeliveryPromise" : "2h",       // Formatted delivery time : 2h || 5 jours || 48h || 3 semaines...
                "formatedCostFrom" : "gratuit",         // Formatted price : 3.99€ || 9.99€ || gratuit
                "storeLabel" : "Villeneuve d'Ascq",     // Store name (if context) (only for "storeDelivery")
                "urlContext" : "#"                     // Store context url  (only for "storeDelivery")
            }
        ]
    @param cssClass<string> [optional] : cssClass for some styles...
-->
<#macro productDelivery deliveryInfos = [] cssClass="">
    <#if deliveryInfos?size &gt; 0 >
        <ul class="km-delivery-product ${cssClass!}">
            <#list deliveryInfos as delivery>
                <#if delivery.type == "homeDelivery">
                    <#assign deliveryTypeLabel = "Livraison en " />
                    <#assign deliveryPlaceLabel = " chez vous" />
                <#elseif delivery.type == "relayDelivery">
                    <#assign deliveryTypeLabel = "Livraison en " />
                    <#assign deliveryPlaceLabel = " en point relais" />
                <#elseif delivery.type == "storeDelivery">
                    <#assign deliveryTypeLabel = "Retrait " />
                    <#assign deliveryPlaceLabel = " à " + (delivery.storeLabel)!"" />
                </#if>

                <li class="km-delivery-product__item">
                    <div>
                        <#if delivery.type == "storeDelivery">
                            <span class="km-delivery-product__type">${deliveryTypeLabel} en magasin</span>
                        <#else>
                            <span class="km-delivery-product__type">${deliveryTypeLabel} ${delivery.formatedDeliveryPromise}</span>
                        </#if>

                        <#-- Si on a une URL de context alors on affiche le lien de context, sinon on affiche juste le nom du magasin -->
                        <#if delivery.type == "storeDelivery" && (delivery.urlContext)?? && delivery.urlContext != "">
                            <a class="km-delivery-product__place" href="${delivery.urlContext}">${deliveryPlaceLabel}</a>
                        <#else>
                            <span class="km-delivery-product__place">${deliveryPlaceLabel}</span>
                        </#if>
                    </div>

                    <div>
                        <span class="km-delivery-product__price">${delivery.formatedCostFrom}</span>
                    </div>
                </li>
            </#list>
        </ul>
    </#if>
</#macro>
