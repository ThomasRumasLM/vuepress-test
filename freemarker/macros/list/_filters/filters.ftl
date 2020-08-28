<#import "../../common-macro.ftl" as macros>
<#import "../../icons.ftl" as icons>
<#import "../_languages/fr.ftl" as lngList>
<#import "_includes/range-filter.ftl" as rangeFilter>
<#import "_includes/standard-filter.ftl" as standardFilter>
<#import "_includes/toggle-filter.ftl" as toggleFilter>
<#import "_includes/image-filter.ftl" as imageFilter>
<#import "_includes/color-filter.ftl" as colorFilter>
<#import "../../button.ftl" as button>
<#import "../../link.ftl" as link>

<#--
Permet de créer la liste des filtres
@param options : object
    * values  : object mandatory
    * customClass : String, optional
    * typeElements : String "produit" : mandatory
    * numbersElements : Integer : mandatory

   {
   "values":filters,
   "customClass" : "MyCLass",
   "typeElements" : "produit",
   "numbersElements" : 30,
   }

  PS : the key "values" ​​must have the following structure

    [
        {applied: false
        code: "type-de-produit"
        label: "Type de produit"
        max: null
        maxApplied: null
        min: null
        minApplied: null
        numberValuesToDisplay: 6
        selected: false
        type: "standard"
        values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: false, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"}
        ]},
        {applied: false
        code: "prices"
        label: "Prix"
        max: "900"
        maxApplied: "900"
        min: "2.9"
        minApplied: "2.9"
        numberValuesToDisplay: null
        selected: false
        type: "range"
        values: null}
    ]
-->

<#macro filters configFilter = {} >
    <#assign acceptedFilters = ['standard','toggle','range','image','color']>
    <#assign customClass = (configFilter.customClass??)?then(configFilter.customClass,"")     >
    <#assign labelCerberus = (configFilter.typeElements??)?then(configFilter.typeElements,lngList.translationList.filters.element)     >
    <div class="kl-filters ${customClass}">
      <#if configFilter.values?size gt 0>
          <#assign values = configFilter.values>
          <#assign buttonOpenPopinFilters = {
              "width": "full",
              "icon": {
                "id": "Navigation_Display_Filter_48px"
              }
          }/>
          <@button.button configButton = buttonOpenPopinFilters class="kl-hidden@from-xl js-openPopinFilters" data\-cerberus="BTN_Filtres">${lngList.translationList.filters.refine}</@button.button>

          <#assign headerPopin>
            <#assign buttonClosePopin = {
              "color":"neutral",
              "size": "s",
              "icon": {
                "iconOnly": true,
                "id": "Navigation_Control_Cross_24px"
              }
            }/>
            <#assign buttonResetFilters = {
            "size": "s",
            "cssClass": "km-header-popin-filters__reset kl-hidden kl-hidden@from-l  js-reset-filters"
            }/>
            <div class="km-header-popin-filters <#if customClass?has_content>${customClass}__header-popin</#if> ">
                <@link.link configLink = buttonResetFilters href="#0" class="km-header-popin-filters__reset kl-hidden kl-hidden@from-l js-reset-filters" data\-event="false" >${lngList.translationList.filters.reset}</@link.link>
                <span class="ka-title-bold-xs km-header-popin-filters__title"
                    aria-label="${lngList.translationList.filters.refineResults}" id="js-popin-${macros.popin_id}-title"> ${lngList.translationList.filters.refine}</span>
                <@button.button configButton = buttonClosePopin class="km-header-popin-filters__close js-close-popin"></@button.button>
            </div>
          </#assign>
          <#assign footerPopin>
             <footer class="km-footer-popin-filters  kl-hidden@from-xl <#if customClass?has_content>${customClass}__footer-popin</#if>">
                <#assign classButtonFooter = "">
                <#if configFilter.customClass ??>
                    <#assign buttonFooterFilter = {
                        "width": "full"
                    }/>
                    <#assign classButtonFooter = "${configFilter.customClass!}__btn-footer-popin" />
                <#else>
                    <#assign buttonFooterFilter = {
                       "width": "full"
                    }/>
                </#if>
                <@button.button configButton = buttonFooterFilter data\-cerberus="BTN_voirProduits" type="button" class="l-filter-footer__button js-filter-button js-close-popin ${classButtonFooter!}">
                    <#if configFilter.typeElements ?? && configFilter.numbersElements??>
                        <#if configFilter.numbersElements == 1>
                            ${lngList.translationList.filters.showOneElement?replace("#label","${configFilter.typeElements}")}
                        <#else>
                            ${lngList.translationList.filters.showManyElements?replace("#label","${configFilter.numbersElements} ${configFilter.typeElements}s")}
                        </#if>
                    <#else>
                        ${lngList.translationList.filters.showElements}
                    </#if>
                </@button.button>
             </footer>
          </#assign>
           <#assign configFilterPopin = {"cssClass": { "popin" : "ko-popin-filters js-contentPopinFilters", "inner" : "col-ie-offset-1" }, "title": "${lngList.translationList.filters.refine}", "fullscreen": true,"headerHTML":headerPopin} />
            <@macros.popin options = configFilterPopin>
                <form class="js-form-filters">
                    <ul class="kl-accordion js-accordion" id="js-filters-accordion">
                        <#assign _index = 0>
                         <#list values as filter >
                             <#assign type = filter.type >
                             <#if type != 'toggle'>
                                 <#assign _index++>
                             </#if>
                             <#if type == "hierarchical">
                                <li class="ko-filter-item__title">${lngList.translationList.filters.categories}</li>
                                 <#list filter.values as hierarchical >
                                     <#assign configHierarchicalElt = {
                                     "filter" : hierarchical,
                                     "index" :  _index,
                                     "customClass" : customClass,
                                     "labelCerberus":labelCerberus,
                                     "code" : filter.code
                                     } >

                            <li class="ko-filter-item ko-filter-item--border js-filter-panel "
                                data-filter-type="${type}" <@macros.cerberus "ELEM_Filtres" />>
                                <@standardFilter.standardFilter configHierarchicalElt />
                            </li>
                                 </#list>
                             <li class="ko-filter-item__title">${lngList.translationList.filters.filters}</li>
                             </#if>
                             <#assign configFilterElt = {
                             "filter" : filter,
                             "index" :  _index,
                             "customClass" : customClass,
                             "labelCerberus":labelCerberus
                             } >
                             <#if acceptedFilters?seq_contains(type)>
                             <li class="ko-filter-item ko-filter-item--border js-filter-panel "
                                 data-filter-type="${type}" <@macros.cerberus "ELEM_Filtres" />>
                            <@.vars[type+"Filter"][type+"Filter"] configFilterElt />
                             </li>
                             </#if>
                         </#list>

                    </ul>
                    ${footerPopin}
                </form>

            </@macros.popin>
      <#else>
          <p class="ko-filters__empty">${lngList.translationList.filters.anyFilters}</p>
      </#if>
    </div>
</#macro>
