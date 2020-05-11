<#--  BLADE : DISCOUNT or STICKER "1st price"  -->
<#--  Product (optional)  -->
<#--  Service (not applicable)  -->
<#if item.starProduct || item.firstPrice>
  <div class="kl-blade">
    <#if item.firstPrice >
      <#assign colorFlag="yellow" />
    </#if>
    <#if item.starProduct >
      <#assign colorFlag="red" />
    </#if>
    <#if (item.pricePolicy)?? || (item.pricePolicy != "")>
      <p class="ka-price-policy-flag ka-price-policy-flag--${colorFlag}">${item.pricePolicy}</p>
    </#if>
  </div>
</#if>
<#--  /BLADE : DISCOUNT or STICKER "1st price"  -->
