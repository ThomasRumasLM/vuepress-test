<#import "../icons.ftl" as icons>
<#import "base.ftl" as base >
<#import "../common-macro.ftl" as macros>
<#import "../image.ftl" as image>
<#import "../button.ftl" as button>
<#import "../link.ftl" as link>
<#-- Documentation

    Implémentation de base utilisable pour toutes les macros
    ------------------------------------------------------------------
    <#assign myConfig = {
        "name":"",  // required
        "label": "", // required
        "required" : true,
        "suggest" : "",
        "placeholder" : "",
        "disabled" : true,
        "inputmode" : "", // "decimal", "numeric", "tel", "search", "email", "url" // https://developer.mozilla.org/fr/docs/Web/HTML/Attributs_universels/inputmode
        "formInline" : false, // set true if you want a 2 columns form (this automatically add col-container-inner in the wrapper)
        "formInlineBreakpoint" : {m, l, xl xxl}, // use to remove the margin for the field over the breakpoint
        "CSSClass" : {
            "wrapper" : "",
            "label" : "",
            "input" : "",
            "leftColumn" : "", //use if formInline = true
            "rightColumn" : "", //use if formInline = true
            "errorMessage" : "" //use if formInline = true
        },
        "validation" : {
            "pattern" : "",
            "mismatch" : "",
            "missing" : "",
            "min" : "yyyy-mm-dd",
            "max" : "yyyy-mm-dd",
            "maxlength" : number,
            "minlength" : number
        }
    } >

    <#assign tooltipOptions = {
        "jsClass":"js-tooltips1",
        "position":"bottom",
        "theme":"dark",
        "customClass":"m-mon-context",
        "content" : "Ma jolie tooltip"
    }>

    <@element.myMacro myConfig />

    _________________________________________________________________________________________________
    ATTENTION :
    A compléter spécifiquement pour chaque macro ( cf. Voir les exemples au desssus de chaque macro )

    << TODO : Voir si on donne la possibilité d'étendre les options >>
-->


<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "type" : "", // required
        "value" : ""
        "icons": {
            "left" : "",
            "right" : ""
        },
        "validation" : {
            ...,
            "criterions" : {
                "8 caractères minimum" : "pattern",
                "Une majuscule" : "pattern"
            }
        }
    } >
-->
<#macro input config tooltipOptions = {}>
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
        <#if (config.formInline)?? && config.formInline>
            <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
        </#if>
        <@base.label config tooltipOptions />
        <@base.suggest config />
        <#if (config.formInline)?? && config.formInline>
            </div>
            <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
        </#if>
        <@base.input config />
        <#if (config.formInline)?? && config.formInline>
            </div>
        </#if>
    </div>
</#macro>

<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        type: "", // required
        "icons": {
            "left" : "",
            "right" : ""
        },
        "CSSClass" : {
            ...,
            "button" : ""
        },
        "button" : {
            "url" : "",
            "wording" : ""
        }
    } >
-->
<#macro inputWithButton config tooltipOptions = {} >
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
        <#if (config.formInline)?? && config.formInline>
            <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
        </#if>
        <@base.label config tooltipOptions />
        <@base.suggest config />
        <#if (config.formInline)?? && config.formInline>
            </div>
            <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
        </#if>
        <div class="km-field__wrapper km-input km-input--button <#if (config.formInline)?? && config.formInline> km-field__wrapper--inline</#if><#if (config.formInlineBreakpoint)??>@from-${config.formInlineBreakpoint} </#if>">
            <@base.input config "km-input__input" />
            <#if (config.button.url)?? >
                <#assign inputLink = {
                    "displayStyle": "button",
                    "href": config.button.url,
                    "disabled": config.disabled!false,
                    "ariaLabel": "${config.button.wording!} pour valider le champ précedent : ${config.label!}",
                    "cssClass": "km-input__button ${config.CSSClass.button!}"
                }/>
                <@link.linkMozaic configLink = inputLink >${config.button.wording!}</@link.linkMozaic>
            <#else>
                <#assign inputButton = {
                    "displayStyle": "button",
                    "disabled": config.disabled!false,
                    "ariaLabel": "${config.button.wording!} pour valider le champ précedent : ${config.label!}",
                    "cssClass": "km-input__button ${config.CSSClass.button!}"
                }/>
                <@button.buttonMozaic  configButton = inputButton >${config.button.wording!}</@button.buttonMozaic>
            </#if>
        </div>
        <#if (config.formInline)?? && config.formInline>
            </div>
        </#if>
    </div>
</#macro>

<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "values" : [{
            "label" : "inputLabel",
            "value" : "inputValue",
            "checked" : boolean, //non obligatoire
            "data" : { // data attributes
                "input" : {
                    "attribute" : "value"
                },
            }
            "suffix" : { // non obligatoire
              "label" : string, // si suffix est definis il faut au moin le label
               "cssClass" : string, non obligatoire
               "data" : { // non obligatoire mais si il est definis il faut au moin un attribut
                  "attribute" : "value"
               }
            }
        }]
    } >
-->
<#macro checkboxList config tooltipOptions = {}>
    <#if base.control.choiceConfig(config) != "">
        ${base.control.choiceConfig(config)}
    <#else>
        <#assign errorMessages = base.tools.getErrorMessages(false config)>
        <fieldset class="km-field km-field--list <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if>"
        <#if (config.cerberus)??> <@macros.cerberus "${config.cerberus}" /> </#if>>
            <#if (config.formInline)?? && config.formInline>
                <div class="col-container-inner">
                <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
            </#if>
            <@base.label config tooltipOptions "legend" />
            <@base.suggest config />
            <#if (config.formInline)?? && config.formInline>
                </div>
                <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
            </#if>
            <#assign labelId = base.tools.id(config.name base.index) >
            <ul
                ${errorMessages}
                class="km-field__wrapper js-form-field-list
                    <#if (config.formInline)?? && config.formInline> km-field__wrapper--inline</#if>
                    <#if (config.formInlineBreakpoint)??>@from-${config.formInlineBreakpoint} </#if>"
                <#if (config.formInline)?? && config.formInline && (config.CSSClass.errorMessage)??> data-error-wrapper="${config.CSSClass.errorMessage}" </#if>

                <#if (config.validation.min)??>data-min-required="${(config.validation.min)!}"</#if>
                <#if (config.validation.max)??>data-max-required="${(config.validation.max)!}"</#if>
            >
                <#assign thisCounter = 1 >
                <#list config.values as this>
                    <@base.checkbox thisCounter config />
                    <#assign thisCounter = thisCounter + 1  >
                </#list>
            </ul>
            <#if (config.formInline)?? && config.formInline>
                </div>
                </div>
            </#if>
        </fieldset>
    </#if>
</#macro>

<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        "name":"name",
        "label":"label",
        "htmlTag" : "string", //non obigatoire
        "variants": { // non obligatoire, option pour rendre le radio classic en button custom
            "type": string, // pour activer le button custom, indiquez "buttons"
            "size": string, // optionnel, permet d'activer le button custom en taille small, indiquez "small"
            "width": string // class de colonne de grille
        },
        "CSSClass" : //non obligatoire
            {
            "wrapper" : "css wrapper",
            "label": "css label"
            },
        "values" : [{
            "label" : "inputLabel",
            "value" : "inputValue",
            "checked" : boolean, //non obligatoire,
            "image": url de l'image //non obligatoire, permet d'ajouter une image dans la radiolist de type buttons
            "data" : { // data attributes
                "input" : {
                    "attribute" : "value"
                },
            }
            "suffix" : { // non obligatoire
                "label" : string, // si suffix est definis il faut au moin le label
                "cssClass" : string, non obligatoire
                "data" : { // non obligatoire mais si il est definis il faut au moin un attribut
                    "attribute" : "value"
                }
            }
        }]
    } >
-->

<#macro radioList config tooltipOptions = {}>
    <#if base.control.choiceConfig(config) != "">
        ${base.control.choiceConfig(config)}
    <#else>
        <#assign errorMessages = base.tools.getErrorMessages(false config)>
        <fieldset class="km-field km-field--list js-form-field-list<#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if>"
        <#if (config.cerberus)??> <@macros.cerberus "${config.cerberus}" /> </#if>
        >
            <#if (config.formInline)?? && config.formInline>
                <div class="col-container-inner">
                <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
            </#if>
            <@base.label config tooltipOptions "legend" />
            <@base.suggest config />
            <#if (config.formInline)?? && config.formInline>
                </div>
                <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
            </#if>
            <#assign labelId = base.tools.id(config.name base.index) >
             <<#if config.htmlTag??>div<#else>ul</#if> ${errorMessages} class="km-field__wrapper <#if (config.variants)?? && (config.variants.width)?? && (config.variants.type) == "buttons">col-container-inner</#if><#if (config.formInline)?? && config.formInline> km-field__wrapper--inline</#if><#if (config.formInlineBreakpoint)??>@from-${config.formInlineBreakpoint} </#if>" <#if (config.formInline)?? && config.formInline && (config.CSSClass.errorMessage)??> data-error-wrapper="${config.CSSClass.errorMessage}" </#if>>
                <#assign thisCounter = 1 >
                 <#list config.values as inputElt>
                     <@base.radio thisCounter config />
                     <#assign thisCounter = thisCounter + 1  >
                 </#list>
            </<#if config.htmlTag??>div<#else>ul</#if>>
            <#if (config.formInline)?? && config.formInline>
                </div>
                </div>
            </#if>
        </fieldset>
    </#if>
</#macro>

<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "values" : {
            "optionValue" : "optionLabel"
        }
    } >
-->
<#macro select config tooltipOptions = {} >
    <#if base.control.choiceConfig(config) != "">
        ${base.control.choiceConfig(config)}
    <#else>
        <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
            <#if (config.formInline)?? && config.formInline>
                <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
            </#if>
            <@base.label config tooltipOptions />
            <#if (config.formInline)?? && config.formInline>
                </div>
                <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
            </#if>
            <@base.select config />
            <#if (config.formInline)?? && config.formInline>
                </div>
            </#if>
        </div>
    </#if>
</#macro>

<#--
    Select without "optgroup" (basic)
    ---------------------
    <#assign selectData1 = {
        ...,
        "values": [
            {
                "value": "value_1",
                "content": "content_1"
            }, {
                "value": "value_2",
                "content": "content_2",
                "disabled": true
            }, {
                "value": "value_3",
                "content": "content_3",
                "selected": true
            }
        ]
    } >

    Select with "optgroup"
    ---------------------
    <#assign selectData2 = {
        ...,
        "values": [
            {
                "optGroupLabel": "myGroupLabel 1",
                "disabled": true,
                "options": [{
                    "value": "value_1-1",
                    "content": "content_1-1",
                    "disabled": true
                }, {
                    "value": "value_1-2",
                    "content": "content_1-2"
                }]
            }, {
                "optGroupLabel": "myGroupLabel 2",
                "disabled": false,
                "options": [{
                    "value": "value_2-1",
                    "content": "content_2-1",
                    "disabled": true
                }, {
                    "value": "value_2-2",
                    "content": "content_2-2"
                }, {
                    "value": "value_2-3",
                    "content": "content_2-3",
                    "selected": true
                }]
            }
        ]
    } >
-->
<#macro selectNew config tooltipOptions = {} >
    <#if base.control.choiceConfig(config) != "">
        ${base.control.choiceConfig(config)}
    <#else>
        <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
            <#if (config.formInline)?? && config.formInline>
                <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
            </#if>
            <@base.label config tooltipOptions />
            <#if (config.formInline)?? && config.formInline>
                </div>
                <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
            </#if>
            <@base.selectNew config />
            <#if (config.formInline)?? && config.formInline>
                </div>
            </#if>
        </div>
    </#if>
</#macro>

<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "validation" : {
            "minlength" : number,
            "maxlength" : number
        }
    } >
    << TODO >>
-->
<#macro textarea config tooltipOptions = {} >
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
        <#if (config.formInline)?? && config.formInline>
            <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
        </#if>
        <@base.label config tooltipOptions />
        <@base.suggest config />
        <#if (config.formInline)?? && config.formInline>
            </div>
            <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
        </#if>
        <@base.textarea config />
        <#if (config.formInline)?? && config.formInline>
            </div>
        </#if>
    </div>
</#macro>


<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "multiple" : boolean ,
        "validation" : {
            "accept" : "", // image/png, image/jpg, image/jpeg, etc ...
            "size" : "", // en k-octets uniquement
        }
    } >
    << TODO >>
-->
<#macro upload config tooltipOptions = {} >
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if> <#if (config.formInline)?? && config.formInline> col-container-inner </#if>">
        <#if (config.formInline)?? && config.formInline>
            <div <#if (config.CSSClass.leftColumn)??> class="${config.CSSClass.leftColumn}" </#if>>
        </#if>
        <@base.label config tooltipOptions />
        <@base.suggest config />
        <#if (config.formInline)?? && config.formInline>
            </div>
            <div <#if (config.CSSClass.rightColumn)??> class="${config.CSSClass.rightColumn}" </#if>>
        </#if>
        <@base.upload config />
        <#if (config.formInline)?? && config.formInline>
            </div>
        </#if>
    </div>
</#macro>


<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "siteKey": ""
    } >
-->
<#macro captcha config = {} >
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if>">
        <@base.captcha config />
    </div>
</#macro>


<#--
    Complement spécifique
    ---------------------
    <#assign myConfig = {
        ...,
        "reversed": boolean
	} >
-->
<#macro switch config = {} >
    <div class="km-field <#if (config.CSSClass.wrapper)??> ${config.CSSClass.wrapper} </#if>">
        <@base.switch config />
    </div>
</#macro>


<#--  Checkbox Image  -->
<#macro checkboxImage configcheckboxImage>
    <#assign input__id = "${base.tools.id(configcheckboxImage.name base.index)}--${configcheckboxImage.index}" >
    <#assign this = configcheckboxImage />

    <label class="km-visual-filter km-visual-filter--checkbox <#if (this.reversed)??>km-visual-filter--reverse</#if>">
        <#if (this.label)??><span class="km-visual-filter__label km-field__label <#if (this.checked)!false || (this.checkedValue?? && this.value == this.checkedValue)><#if (this.CSSClass.label)??>${this.CSSClass.label} checked </#if> </#if> <#if (this.CSSClass.label)??>${this.CSSClass.label} </#if>">${this.label}</span></#if>
        <input
            <#if (this.checked)!false || (this.checkedValue?? && this.value == this.checkedValue)>checked</#if>
            class="km-visual-filter__input <#if (this.CSSClass.input)??>${this.CSSClass.input} </#if>"
            type="checkbox"
            id="${input__id}"
            <#if this.value != "">value="${this.value}"</#if>
            <#if (this.name)??> name="${this.name}" </#if>
            <#if this.data?? && this.data.input?has_content>
                <#list this.data.input as key , attribute>data-${key}="${attribute}"</#list>
            </#if>
                <#if (this.ariaLabel)??>aria-label="${this.ariaLabel}"</#if>
        >
        <span class="km-visual-filter__element" aria-hidden="true">
            <#assign classImg="km-visual-filter__element-image lazy">
            <#assign srcImg="${this.img}?width=100">
            <#if (this.img)?? && this.img != "">
                <@image.image alt="" class="${classImg}" src="${srcImg}" prmLoad="lazy" />
            <#else>
                <@icons.icon iconPath="Media_NoPicture_48px" class="" />
            </#if>
            <span class="km-visual-filter__check"></span>
        </span>
    </label>
</#macro>
<#--  Checkbox color  -->
<#macro checkboxColor configcheckboxColor>
    <#assign input__id = "${base.tools.id(configcheckboxColor.name base.index)}--${configcheckboxColor.index}" >
    <#assign this = configcheckboxColor />

    <label class="km-color-filter km-color-filter--checkbox <#if (this.reversed)??>km-color-filter--reverse</#if>">
        <#if (this.label)??><span class="km-color-filter__label km-field__label <#if (this.checked)!false || (this.checkedValue?? && this.value == this.checkedValue)><#if (this.CSSClass.label)??>${this.CSSClass.label} checked </#if> </#if> <#if (this.CSSClass.label)??>${this.CSSClass.label} </#if>">${this.label}</span></#if>
        <input
            <#if (this.checked)!false || (this.checkedValue?? && this.value == this.checkedValue)>checked</#if>
            class="km-color-filter__input <#if (this.CSSClass.input)??>${this.CSSClass.input} </#if>"
            type="checkbox"
            id="${input__id}"
            <#if this.value != "">value="${this.value}"</#if>
            <#if (this.name)??> name="${this.name}" </#if>
            <#if this.data?? && this.data.input?has_content>
            <#list this.data.input as key , attribute>data-${key}="${attribute}"</#list>
            </#if>
                <#if (this.ariaLabel)??>aria-label="${this.ariaLabel}"</#if>
        >
        <span class="km-color-filter__element" aria-hidden="true">
            <#assign classImg="km-color-filter__element-image lazy">
            <#assign srcImg="${this.img}?width=100">
            <#if (this.img)?? && this.img != "">
                <@image.image alt="" class="${classImg}" src="${srcImg}" prmLoad="lazy" />
            <#else>
                <@icons.icon iconPath="Media_NoPicture_48px" class="" />
            </#if>
            <span class="km-color-filter__check"></span>
        </span>
    </label>
</#macro>
