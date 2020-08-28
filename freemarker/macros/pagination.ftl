<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#import "./tokens/pagination.ftl" as jsonPagination>
<#import "./tokens/select.ftl" as jsonSelect>

<#macro pagination config = {} dataSup...>
    <#--  css class  -->
    <#local mainClass = "${jsonPagination.json.class}"/>
    <#local supportjsClass = config.jsClass/>
    <#local mainLightModeClass = "${mainClass}${jsonPagination.json.lightMode}"/>
    <#local buttonClass = "${mainClass!}${jsonPagination.json.button}"/>
    <#local iconButtonClass = "${buttonClass!}${jsonPagination.json.icon}"/>
    <#local buttonClassHidden = "${buttonClass!}${jsonPagination.json.hiddenButton}"/>
    <#local selectClass = "${jsonSelect.json.class}"/>
    <#local selectFieldClass = "${mainClass!}${jsonPagination.json.field}"/>
    <#local paginationSelectClass = "${mainClass!}${jsonPagination.json.select}" />
   <#--  config option  -->
    <#local url = config.url/>
    <#local customClassButton = "${config.customClass!}" />
    <#local limit = (config.limit?has_content)?then(config.limit,48)/>
    <#local lightMode = (config.light?? && config.light)?then(true,false) />
    <#local showList = (config.hiddenList?? && config.hiddenList)?then(false,true)/>
    <#local classPreviousButton = (config.currentPage==1)?then("${buttonClassHidden}","")/>
    <#local classNextButton = (config.currentPage==config.maxPage)?then("${buttonClassHidden}","")/>
    <#local prevPage = config.currentPage-1>
    <#local nextPage = config.currentPage+1>

    <#--  Custom data attributes or classes  -->
    <#local dataAttributes=""/>
    <#local customClasses = "${supportjsClass!}"/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != 'class'>
                <#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
            <#if key == 'class'>
                <#local customClasses = customClasses + " ${value}"/>
            </#if>
        </#list>
    </#if>

    <div class="${mainClass}<#if lightMode?? && lightMode == true> ${mainLightModeClass}</#if> ${customClasses!}" ${dataAttributes!}
    <#if config.url?has_content>
        data-url="${config.url}"
    </#if>
    data-current="${config.currentPage}" data-limit="${limit}" data-max-page="${config.maxPage}">
        <a href="<#if config.url?has_content>${config.url}</#if><#if (prevPage?has_content && prevPage > 0) >?page=${prevPage}</#if><#if config.urlParams?has_content><#if prevPage == 0>?<#else>&</#if>${config.urlParams}</#if>"
        class="${buttonClass} ${classPreviousButton!} <#if customClassButton?has_content>${customClassButton!}</#if>
        js-previous" aria-label="Page précédente">
        <@icons.icon iconPath="Navigation_Arrow_Arrow--Left_24px" class="${iconButtonClass}"/></a>
        <#if !lightMode || lightMode?has_content && lightMode == false>
            <div class="${selectFieldClass!}">
                <select class="${selectClass!} ${paginationSelectClass!} js-selector" aria-label="Choisir un numéro de page">
                    <#list 1..config.maxPage as number>
                        <option value="${number}" aria-label="${number} sur ${config.maxPage}"
                        <#if (config.currentPage) == number>
                            selected
                        </#if>
                        >${number} sur ${config.maxPage}
                        </option>
                    </#list>
                </select>
            </div>
        </#if>
        <a href="<#if config.url?has_content>${config.url}</#if><#if config.currentPage != config.maxPage>?page=${nextPage}</#if><#if config.urlParams?has_content>${config.urlParams}</#if>" class="${buttonClass} ${classNextButton} <#if customClassButton?has_content>${customClassButton!}</#if> js-next" aria-label="Page suivante" title="Page suivante">
        <@icons.icon iconPath="Navigation_Arrow_Arrow--Right_24px" class="${iconButtonClass}"/></a>
    </div>
    <#if showList>
        <ul class="kl-hidden">
            <#list 1..config.maxPage as number>
                <li>
                    <a href="<#if config.url?has_content>${config.url}</#if>?page=${number}">${number}</a>
                </li>
            </#list>
        </ul>
    </#if>
</#macro>
