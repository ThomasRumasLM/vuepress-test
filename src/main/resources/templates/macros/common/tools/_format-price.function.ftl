<#-- function formatPrice : return a formatted price (ex : 9 999.00 €)
    @params price<number> (ex : 9999.9)
    @params currency<string> : the symbol (ex : "€")
-->
<#function formatPrice price currency>
    <#assign result = price?string[",##0.00;; decimalSeparator='.' groupingSeparator=' '"] + " " + currency />
    <#return result>
</#function>
