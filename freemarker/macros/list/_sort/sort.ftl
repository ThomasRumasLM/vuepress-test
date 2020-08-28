<#import "../../common-macro.ftl" as macros>
<#import "../../icons.ftl" as icons>
<#--
config {
"label": String mandatory  ex  produits triés par
"total" : String number of elements, mandatory,
"sortList" : Array of object value of sorting ,mandatory  ex [{applied: true,code: "relevance",label: "Pertinence"}]
"cerberus" : String ex "ELEM_NombreProduitsPage"

}

-->
<#macro sorting config>
    <#if config.sortList ?? && config.label ?? && config.total??>
    <div class="km-sorting">
      <#assign total = config.total>
      <#assign sortList = config.sortList>
        <label  for="sorting-select" class="km-sorting__label kl-hidden kl-visible@from-xl" aria-live="polite" aria-atomic="true"><span class="km-sorting__numbers" <#if config.cerberus??><@macros.cerberus "${config.cerberus}" /></#if>>${config.total}</span>
            ${config.label}</label>

        <div class="km-select-wrapper km-sorting__choices">
            <select class="km-select-wrapper__input km-sorting__select js-select-sorting" id="sorting-select" >
            <#list config.sortList as sort >
                <option value="${sort.code}" <#if sort.applied>selected</#if> <@macros.cerberus "ELEM_Tri${(sort.label?replace(' ',''))?cap_first}" /> >${sort.label}</option>
            </#list>
            </select>
             <@icons.icon iconPath="Navigation_Arrow_Arrow--Bottom_24px" class="km-select-wrapper__ico" />
        </div>

    </div>
    </#if>
</#macro>

