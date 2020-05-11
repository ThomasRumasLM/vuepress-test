<#import "../button.ftl" as buttons>

<#--  BLADE : ADD TO CART  -->
<#assign buttonConfig = {
  "eventAddToCart": (config.eventAddToCart)!true,
  "size": "s",
  "style": "bordered",
  "width": "full",
  "cssClass": "js-add-to-cart add-to-cart-button mc-button--m@from-xl",
  "dataAttributesAddToCart": (config.dataAttributesAddToCart)![],
  "displayIcon": false
} />

<form class="js-cross-sell-add-to-cart-form kl-blade--add-to-cart">
  <input type="hidden" name="reflm" value="${item.refLM}" />
  <input type="hidden" name="quantity" value="1" />
  <@buttons.addToCart config = buttonConfig />
</form>
<#--  /BLADE : ADD TO CART  -->
