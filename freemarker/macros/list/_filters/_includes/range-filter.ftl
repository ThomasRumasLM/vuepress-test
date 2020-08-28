<#import "../../../common-macro.ftl" as macros>
<#import "header-filter.ftl" as headerFilter>
<#import "../../_languages/fr.ftl" as lngList>
<#import "more-info.ftl" as moreInfos>
<#import "../../../button.ftl" as button>
<#import "../../../link.ftl" as link>
<#--
  show range filter
  config {
  "filter" : object , the details of range filter,
  "customClass" : customClass,
  }
-->

<#macro rangeFilter config >
    <#assign type = config.filter.type>
    <#assign label = config.filter.label>
    <#assign code = config.filter.code>
    <#assign currency =  (config.filter.currency??)?then(config.filter.currency,"€") />
    <#assign examplesValues = {"currency" : currency,"minApplied":config.filter.minApplied,"maxApplied" : config.filter.maxApplied,"min" : config.filter.min,"max":config.filter.max}>
    <#assign configHeader = {"filter":config.filter,"showExamples":true,"customClass":config.customClass,"values":examplesValues}>
    <@headerFilter.header  configHeader />

      <div class=" js-accordion__panel <#if config.customClass?has_content>${config.customClass}__range-filter</#if>" data-panel="${config.index}" data-category-code="${config.filter.code}" data-filters-type="${config.filter.type}">
          <@moreInfos.moreInfo config.filter />
          <div class="km-range-filter">
              <div class="km-range-filter__element">
                  <input type="number" step="any" inputmode="numeric"  class="ka-input km-range-filter__input  js-rangeMin" min="${config.filter.min}" data-min-applied="${config.filter.minApplied}" data-category="${code}" data-value-changed="<#if config.filter.min != config.filter.minApplied>true<#else>false</#if>" value="${config.filter.minApplied}" aria-label="valeur minimum" <@macros.cerberus "INPUT_minrange"/>><span aria-hidden="true"  class="km-range-filter__unit">${currency}</span>
              </div>
              <span class="km-range-filter__separator">-</span>
              <div class="km-range-filter__element">
                  <input type="number" step="any" inputmode="numeric" class="ka-input km-range-filter__input js-rangeMax" max="${config.filter.max}" data-max-applied="${config.filter.maxApplied}" data-category="${code}" data-value-changed="<#if config.filter.max != config.filter.maxApplied>true<#else>false</#if>" value="${config.filter.maxApplied}" aria-label="valeur maximum" <@macros.cerberus "INPUT_maxrange"/> ><span aria-hidden="true"  class="km-range-filter__unit" >${currency}</span>
              </div>
              <#assign buttonRangeReset = {
                "size": "s"
                }/>
              <@link.link configLink = buttonRangeReset href="#0" class="km-range-filter__reset js-rangeReset" data\-type="${type}" data\-category="${code}" data\-cerberus="INPUT_reinitialiser">${lngList.translationList.filters.reset}</@link.link>


                <@button.button configButton = {} type="button" class="km-range-filter__button is-disabled js-rangeApply" disabled="true" data\-type="${type}" data\-category="${code}" data\-cerberus="INPUT_appliquer">${lngList.translationList.filters.apply}</@button.button>
            </div>
      </div>

</#macro>
