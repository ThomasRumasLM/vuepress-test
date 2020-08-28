<#--  BLADE : DESIGNATION  -->
<#--  Product/Service designation (mandatory)  -->
<#--    - product : 4 lines max  -->
<#--    - service : 2 lines max  -->

<#assign dataAttributes = (config.dataAttributesItemTile)![] />
<#if (item.designation)??>
  <div class="kl-blade">
    <#assign designation = item.designation>
    <#if (item.tagName)??>
    <${item.tagName} class="km-tile-designation <#if twoLineClamp>km-tile-designation--two-lines</#if>">
    <#else>
    <p class="km-tile-designation <#if twoLineClamp>km-tile-designation--two-lines</#if>">
    </#if>
      <#if (item.url)??>
        <a href="${item.url}" class="km-tile-designation__link"
         <#list dataAttributes as attr> data-${attr.name}=${attr.value}</#list>></#if>
        ${designation}
      <#if (item.url)??></a></#if>
    <#if (item.tagName)??>
    </${item.tagName}>
    <#else>
    </p>
    </#if>
  </div>
</#if>
<#--  /BLADE : DESIGNATION  -->
