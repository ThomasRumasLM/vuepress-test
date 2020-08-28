<#import "../../../common-macro.ftl" as macros>
<#import "../../../icons.ftl" as icons>
<#--
 Private function get sub label for a filter
 for examples of "Marque : Bosh/Makita/Black&decker"


 -->
<#function getExamplesLabel values type >
    <#assign acceptedFilters = ['standard','image','color']>
    <#if acceptedFilters?seq_contains(type)>
        <#assign isApplied = false >
        <#if values?? >
            <#assign filtersApplied = [] />
        <#-- if filters have values applied -->
            <#list values as filterValue>
                <#if filterValue.applied?? && filterValue.applied == true>
                    <#assign filtersApplied = filtersApplied + [(filterValue.label??)?then(filterValue.label,filterValue.value)] />
                </#if>
            </#list>

            <#if filtersApplied?size gt 0 >
                <#assign isApplied = true >
                <#assign label>
                    <#list filtersApplied as applied>
                        ${applied}<#sep> /
                    </#list>
                </#assign>

            <#else>
            <#-- if filters don'thave values applied we show 10 first value of filters -->
                <#assign limit = (values?size < 10)?then(values?size-1,9)>

                <#assign threeFirstFilters = values[0..limit] />

                <#assign label >
                    <#list threeFirstFilters as filterLabel>
                        ${(filterLabel.label??)?then(filterLabel.label,filterLabel.value)}<#sep> /
                    </#list>
                </#assign>
            </#if>
        </#if>

    <#elseif type == "range" >
        <#assign isApplied = ((values.minApplied?string != values.min?string) || (values.maxApplied?string != values.max?string))?then(true,false)>
        <#assign label = "${values.minApplied} ${values.currency} - ${values.maxApplied} ${values.currency} ">
    </#if>
    <#return {"label":label,"isApplied" :isApplied} >
</#function>

<#--
 show the header for type of filters have a collpasse
    config {
    "filter" : object of filter,
    "values": array of object
    "customClass" : "String"
    "showExamples" :  boolean for show or not the examples of filters
    }

   {"filter": {applied: false
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
       }
  },
  "values":list of values of filters
  "customClass":"myCustomClass",
  "showExamples": true

-->
<#macro header config >

 <div class="ko-filter-item__header js-accordion__header <#if config.customClass?has_content>${config.customClass}__item-header</#if> <#if (config.filter.description)??> has-more-info </#if> " >
     <button type="button" class="ko-filter-item__header-link  ">
         <span class="ko-filter-item__name">${config.filter.label}</span>
         <span class="js-accordion__icon-container" <@macros.cerberus "BTN_deplierfiltre"/>>
             <@icons.icon iconPath="Navigation_Control_More_24px" class="ko-filter-item__icon js-accordion__icon js-accordion__icon-more"/>
             <@icons.icon iconPath="Navigation_Control_Less_24px" class="ko-filter-item__icon js-accordion__icon js-accordion__icon-less kl-hidden"/>
         </span>
         <#if config.showExamples?? && config.showExamples && config.values?? >
             <#assign examples = getExamplesLabel(config.values config.filter.type) >
        <span class="ko-filter-item__examples <#if examples ?? && examples.isApplied == true >is-selected</#if>">
            ${examples.label}</span>
         </#if>
     </button>
 </div>

</#macro>
