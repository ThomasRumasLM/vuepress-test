<#import "../common-macro.ftl" as macros>
<#--  BLADE : vendor or FLAP  -->
<#--  Product (optional) : seller  -->
<#--  Service (not applicable)  -->
<#if item.vendor?? && item.vendor.name?? && item.vendor.name != "">
    <div class="kl-blade kl-blade--vendor">
        Vendu et expédié par <span class="kl-blade--vendor__name" <@macros.cerberus "ELEM_vendorName"/> >${item.vendor.name}</span>
    </div>
</#if>
<#--  /BLADE : Vendor or FLAP  -->
