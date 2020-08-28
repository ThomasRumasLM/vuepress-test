<#import "../../../form/fields.ftl" as f>
<#import "../../../common-macro.ftl" as macros>
<#import "more-info.ftl" as moreInfos>
<#--
  show toogle filter
  config {
  "filter" : object , the details of toggle filter,
  "customClass":String
  }
-->

<#macro toggleFilter config >
    <#assign label = config.filter.label>
    <#assign code = config.filter.code>
    <#assign type = config.filter.type>
    <#assign values = config.filter.values>
    <#assign filterDetails = values[0]>
    <#assign total = filterDetails.total />

    <#assign optionToggle = {
    "name": "${code}",
    "type": "checkbox",
    "value" : "${filterDetails.value}",
    "checked": filterDetails.applied,
    "label" : "${label} <span class='km-toggle-filter__label-quantity' aria-hidden='true'>(${total})</span>",
    "ariaLabel" : "${label?xhtml}",
    "data" : {
    "input" : {
    "category" : "${label?xhtml}",
    "type" : "${type}"
    }
    },
    "CSSClass" : {
    "label" : "km-toggle-filter__label"
    }
    }>

    <div class="km-toggle-filter <#if config.customClass?has_content>${config.customClass}__toggle-filter</#if>">
           <div class="km-toggle-filter__container" <@macros.cerberus  "BTN_toggle"/>><@f.switch optionToggle /></div>
    </div>
    <@moreInfos.moreInfo config.filter/>
</#macro>
