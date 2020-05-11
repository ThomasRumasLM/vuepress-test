<#import "icons.ftl" as icons>
<#--
    Macro de génération d'un accordéon
    Exemple
        <#assign conf = {
            "id": "accMacro",
            "customClass": m-maclass, // OPTIONNEL
            "headerIcon": true // OPTIONNEL
        }>

        <@accordionContainer conf>
            <@accordionHeader conf>
                TITLE 1
            </@accordionHeader>
            <@accordionContent conf>
                LIGNE 1<br>
                LIGNE 2
            </@accordionContent>
        </@accordionContainer>

    L'ID est obligatoire, la customClass et le headerIcon est optionnel
-->

<#--  Macro pour générer le container de l'accordéon  -->
<#macro accordionContainer configAccordion = {}>
  <div class="kl-accordion <#if configAccordion.customClass??>${configAccordion.customClass!}<#else>km-accordion</#if> js-accordion" id="${configAccordion.id}">
        <#nested>
    </div>
</#macro>

<#--  Macro pour générer le header de l'accordéon  -->
<#macro accordionHeader configAccordion = {}>
    <button type="button" class="<#if configAccordion.customClass??>${configAccordion.customClass!}<#else>km-accordion</#if>__header js-accordion__header">
        <#nested>
        <#if configAccordion.headerIcon?? && configAccordion.headerIcon == true>
        <div class="<#if configAccordion.customClass??>${configAccordion.customClass!}<#else>km-accordion</#if>__icon-container js-accordion__icon-container">
            <#if configAccordion.customClass??><#assign classCondition = configAccordion.customClass><#else><#assign classCondition = "km-accordion"></#if>
          <@icons.icon iconPath="Navigation_Control_More_32px" class="${classCondition!}__icon js-accordion__icon js-accordion__icon-more"/>
          <@icons.icon iconPath="Navigation_Control_Less_32px" class="${classCondition!}__icon js-accordion__icon js-accordion__icon-less kl-hidden"/>
        </div>
        </#if>
    </button>
</#macro>

<#--  Macro pour générer le panel de contenu de l'accordéon  -->
<#macro accordionContent configAccordion = {}>
    <div class="<#if configAccordion.customClass??>${configAccordion.customClass!}<#else>km-accordion</#if>__panel js-accordion__panel">
        <div class="<#if configAccordion.customClass??>${configAccordion.customClass!}<#else>km-accordion</#if>__content">
          <#nested>
        </div>
      </div>
</#macro>
