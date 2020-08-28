<#import "./tokens/toaster.ftl" as tokenJson>

<#--  Macro pour générer le toaster selon le type  -->
<#macro toaster configToaster = {} dataSup...>
    <#local titleClass = tokenJson.json.class + tokenJson.json.title />
    <#local contentClass = tokenJson.json.class + tokenJson.json.content />
    <#local messageClass = tokenJson.json.class + tokenJson.json.message />
    <#local linkClass = tokenJson.json.class + tokenJson.json.link />
    <#local buttonCloseClass = tokenJson.json.closable + tokenJson.json.close />

    <#local classes = tokenJson.json.class />

    <#switch configToaster.type>
        <#case "info">
            <#local type=""/>
            <#break>
        <#case "success">
        <#case "danger">
        <#case "warning">
            <#local type="${tokenJson.json.class}--${configToaster.type}"/>
            <#break>
        <#default>
            <#local type=""/>
            <#break>
    </#switch>

    <#local classes = classes + " ${type}" />
    <#if configToaster.closable?? && configToaster.closable == true>
        <#local classes = classes + " ${tokenJson.json.closable}" />
    </#if>

    <#local dataAttributes=""/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != 'class'>
                <#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>
    <#if dataSup.class?has_content>
        <#local classes = classes + " ${dataSup.class}"/>
    </#if>

    <@compress single_line=true>
        <div class="${classes!}" <#if configToaster.type?has_content && configToaster.type == "danger">role="alert"</#if> ${dataAttributes!}>
            <div class="${contentClass}">
                <#if configToaster.title?has_content>
                    <h${configToaster.title.heading} class="${titleClass}">${configToaster.title.content}</h${configToaster.title.heading}>
                </#if>
                <p class="${messageClass}">
                    <#nested>
                </p>
                <#if configToaster.link?has_content>
                    <#if configToaster.link.data?has_content>
                        <#local linkDataAttributes = ''>
                        <#if configToaster.link.data?is_hash>
                            <#list configToaster.link.data as key, value>
                                <#if key != 'class'>
                                    <#local linkDataAttributes = linkDataAttributes + " ${key}=\"${value}\""/>
                                </#if>
                            </#list>
                        </#if>
                    </#if>
                    <a class="${linkClass} mc-link" href="${configToaster.link.href!}" ${linkDataAttributes!}>${configToaster.link.content!}</a>
                </#if>
            </div>
            <#if configToaster.closable?has_content && configToaster.closable == true>
                <button type="button" class="${buttonCloseClass}
                <#if configToaster.buttonClass?has_content>${configToaster.buttonClass}</#if>"
                title="Close">
                </button>
            </#if>
        </div>
    </@compress>
</#macro>
