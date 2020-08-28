<#import "../image.ftl" as image>
<#--  BLADE : BRAND or FLAP  -->
<#--  Product (optional) : brand  -->
<#--  Service (not applicable)  -->
<#if (item.brand)?? && (item.brand.image != "")>
    <div class="kl-blade kl-blade--brand">
        <@image.image alt="${item.brand.label}" class="kl-tile__brand-image lazy" src="${item.brand.image}?width=150" prmLoad="lazy" />
    </div>
</#if>
<#--  /BLADE : BRAND or FLAP  -->
