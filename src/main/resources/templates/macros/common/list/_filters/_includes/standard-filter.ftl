<#import "../../../form/fields.ftl" as fields>
<#import "../../../common-macro.ftl" as macros>
<#import "header-filter.ftl" as headerFilter>
<#import "more-info.ftl" as moreInfos>
<#--
  show standard filter
  config {
  "filter" : object , the details of standard (checkbox) filter,
  "index" : integer / for the collpase element,
  "customClass" : customClass,
  "labelCerberus":labelCerberus"
  }
-->

<#macro standardFilter config >

    <#assign configHeader = {"filter":config.filter,"showExamples":true,"customClass":config.customClass,"values":config.filter.values}>
    <@headerFilter.header  configHeader />

       <div class="ko-filter-item__content js-accordion__panel <#if config.customClass?has_content>${config.customClass}__standard-filter</#if>" data-panel="${config.index}" data-category-code="${(config.code??)?then(config.code,config.filter.code)}" data-filters-type="${config.filter.type}" >
             <@moreInfos.moreInfo config.filter />
             <#assign nbValuesToDisplay = ((config.filter.getNumberValuesToDisplay())??)?then(config.filter.getNumberValuesToDisplay(),"")>
             <#assign objectValues = {}>
             <#assign inputValues = []>
            <#list config.filter.values as filter>
                <#assign ariaLabel = (filter.total?? && filter.total gt 1)?then("${filter.total} élément","${filter.total} éléments")>
                <#assign inputValues =  inputValues +
                [{
                "label": (filter.label??)?then(filter.label,filter.value),
                "value" : filter.value,
                "checked":filter.applied,
                "cssClass" : "js-filter-tracking",
                "data" : {
                "input" : {
                "category" : "${config.filter.label}",
                "type" : "${filter.type}"
                }
                },
                "suffix" : {
                "label":"(${filter.total})",
                "cssClass":"km-content-filter__suffix-label",
                "data":{
                "aria-label":"${ariaLabel}",
                "cerberus":"ELEM_Nombre${config.labelCerberus?cap_first}Filtre"
                }
                }
                }]>
            </#list>

<#assign flConfig = {'name':'${(config.code??)?then(config.code,config.filter.code)}','label':'${config.filter.label}',"CSSClass" : {"wrapper" : "km-standard-filter", "label": "kl-hidden"},'values':inputValues}>
           <div class="kl-showmore" id="js-showMore-${(config.code??)?then(config.code,config.filter.code)}"
                data-nb-filters-to-display="${nbValuesToDisplay}">
    <@fields.checkboxList config=flConfig />
           </div>
       </div>

</#macro>
