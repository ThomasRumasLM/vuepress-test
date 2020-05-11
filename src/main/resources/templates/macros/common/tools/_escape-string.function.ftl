<#-- function escapeString : escape simple quote in string & replace double quote by special character
    @params myString<string>
-->
<#function escapeString myString>
    <#return myString?js_string?replace('"','&quot;')>
</#function>
