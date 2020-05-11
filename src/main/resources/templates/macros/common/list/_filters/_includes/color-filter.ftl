<#import "../../../form/fields.ftl" as fields>
<#import "../../../common-macro.ftl" as macros>
<#import "header-filter.ftl" as headerFilter>
<#import "more-info.ftl" as moreInfos>

<#--
  show color filter
  config {
  "filter" : object , the details of standard (checkbox) filter,
  "index" : integer / for the collpase element,
  "customClass" : customClass,
  "labelCerberus":labelCerberus"
  }
-->
<#macro colorFilter config >
    <#assign configHeader = {"filter":config.filter,"showExamples":true,"customClass":config.customClass,"values":config.filter.values}>
    <@headerFilter.header  configHeader />

    <div class="ko-filter-item__content js-accordion__panel <#if config.customClass?has_content>${config.customClass}__image-filter</#if>" data-panel="${config.index}" data-category-code="${config.filter.code}" data-filters-type="${config.filter.type}" >
    <@moreInfos.moreInfo config.filter />
    <#assign nbValuesToDisplay = ((config.filter.getNumberValuesToDisplay())??)?then(config.filter.getNumberValuesToDisplay(),"")>
        <ul class="kl-showmore kl-color-filter js-form-field-list" id="js-showMore-${config.filter.code}" data-nb-filters-to-display="${nbValuesToDisplay}">
    <#list config.filter.values as filter >
    <#assign total = filter.total />
    <#assign mediaUrl = (filter.media.url)!"" >
     <#assign optionFilterImg = {
     "name": "${config.filter.code}",
     "index":filter?index,
     "type": "checkbox",
     "value" : "${filter.value}",
     "checked": filter.applied,
     "label" : "${filter.value} <span class='kl-color-filter__label-quantity' aria-hidden='true'>(${total})</span>",
     "ariaLabel" : "${filter.value?xhtml}",
     "data" : {
     "input" : {
     "category" : "${config.filter.label?xhtml}",
     "type" : "${config.filter.type}"
     }
     },
     "CSSClass" : {
     "label" : "kl-color-filter__label"
     },
     "reversed" : true,
     "img" : "${mediaUrl}"
     }>
        <li class="ko-filter-item__color js-showmore-elem" <@macros.cerberus "ELEM_filtrevisuel" />><@fields.checkboxColor optionFilterImg /></li>
    </#list>
        </ul>
    </div>


</#macro>

