<#import "../../macros/common/icons.ftl" as icons>
<#import "../../macros/common/button.ftl" as button>
<#import "./tokens/layer.ftl" as jsonLayer>

<#--
Allows to inject a layer in the DOM
@param options : object
    * content: String                   (required)
    * title : String                    (optionnal)
    * icon : String                     (optionnal)
    * cssClass : Object                 (optionnal)
    * footer : Object                   (optionnal)

    Example :
    <#assign layerOptions = {
        "content": "js-layer-anme"
        "title": "My title",
        "icon": "id-icon",
        "cssClass": {
            "layer": "", //optional
            "header": "", //optional
            "body": "", //optional
            "footer": "" //optional
        },
        "footer": {
            "firstButton": { //optional
                "label": "Button label",
                "class": "my-custom-class", //optional
                "config": {}  // Use same config as macros/common/button.ftl
                "dataAttributes":  //optional
                {
                    "data-XXXXX": "data-value", // (e.g. data-cerberus)
                    "other-attribute": "value" // (e.g. aria-label)
                }
            },
            "secondButton": { //optional
                "label": "Button label 2",
                "class": "my-custom-class", //optional
                "config": {} // Use same config as macros/common/button.ftl
                "dataAttributes":  //optional
                {
                    "data-XXXXX": "data-value", // (e.g. data-cerberus)
                    "other-attribute": "value" // (e.g. aria-label)
                }
            }
        }
    }/>

    Usage :
    <@layer options=layerOptions>
        HTML Content
    </@layer>
-->

<#macro layer options = {}>
    <#local classLayer = "" />
    <#local classHeader = "" />
    <#local classBody = "" />
    <#local classFooter = "" />
    <#if options.cssClass?has_content>
        <#if options.cssClass.layer?has_content>
            <#local classLayer = options.cssClass.layer />
        </#if>
        <#if options.cssClass.header?has_content>
            <#local classHeader = options.cssClass.header />
        </#if>
        <#if options.cssClass.body?has_content>
            <#local classBody = options.cssClass.body />
        </#if>
        <#if options.cssClass.footer?has_content>
            <#local classFooter = options.cssClass.footer />
        </#if>
    </#if>

    <section class="${jsonLayer.json.class} ${jsonLayer.json.isClass.hidden} ${classLayer!} ${options.content!}">
        <header class="${jsonLayer.json.class}${jsonLayer.json.header} ${classHeader!}">
            <#if options.icon?has_content>
                <#local layerIconClass = "${jsonLayer.json.class}${jsonLayer.json.icon}">
                <div class="${jsonLayer.json.class}${jsonLayer.json.titleIcon}"><@icons.icon iconPath="${options.icon!}" class=layerIconClass /></div>
            </#if>

            <#if options.title?has_content>
                <div class="${jsonLayer.json.class}${jsonLayer.json.title}">${options.title!}</div>
            </#if>

            <button class="${jsonLayer.json.class}${jsonLayer.json.closeButton} js-close-layer" type="button" aria-label="Fermer">
                <#local layerCloseIconClass = "${jsonLayer.json.class}${jsonLayer.json.closeIcon}">
                <@icons.icon iconPath="Navigation_Control_Cross_32px" class=layerCloseIconClass />
            </button>
        </header>

        <div class="${jsonLayer.json.class}${jsonLayer.json.body} js-layer-body ${classBody!}">
            <div class="${jsonLayer.json.class}${jsonLayer.json.layout} js-layer-body-layout">
                <#nested>
            </div>
        </div>
        <#if options.footer?has_content>
            <footer class="${jsonLayer.json.class}${jsonLayer.json.footer} ${classFooter!}">
                <#local layerFirstButtonClass = "${options.footer.firstButton.class!}">
                <@button.button configButton=options.footer.firstButton.config! class=layerFirstButtonClass dataInherit=options.footer.firstButton.dataAttributes>${options.footer.firstButton.label!}</@button.button>

                <#if options.footer.secondButton?has_content>
                    <#local layerSecondButtonClass = "${jsonLayer.json.class}${jsonLayer.json.secondButton} ${options.footer.secondButton.class!}">
                    <@button.button configButton=options.footer.secondButton.config! class=layerSecondButtonClass dataInherit=options.footer.secondButton.dataAttributes>${options.footer.secondButton.label!}</@button.button>
                </#if>
            </footer>
        </#if>
    </section>
</#macro>
