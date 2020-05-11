<#-- 
This macro accept one or more parameters

@eturn true if : 
  key exist and :
    Number more than 0
    Or String not empty
    Or Boolean return true
    Or Sequence or Hash not empty
-->
<#macro notEmpty keys...>
  <#list keys as key>
    <#if (key)?? && (key?is_number && key > 0 || key?is_string && key != "" || key?is_boolean && key == true || (key?is_sequence || key?is_hash) && key?size > 0)>
      <#nested>
      <#break>
    </#if>
  </#list>
</#macro>