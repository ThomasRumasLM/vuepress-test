<#import "icons.ftl" as icons>

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
    <span class="kl-tooltip__container">
        <button
            class="js-tooltip__button kl-tooltip__button
            <#if (options.iconPosition)?? && options.iconPosition == 'left'> kl-tooltip__button--left </#if>
            <#if (options.customClass)??>${options.customClass}__button</#if>
            " type="button" aria-label="Lire l'info bulle">
            <span class="js-tooltip__pointer is-tooltip-hidden kl-tooltip__pointer <#if (options.position)??> kl-tooltip__pointer--${options.position}<#else>kl-tooltip__pointer--top</#if>"></span>

            <#if options.customClass??>
                <#assign customIconClass = "${options.customClass}__icon">
            </#if>
            <@icons.icon iconPath="Navigation_Notification_Information_24px" class="${customIconClass!}" />
        </button>
        <span class="js-tooltip__wrapper kl-tooltip__wrapper is-tooltip-hidden <#if (options.position)??> kl-tooltip__wrapper--${options.position}<#else>kl-tooltip__wrapper--top</#if>">
            <button class="js-tooltip__close-button kl-tooltip__close" type="button" aria-label="Fermer l'info bulle">
                <@icons.icon iconPath="Navigation_Control_Cross_16px" />
            </button>
            <div class="<#if (options.customClass)??>${options.customClass}__content</#if> kl-tooltip__content">
                <#nested>
            </div>
        </span>
    </span>
</#macro>

<#macro tooltip options = {}>
    <div
        class="kl-tooltip ${options.jsClass}
            <#if (options.onlyOnClick)?? && options.onlyOnClick>is-tooltip-click-only</#if>
            <#if (options.displayOnTextHover)?? && options.displayOnTextHover> is-tooltip-texthover </#if>
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
