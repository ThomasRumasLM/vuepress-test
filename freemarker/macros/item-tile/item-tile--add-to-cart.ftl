<#import "../button.ftl" as buttons>

<#--  BLADE : ADD TO CART  -->
<#assign buttonConfig = {
  "size": "s",
  "style": "bordered",
  "width": "full",
  "displayIcon": false
} />

<#assign classes = "js-add-to-cart add-to-cart-button mc-button--m@from-xl"/>
<#if config.eventAddToCart?has_content && config.eventAddToCart == true>
  <#assign classes = classes + " js-tagGA"/>
</#if>

<form class="js-cross-sell-add-to-cart-form kl-blade--add-to-cart">
  <input type="hidden" name="reflm" value="${item.refLM}" />
  <input type="hidden" name="quantity" value="1" />
  <@buttons.addToCart config = buttonConfig class="${classes}" dataInherit = config.dataAttributesAddToCart![] />
</form>
<#--  /BLADE : ADD TO CART  -->
