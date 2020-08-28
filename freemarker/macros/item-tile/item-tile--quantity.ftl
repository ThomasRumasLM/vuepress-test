<#--  BLADE : quantity  -->
<#if (item.quantity)??>
    <div class="kl-blade">
        <#if (item.addToCartStatus)?? && (item.addToCartStatus == "partiallyOutOfStock")>
            <span class="km-tile-quantity km-tile-quantity--warning">
                Quantité : ${item.quantity}
            </span>
        <#elseif (item.addToCartStatus)?? && (item.addToCartStatus == "outOfStock")>
            <span class="km-tile-quantity km-tile-quantity--error">
                Non disponible
            </span>
        <#else>
            <span class="km-tile-quantity">
                Quantité : ${item.quantity}
            </span>
        </#if>
    </div>
</#if>
<#--  /BLADE : quantity  -->
