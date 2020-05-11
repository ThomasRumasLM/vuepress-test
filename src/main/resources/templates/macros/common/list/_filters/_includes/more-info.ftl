<#import "../../../tooltip.ftl" as tooltips>
<#--
  show tooltip filter
  filter
 {applied: false
        code: "prices"
        label: "Prix"
        description:"example of description"
        max: "900"
        maxApplied: "900"
        min: "2.9"
        minApplied: "2.9"
        numberValuesToDisplay: null
        selected: false
        type: "range"
        values: null}
  }
-->
<#macro moreInfo filter>
    <#if filter.code?? && filter.description??>
        <#assign tooltipOptions = {
        "jsClass":"js-tooltip-${filter.code}",
        "text":"En savoir plus",
        "position":"right",
        "onlyOnClick":true,
        "customClass":"ko-filter-item-learn-more",
        "iconPosition":"left"
        }/>
    <div class="ko-filter-item-learn-more">
        <@tooltips.tooltip options = tooltipOptions >
            ${filter.description}
        </@tooltips.tooltip>
    </div>
    </#if>

</#macro>
