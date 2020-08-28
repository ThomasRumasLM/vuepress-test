<#import "../../common-macro.ftl" as macros>
<#import "../_languages/fr.ftl" as lngList>
<#import "../../icons.ftl" as icons>
<#import "../../link.ftl" as link>

<#--
Show one selected filter
 config {
 "value" : string value of filter
 "type" : string type of filter,
 "label": string label of pills }
-->
<#macro displayElement config>

   <li class="km-selected-filters__elements">
       <button class="ka-tag ka-tag--icon-right ka-tag--icon-right-medium js-delete-filter"
               data-category="${config.category}"
               data-filter-value="${config.value}"
               data-filter-type="${config.type}" data-filter-code="${config.code}" <@macros.cerberus "ELEM_gellule"/> >${config.label}
                        <@icons.icon iconPath="Navigation_Control_Tag--Cross_24px" class="ka-tag__icon-right"/>
       </button>

   </li>
</#macro>

<#--
    Show selected Filters
    values : Array of object of selected filters

    example of data
    [
        {applied: true
        code: "type-de-produit"
        label: "Type de produit"
        max: null
        maxApplied: null
        min: null
        minApplied: null
        numberValuesToDisplay: 6
        selected: false
        type: "standard"
        values: [{type: "standard", value: "Abrasif Delta", total: 2, applied: true, code: "Abrasif_Delta"},{type: "standard", value: "Bande de ponçage", total: 1, applied: false, code: "Bande_de_poncage"}
        ]},
        {applied: true
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

<#macro selectedFilter values >
    <#if values?size gt 0>
        <div class="km-selected-filters kl-hidden kl-visible@from-xl">
            <p class="km-selected-filters__title">${lngList.translationList.filters.yourFilters} :</p>
            <ul>
                <#list values as selectedFilter>
                    <#if selectedFilter.type == 'hierarchical'>
                        <#assign parentCode = selectedFilter.code >
                        <#assign parentLabel = selectedFilter.label >
                        <#list selectedFilter.values as filter>
                            <#list filter.values as hierarchicalFilter>
                                <#if hierarchicalFilter.applied>
                                    <#assign label =  hierarchicalFilter.label >
                                    <#assign configFilter = {
                                    "value": hierarchicalFilter.value,
                                    "label": label,
                                    "type": selectedFilter.type,
                                    "code": parentCode,
                                    "category": parentLabel
                                    }>
                                    <@displayElement configFilter></@displayElement>
                                </#if>

                            </#list>
                        </#list>
                    </#if>
                    <#if selectedFilter.type == 'standard' || selectedFilter.type == 'toggle' || selectedFilter.type == 'image' || selectedFilter.type == 'color'>
                        <#assign filters = selectedFilter.values >
                        <#list filters as filter>
                            <#if filter.applied>
                                <#assign label = (selectedFilter.type == "toggle" )?then(selectedFilter.label,(filter.label??)?then(filter.label,filter.value)) >
                                <#assign configFilter = {
                                "value": filter.value,
                                "label": label,
                                "type": selectedFilter.type,
                                "code": selectedFilter.code,
                                "category": selectedFilter.label
                                }>
                                <@displayElement configFilter></@displayElement>
                            </#if>
                        </#list>
                    </#if>
                    <#if selectedFilter.type == 'range'>
                        <#assign unit =  (selectedFilter.unit??)?then(selectedFilter.unit,"€") />
                        <#assign configToggle = {
                        "value": "${selectedFilter.minApplied}~${selectedFilter.maxApplied}",
                        "label": "${selectedFilter.minApplied} ${unit} - ${selectedFilter.maxApplied} ${unit}",
                        "type": selectedFilter.type,
                        "code": selectedFilter.code,
                        "category": selectedFilter.label
                        }>
                        <@displayElement configToggle></@displayElement>
                    </#if>

                </#list>
                <#assign buttonResetSelectedFilters = {
                    "size": "s"
                }/>
                <li class="km-selected-filters__reset">
                    <@link.link configLink = buttonResetSelectedFilters class="js-reset-selected-filters" href="#0" data\-cerberus="BTN_reinitialiser">${lngList.translationList.filters.reset}</@link.link>
                </li>
            </ul>
        </div>

    </#if>

</#macro>
