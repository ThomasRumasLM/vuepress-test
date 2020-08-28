<#import "../common-macro.ftl" as macros>
<#import "tooling/config.ftl" as default >
<#import "tooling/functions.ftl" as tools >
<#import "tooling/controls.ftl" as control >
<#import "../button.ftl" as button>
<#import "../link.ftl" as link>
<#import "../icons.ftl" as i>
<#import "../tooltip.ftl" as tooltips>
<#import "../tokens/buttons.ftl" as jsonButtons>
<#assign index = 999 >

<#macro label configLabel = {} tooltip = {} htmlTag = "" >
    <#assign index = index - 1 >
    <#assign input__id = tools.id(configLabel.name index) >
    <<#if htmlTag != "">${htmlTag}<#else>label</#if> class="km-field__label <#if tooltip?size gt 0>kl-tooltip</#if> <#if (configLabel.CSSClass.label)??> ${configLabel.CSSClass.label} </#if>" <#if input__id != "" && htmlTag == ""  >for="${input__id}"</#if>>
        <#if (configLabel.label)??>
            ${configLabel.label}
        </#if>
        <#if tooltip?size gt 0>
            <@tooltips.tooltipContainer options = tooltip >
                ${tooltip.content}
            </@tooltips.tooltipContainer>
        </#if>
        <#if tools.isRequired(configLabel)>
            <span class="km-field__mention">- Obligatoire</span>
        </#if>
    </<#if htmlTag != "">${htmlTag}<#else>label</#if>>
</#macro>


<#macro suggest congifSuggest = {} >
    <#if (congifSuggest.suggest)??>
        <span class="km-field__suggest">${congifSuggest.suggest}</span>
    </#if>
</#macro>

<#macro input configInput = {} addClass = "" >
    <#if control.inputConfig(configInput) != "">
        ${control.inputConfig(configInput)}
    <#else>
        <#if control.inputType(configInput)?is_boolean >
            <#assign hasPattern = tools.hasPattern(configInput) />
            <#assign errorMessages = tools.getErrorMessages(hasPattern configInput)>
            <#assign input__id = tools.id(configInput.name index) >
            <#assign mainClassButton = jsonButtons.json.class />
            <#assign index = index - 1 >

            <#if (configInput.icons)?? >
                <div class="km-field__wrapper km-input <#if (configInput.icons.left)?? > km-input--ico-left </#if> <#if (configInput.icons.right)?? > km-input--ico-right </#if>">
            </#if>
           <#if (configInput.counter)??>
                <div class="km-field__wrapper km-field__wrapper--counter <#if (configInput.formInline)?? && configInput.formInline> km-field__wrapper--inline</#if><#if (configInput.formInlineBreakpoint)??>@from-${configInput.formInlineBreakpoint} </#if>">
                    <#assign buttonCounter = {
                            "size" : "l",
                             "style": "bordered"
                        }/>
                   <@button.button configButton = buttonCounter class="km-field__counter-button km-field__counter-button--left" aria\-label="moins" type="button" data\-cerberus="${configInput.cerberusBtnMinus!}" >-</@button.button>
            </#if>
                <input
                    <#if (configInput.datalist)??>list="${configInput.datalist}"</#if>
                    <#if (configInput.disabled)?? && configInput.disabled> disabled </#if>
                    <#if (configInput.type)??>type="${configInput.type}"</#if>
                    <#if input__id != "" > id="${input__id}" </#if>
                    <#if (configInput.name)??> name="${configInput.name}" </#if>
                    <#if (configInput.value)??> value="${configInput.value}"</#if>
                    <#if (configInput.inputmode)??> inputmode="${configInput.inputmode}" </#if>
                    <#if tools.isRequired(configInput)> required </#if>
                    class="ka-input km-field__input js-form-input <#if (configInput.counter)??>ka-input--counter js-input-counter</#if> <#if (configInput.icons)??> km-input__input </#if> <#if (configInput.CSSClass.input)??> ${configInput.CSSClass.input} </#if> <#if (configInput.formInline)?? && configInput.formInline> km-field__input--inline</#if><#if (configInput.formInlineBreakpoint)??>@from-${configInput.formInlineBreakpoint} </#if> <#if addClass != "" > ${addClass} </#if> <#if (configInput.validation.criterions)?? >js-input-criterion</#if>"
                    <#if (configInput.placeholder)??> placeholder="${configInput.placeholder}" </#if>
                    <#if (configInput.label)??> aria-label="${configInput.label}" </#if>
                    <#if (configInput.cerberus)??> <@macros.cerberus "${configInput.cerberus}" /> </#if>
                    <#if (configInput.formInline)?? && configInput.formInline && (configInput.CSSClass.errorMessage)??> data-error-wrapper="${configInput.CSSClass.errorMessage}" </#if>
                    ${errorMessages}
                    <#if hasPattern >
                        ${tools.getPatternAttr(configInput)}
                    </#if>
                    <#if (configInput.counter.step)??>data-step="${configInput.counter.step}"</#if>
                    ${tools.minMaxLengthAttr(configInput)}
                    ${tools.minMaxAttr(configInput)}
                />
            <#if (configInput.counter)??>
                   <@button.button configButton = buttonCounter class="km-field__counter-button km-field__counter-button--right" aria\-label="plus" type="button" data\-cerberus="${configInput.cerberusBtnPlus!}" >+</@button.button>
                </div>
            </#if>

            <#if (configInput.icons)?? >
                    <#if (configInput.icons.right)?? >
                        <@i.icon iconPath="${configInput.icons.right}" class="km-input__ico km-input__ico--right"/>
                    </#if>
                    <#if (configInput.icons.left)?? >
                        <@i.icon iconPath="${configInput.icons.left}" class="km-input__ico km-input__ico--left"/>
                    </#if>
                </div>
            </#if>
            <@criterions configInput />
        <#else>
            ${control.inputType(configInput)}
        </#if>
    </#if>
</#macro>

<#macro checkbox eltCounter configCheckbox = {} >
    <#assign customClass = "" >
    <#assign counter = eltCounter - 1 />
    <#assign this = configCheckbox.values[counter] />
    <#assign input__id = tools.id(configCheckbox.name index) + "--${counter}" >
    <#assign customClass = "" >

    <#if (this.CSSClass)??>
        <#assign customClass = this.CSSClass >
    </#if>
    <#assign ariaChecked = ((this.checked)!false || (configCheckbox.checkedValue?? && this.value == configCheckbox.checkedValue))?then("true","false")>
    <<#if configCheckbox.htmlTag??>${configCheckbox.htmlTag}<#else>li</#if> class="km-checkbox-wrapper km-field__checkbox-wrapper <#if (customClass)?? >${customClass}</#if>">
        <input
        <#if tools.isRequired(configCheckbox)> required </#if> aria-label="${this.label} Choix numéro ${eltCounter} : ${this.label}" type="checkbox" class="km-checkbox-wrapper__input js-form-checkbox"
        <#if (configCheckbox.name)??>name="${configCheckbox.name}"</#if>
        <#if input__id != "">id="${input__id}"</#if>
        <#if this.value != "">value="${this.value}"</#if>
        <#if (this.checked)!false || (configCheckbox.checkedValue?? && this.value == configCheckbox.checkedValue)>checked="checked"</#if>
        aria-checked="${ariaChecked}"
        <#if (configCheckbox.cerberus)??> <@macros.cerberus "${configCheckbox.cerberus}" /> </#if>
        <#if this.data?? && this.data.input?has_content>
            <#list this.data.input as key , attribute>data-${key}="${attribute}"</#list>
        </#if>>
        <@i.icon iconPath="Navigation_Notification_Available_16px" class="km-checkbox-wrapper__ico"/>
        <#if this.value != "">
            <label aria-hidden="true" class="km-checkbox-wrapper__label" <#if input__id != "">for="${input__id}"</#if>>
                ${this.label}
                <#if this.suffix?? && this.suffix.label?has_content>
                   <span class="km-checkbox-wrapper__suffix-label <#if this.suffix.cssClass??>${this.suffix.cssClass}</#if>"
                         <#if this.suffix.data?? && this.suffix.data?has_content>
                             <#list this.suffix.data as key , attribute>
                                 data-${key} = "${attribute}"
                             </#list>
                         </#if>
                   >${this.suffix.label}</span>
                </#if>
            </label>
        </#if>
    </<#if configCheckbox.htmlTag??>${configCheckbox.htmlTag}<#else>li</#if>>
</#macro>

<#macro radio eltCounter configRadio = {} >
    <#assign customClass = "" >
    <#assign counter = eltCounter - 1 />
    <#assign this = configRadio.values[counter] />
    <#assign input__id = tools.id(configRadio.name index) + "--${counter}" >
    <#assign variantsClass = "" >

    <#if (configRadio.variants)?? && (configRadio.variants.type) == "buttons">
        <#assign variantsClass = "km-radio-wrapper__buttons">
        <#if (configRadio.variants)?? && (configRadio.variants.size)??>
            <#assign variantsClass = variantsClass + " km-radio-wrapper__buttons--${configRadio.variants.size}" >
        </#if>
    </#if>

    <#if (this.CSSClass)??>
        <#assign customClass = this.CSSClass >
    </#if>

    <<#if configRadio.htmlTag??>${configRadio.htmlTag}<#else>li</#if> class="km-radio-wrapper km-field__radio-wrapper <#if (configRadio.variants)?? && (configRadio.variants.type) == "buttons"><#if !(this.image)?? >km-radio-wrapper--position-inline<#else>km-radio-wrapper--position-column</#if></#if> <#if (configRadio.variants.width)??>${configRadio.variants.width}</#if> <#if (customClass)?? >${customClass}</#if>">
        <input
        <#if tools.isRequired(configRadio)> required </#if> aria-label="${this.label} Choix numéro ${counter} : ${this.label}" type="radio" class="km-radio-wrapper__input <#if (configRadio.variants)?? && (configRadio.variants.type) == "buttons">km-radio-wrapper__input--hidden</#if>"
        <#if (configRadio.name)??>name="${configRadio.name}"</#if>
        <#if input__id != "">id="${input__id}"</#if>
        <#if this.value != "">value="${this.value}"</#if>
        <#if (this.checked)!false || (configRadio.checkedValue?? && this.value == configRadio.checkedValue)>checked="checked"</#if>
        <#if this.data?? && this.data.input?has_content>
            <#list this.data.input as key , attribute>data-${key}="${attribute}"</#list>
        </#if>>
        <#if this.value != "">
            <label aria-hidden="true" class="km-radio-wrapper__label <#if (configRadio.variants)?? && (configRadio.variants.type == "buttons") && (this.image)?? >km-radio-wrapper__label-image</#if> ${variantsClass}" <#if input__id != "">for="${input__id}"</#if>>
                <#if (configRadio.variants)?? && (configRadio.variants.type == "buttons") && (this.image)?? >
                    <img class="km-radio-wrapper__image" src="${this.image!}" alt="${this.label!}">
                <#else>
                    ${this.label!}
                </#if>
                <#if this.suffix?? && this.suffix.label?has_content>
                   <span class="km-radio-wrapper__suffix-label <#if this.suffix.cssClass??>${this.suffix.cssClass}</#if>"
                         <#if this.suffix.data?? && this.suffix.data?has_content>
                             <#list this.suffix.data as key , attribute>
                                 data-${key} = "${attribute}"
                             </#list>
                         </#if>
                   >${this.suffix.label}</span>
                </#if>
            </label>
            <#if (configRadio.variants)?? && (configRadio.variants.type == "buttons") && (this.image)?? && (this.label)?? >
                <p class="km-radio-wrapper__label-outisde">${this.label}</p>
            </#if>
        </#if>
    </<#if configRadio.htmlTag??>${configRadio.htmlTag}<#else>li</#if>>
</#macro>

<#macro select configSelect = {} >
    <#assign errorMessages = tools.getErrorMessages(false configSelect)>
    <#assign input__id = tools.id(configSelect.name index) >
    <#assign index = index - 1 >
    <div class="km-field__select-wrapper km-select-wrapper js-select-wrapper <#if (configSelect.disabled)?? && configSelect.disabled> is-disabled </#if> <#if (configSelect.formInline)?? && configSelect.formInline> km-field__select-wrapper--inline</#if><#if (configSelect.formInlineBreakpoint)??>@from-${configSelect.formInlineBreakpoint} </#if> ">
        <select
            class="km-select-wrapper__input js-select-wrapper__input <#if (configSelect.CSSClass.input)??> ${configSelect.CSSClass.input} </#if>"
            id="${input__id}"
            <#if tools.isRequired(configSelect)> required </#if>
            ${errorMessages}
            <#if (configSelect.formInline)?? && configSelect.formInline && (configSelect.CSSClass.errorMessage)??> data-error-wrapper="${configSelect.CSSClass.errorMessage}" </#if>
            <#if (configSelect.disabled)?? && configSelect.disabled> disabled </#if>
            <#if (configSelect.name)??>name="${configSelect.name}"</#if>
            <#if (configSelect.cerberus)??> <@macros.cerberus "${configSelect.cerberus}" /> </#if>
        >
            <#list configSelect.values as value, label>
                <option value="${value}"
                <#if (configSelect.selectedKey)?? && configSelect.selectedKey == value>selected</#if>
                >${label}</option>
            </#list>
        </select>
        <@i.icon iconPath="Navigation_Arrow_Arrow--Bottom_24px" class="km-select-wrapper__ico"/>
    </div>
</#macro>

<#macro selectNew configSelect = {} >
    <#assign errorMessages = tools.getErrorMessages(false configSelect)>
    <#assign input__id = tools.id(configSelect.name index) >
    <#assign index = index - 1 >
    <div class="km-field__select-wrapper km-select-wrapper js-select-wrapper <#if (configSelect.disabled)?? && configSelect.disabled> is-disabled </#if> <#if (configSelect.formInline)?? && configSelect.formInline> km-field__select-wrapper--inline</#if><#if (configSelect.formInlineBreakpoint)??>@from-${configSelect.formInlineBreakpoint} </#if> ">
        <select
            class="km-select-wrapper__input js-select-wrapper__input <#if (configSelect.CSSClass.input)??> ${configSelect.CSSClass.input} </#if>"
            id="${input__id}"
            <#if tools.isRequired(configSelect)> required </#if>
            ${errorMessages}
            <#if (configSelect.formInline)?? && configSelect.formInline && (configSelect.CSSClass.errorMessage)??> data-error-wrapper="${configSelect.CSSClass.errorMessage}" </#if>
            <#if (configSelect.disabled)?? && configSelect.disabled> disabled </#if>
            <#if (configSelect.name)??>name="${configSelect.name}"</#if>
            <#if (configSelect.cerberus)??> <@macros.cerberus "${configSelect.cerberus}" /> </#if>
        >
            <#if configSelect.values?is_sequence>
                <#list configSelect.values as data>
                    <#if data?is_hash_ex>
                        <#if (data.options)?? && data.options?is_sequence>
                            <optgroup label="${data.optGroupLabel!}"
                            <#if (data.disabled)?? && data.disabled> disabled </#if>
                            >
                                <#list data.options as option>
                                    <#if option?is_hash_ex>
                                        <@selectOption option />
                                    </#if>
                                </#list>
                            </optgroup>
                        <#else>
                            <@selectOption data />
                        </#if>
                    </#if>
                </#list>
            </#if>
        </select>
        <@i.icon iconPath="Navigation_Arrow_Arrow--Bottom_24px" class="km-select-wrapper__ico"/>
    </div>
</#macro>

<#macro selectOption configOption = {} >
    <option value="${configOption.value}"
    <#if (configOption.selected)?? > selected </#if>
    <#if (configOption.disabled)?? > disabled </#if>
    >${configOption.content}</option>
</#macro>

<#macro textarea configTextarea = {} >
    <#assign hasPattern = tools.hasPattern(configTextarea "textarea") />
    <#assign errorMessages = tools.getErrorMessages(hasPattern configTextarea)>
    <#assign input__id = tools.id(configTextarea.name index) >
    <#assign index = index - 1 >
        <textarea
                <#if (configTextarea.disabled)?? && configTextarea.disabled> disabled </#if>
                <#if (configTextarea.name)??> name="${configTextarea.name}" </#if>
                id="${input__id}"
                class="km-field__input ka-textarea <#if (configTextarea.CSSClass.input)??> ${configTextarea.CSSClass.input} </#if>"
                placeholder="<#if (configTextarea.placeholder)?? >${configTextarea.placeholder}<#else>Votre message ici ...</#if>"
                <#if (configTextarea.label)??> aria-label="${configTextarea.label}" </#if>
                <#if tools.isRequired(configTextarea)> required </#if>
                <#if (configTextarea.cerberus)??> <@macros.cerberus "${configTextarea.cerberus}" /> </#if>
                <#if (configTextarea.formInline)?? && configTextarea.formInline && (configTextarea.CSSClass.errorMessage)??> data-error-wrapper="${configTextarea.CSSClass.errorMessage}" </#if>
                <#if hasPattern >
                   ${tools.getPatternAttr(configTextarea "textarea")}
                </#if>

                ${tools.minMaxLengthAttr(configTextarea)}
                ${errorMessages}></textarea>
</#macro>

<#macro upload configUpload = {} >
    <#assign input__id = tools.id(configUpload.name index) >
    <#assign hasPattern = tools.hasPattern(configUpload "textarea") />
    <#assign errorMessages = tools.getErrorMessages(hasPattern configUpload)>
    <div class="km-field__wrapper km-input km-input--upload js-input-wrapper__upload-area <#if (configUpload.disabled)?? && configUpload.disabled> is-disabled </#if> <#if (configUpload.formInline)?? && configUpload.formInline> km-field__wrapper--inline</#if><#if (configUpload.formInlineBreakpoint)??>@from-${configUpload.formInlineBreakpoint} </#if> ">
        <@i.icon iconPath="Navigation_Publish_Trashbin_24px" symbolOnly=true />
        <input
            <#if (configUpload.disabled)?? && configUpload.disabled> disabled </#if>
            <#if (configUpload.multiple)??> multiple </#if>
            aria-label="${configUpload.label} Cliquez pour choisir un <#if (configUpload.multiple)??>ou plusieurs</#if> fichier<#if (configUpload.multiple)??>s</#if> sur votre appareil"
            <#if (configUpload.validation.size)??>data-size="${configUpload.validation.size?c}"</#if>
            type="file"
            id="${input__id}"
            class="km-input__upload js-input-upload <#if (configUpload.CSSClass.input)??> ${configUpload.CSSClass.input} </#if>"
            <#if (configUpload.name)??> name="${configUpload.name}" </#if>
            <#if (configUpload.validation)?? && (configUpload.validation.accept)?? >accept="${configUpload.validation.accept}" </#if>
            <#if tools.isRequired(configUpload)> required </#if>
            <#if (configUpload.cerberus)??> <@macros.cerberus "${configUpload.cerberus}" /> </#if>
            <#if (configUpload.formInline)?? && configUpload.formInline && (configUpload.CSSClass.errorMessage)??> data-error-wrapper="${configUpload.CSSClass.errorMessage}" </#if>
            ${errorMessages!}
        >
        <input type="hidden" id="${input__id}__allowed_files" <#if (configUpload.name)??> name="${configUpload.name}__allowed_files" </#if>>
        <span class="km-input__instructions" aria-hidden="true">
            <@i.icon iconPath="Navigation_Control_Circle--More_32px" class="km-input__instructions__ico"/>
            Drag & drop ou cliquez pour choisir un <#if (configUpload.multiple)??>ou plusieurs</#if> fichier<#if (configUpload.multiple)??>s</#if>
        </span>
    </div>
</#macro>

<#macro criterions config = {} >
    <#if (config.validation.criterions)?? >
        <ul class="km-field__criteria-list">
            <#list config.validation.criterions as criterions, pattern>
                <li class="km-field__criteria-list__item" data-pattern="${pattern}"><span class="ka-bullet km-field__criteria-list__bullet" aria-label="Critère à valider : ${criterions}"></span> ${criterions}</li>
            </#list>
        </ul>
    </#if>
</#macro>

<#macro captcha configCaptcha = {}>
    <div class="g-recaptcha js-g-recaptcha" data-sitekey="<#if (configCaptcha.siteKey)??>${configCaptcha.siteKey}<#else>${default.defaultCaptchaKey}</#if>" <#if (configCaptcha.cerberus)??> <@macros.cerberus "${configCaptcha.cerberus}" /> </#if>></div>
</#macro>

<#macro switch configSwitch>
    <#if (configSwitch.type)?? && (configSwitch.type) == 'checkbox'>
        <#assign input__id = tools.id(configSwitch.name index) >
        <#assign index = index - 1 >
        <#assign this = configSwitch />

        <label class="km-switch km-switch--checkbox <#if (this.reversed)??>km-switch--reverse</#if>">
            <#if (this.label)??><span class="km-switch__label km-field__label <#if (this.CSSClass.label)??>${this.CSSClass.label} </#if>">${this.label}</span></#if>
            <input
                <#if (this.checked)!false || (configSwitch.checkedValue?? && this.value == configSwitch.checkedValue)>checked</#if>
                class="km-switch__input <#if (this.CSSClass.input)??>${this.CSSClass.input} </#if>"
                type="checkbox"
                id="${input__id}"
                <#if this.value != "">value="${this.value}"</#if>
                <#if (this.name)??> name="${this.name}" </#if>
                <#if this.data?? && this.data.input?has_content>
                    <#list this.data.input as key , attribute>data-${key}="${attribute}"</#list>
                </#if>
                 <#if (this.ariaLabel)??>aria-label="${this.ariaLabel}"</#if>
            >
            <span class="km-switch__element" aria-hidden="true"></span>
        </label>
    </#if>
</#macro>
