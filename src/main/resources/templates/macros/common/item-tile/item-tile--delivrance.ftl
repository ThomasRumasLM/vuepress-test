<#import "../icons.ftl" as icons>

<#--  BLADE : DELIVRANCE  -->
<#--  Product (optional)  -->
<#--  Service (not applicable)  -->
<#if item.storeDelivery.availableInTwoHours?? || item.storeDelivery.deliveryOffered?? || item.storeDelivery.deliveryIncluded??>
  <div class="kl-blade kl-blade--delivery">
      <#if item.storeDelivery.availableInTwoHours?? && item.storeDelivery.availableInTwoHours>
        <p class="ka-list-check-text">
          <@icons.icon iconPath="Navigation_Notification_Available_16px" class="ka-list-check-text__icon"/> Retrait magasin
        </p>
      </#if>
      <#if item.storeDelivery.deliveryOffered?? && item.storeDelivery.deliveryOffered>
        <p class="ka-list-check-text">
          <@icons.icon iconPath="Navigation_Notification_Available_16px" class="ka-list-check-text__icon"/> Livraison offerte
        </p>
      </#if>
      <#if item.storeDelivery.deliveryIncluded?? && item.storeDelivery.deliveryIncluded>
        <p class="ka-list-check-text">
          <@icons.icon iconPath="Navigation_Notification_Available_16px" class="ka-list-check-text__icon"/> Livraison incluse
        </p>
      </#if>
  </div>
</#if>
<#--  /BLADE : DELIVRANCE  -->
