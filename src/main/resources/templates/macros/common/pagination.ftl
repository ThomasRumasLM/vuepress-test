<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>

<#macro pagination config>

    <#assign limit = (config.limit??)?then(config.limit,48)>
    <#assign lightMode = (config.light?? && config.light)?then(true,false)>
    <#assign showList = (config.hiddenList?? && config.hiddenList)?then(false,true)>
    <#assign classPreviousButton = (config.currentPage==1)?then("km-pagination__button--disabled","")>
    <#assign classNextButton = (config.currentPage==config.maxPage)?then("km-pagination__button--disabled","")>
    <#assign prevPage = config.currentPage-1>
    <#assign nextPage = config.currentPage+1>
    <div class="km-pagination ${config.jsClass}" <#if config.url?? && config.url !="">data-url="${config.url}"</#if> data-current="${config.currentPage}" data-limit="${limit}" data-max-page="${config.maxPage}">
        <a href="<#if config.url?? && config.url !="">${config.url}</#if><#if (prevPage?? && prevPage > 0) >?page=${prevPage}</#if><#if config.urlParams??><#if prevPage == 0>?<#else>&</#if>${config.urlParams}</#if>" class="km-pagination__button ${classPreviousButton} <#if config.customClass?? && config.customClass !="">${config.customClass}</#if> js-previous" aria-label="Page précédente"><@icons.icon iconPath="Navigation_Arrow_Arrow--Left_24px" class="km-pagination__svg"/></a>
        <#if !lightMode>
            <div class="km-select-wrapper km-pagination__choices">
                <select class="km-select-wrapper__input km-pagination__select js-selector" aria-label="Choisir un numéro de page">
                    <#list 1..config.maxPage as number>
                        <option value="${number}" aria-label="${number} sur ${config.maxPage}" <#if (config.currentPage) == number>selected</#if>>${number} sur ${config.maxPage}</option>
                    </#list>
                </select>
                <@icons.icon iconPath="Navigation_Arrow_Arrow--Bottom_16px" class="km-select-wrapper__ico"/>
            </div>
        </#if>
        <a href="<#if config.url?? && config.url !="">${config.url}</#if><#if config.currentPage != config.maxPage>?page=${nextPage}</#if><#if config.urlParams??>&${config.urlParams}</#if>" class="km-pagination__button ${classNextButton} <#if config.customClass?? && config.customClass !="">${config.customClass}</#if> js-next" aria-label="Page suivante" title="Page suivante"><@icons.icon iconPath="Navigation_Arrow_Arrow--Right_24px" class="km-pagination__svg"/></a>
    </div>
    <#if showList>
        <ul class="kl-hidden">
            <#list 1..config.maxPage as number>
                <li>
                    <a href="<#if config.url?? && config.url !="">${config.url}</#if>?page=${number}">${number}</a>
                </li>
            </#list>
        </ul>
    </#if>
</#macro>

