<#--
    @param configToaster : object
    * type : String

    exemple  :
    <#import "../../macros/common/toaster.ftl" as toasters>

    <#assign toasterSuccessOpt = {
        "type":"success",
        "title" : {
            "content": "My notificatition title",
            "heading": 3
        },
        "link" : {
            "content" : "my link content",
            "href" : "/tutu"
        },
        "closable": true
        "cssClass" : {
            "container" : "myClass",
            "button" : "myButton"
        }
    }/>
    <@toasters.toaster configToaster = toasterSuccessOpt >
        Success <br>
        TEST
    </@toasters.toaster>
-->

<#--  Macro pour générer le toaster selon le type  -->
<#macro toaster configToaster = {}>
    <#switch configToaster.type>
        <#case "info">
            <#assign type=""/>
            <#break>
        <#case "success">
        <#case "danger">
        <#case "warning">
            <#assign type="mc-notification--${configToaster.type}"/>
            <#break>
        <#default>
            <#assign type=""/>
            <#break>
    </#switch>
    <@compress single_line=true>
        <div class="mc-notification ${type}
        <#if configToaster.closable?? && configToaster.closable == true>mc-notification-closable</#if>
        <#if configToaster.cssClass?? && configToaster.cssClass.container??>${configToaster.cssClass.container}</#if>"
        <#if configToaster.type?? && configToaster.type == "danger">role="alert"</#if>
        >
            <div class="mc-notification__content">
                <#if configToaster.title??>
                    <h${configToaster.title.heading} class="mc-notification__title">${configToaster.title.content}</h${configToaster.title.heading}>
                </#if>
                <p class="mc-notification__message">
                    <#nested>
                </p>
                <#if configToaster.link??>
                    <a class="mc-notification__link mc-link" href="${configToaster.link.href}">${configToaster.link.content}</a>
                </#if>
            </div>
            <#if configToaster.closable?? && configToaster.closable == true>
                <button type="button" class="mc-notification-closable__close 
                <#if configToaster.cssClass?? && configToaster.cssClass.button??>${configToaster.cssClass.button}</#if>" 
                title="Close">
                </button>
            </#if>
        </div>
    </@compress>
</#macro>