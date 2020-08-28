<#import "icons.ftl" as icons>
<#import "./tokens/tooltip.ftl" as tooltipJson>

<#--
@param options : object
    * cssClass : object

    exemple  :
    <#import "../../macros/common/tooltip.ftl" as tooltips>

    <#assign tooltipOptions = {
        "jsClass":"js-tooltips - a instancier si bouton au click",
        "text":"Sed maximum est in amicitia parem esse inferiori",
        "position":"bottom",
        "customClass":"m-mon-context",
        "onlyOnClick":"false",
        "iconPosition"; "right",
        "displayOnTextHover": "false"
    }/>

    <@tooltips.tooltip options = tooltipOptions >
        On appelle combles perdus des combles qu'on ne peut ou ne veut pas aménager à cause d’une hauteur libre moyenne insuffisante, ou d’une mauvaise disposition des bois de la charpente.
    </@tooltips.tooltip>
-->

<#macro tooltipContainer options ={}>
    <span class="${tooltipJson.json.class}${tooltipJson.json.container}">
        <button
            class="js-tooltip__button ${tooltipJson.json.class}${tooltipJson.json.button}
            <#if (options.iconPosition)?? && options.iconPosition == 'left'> ${tooltipJson.json.class}${tooltipJson.json.container}--${tooltipJson.json.class}${tooltipJson.json.positions[1]} </#if>
            <#if (options.customClass)??>${options.customClass}__button</#if>
            " type="button" aria-label="Lire l'info bulle">
            <span class="js-tooltip__pointer ${tooltipJson.json.isClass.hidden} ${tooltipJson.json.class}${tooltipJson.json.pointer} <#if (options.position)??> ${tooltipJson.json.class}${tooltipJson.json.pointer}--${options.position}<#else>${tooltipJson.json.class}${tooltipJson.json.pointer}--${tooltipJson.json.positions[2]}</#if>"></span>

            <#if options.customClass??>
                <#assign customIconClass = "${options.customClass}__icon">
            </#if>
            <@icons.icon iconPath="Navigation_Notification_Information_24px" class="${customIconClass!}" />
        </button>
        <span class="js-tooltip__wrapper ${tooltipJson.json.class}${tooltipJson.json.wrapper} ${tooltipJson.json.isClass.hidden} <#if (options.position)??> ${tooltipJson.json.class}${tooltipJson.json.wrapper}--${options.position}<#else>${tooltipJson.json.class}${tooltipJson.json.wrapper}--${tooltipJson.json.positions[2]}</#if>">
            <button class="js-tooltip__close-button ${tooltipJson.json.class}${tooltipJson.json.close}" type="button" aria-label="Fermer l'info bulle">
                <@icons.icon iconPath="Navigation_Control_Cross_16px" />
            </button>
            <div class="<#if (options.customClass)??>${options.customClass}__content</#if> ${tooltipJson.json.class}${tooltipJson.json.content}">
                <#nested>
            </div>
        </span>
    </span>
</#macro>

<#macro tooltip options = {}>
    <div
        class="${tooltipJson.json.class} ${options.jsClass}
            <#if (options.onlyOnClick)?? && options.onlyOnClick>${tooltipJson.json.isClass.click}</#if>
            <#if (options.displayOnTextHover)?? && options.displayOnTextHover> ${tooltipJson.json.isClass.hover}</#if>
        "
    >
        <#if !(options.iconPosition)?? || options.iconPosition == "right">
            ${options.text!}
        </#if>
        <@tooltipContainer options = options >
            <#nested>
        </@tooltipContainer>
        <#if (options.iconPosition)?? && options.iconPosition == "left">
            ${options.text!}
        </#if>
    </div>
</#macro>
