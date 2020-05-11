<#import "icons.ftl" as i>

<#--
Permet d'injecter soit le contenu du svg directement sinon on construit une balise img
@param visuel : {"extension": string, "href": string, "content" : string}
-->
<#macro svgOuImg visuel profilImage="" alt="" class="">
    <#if profilImage != "">
        <#assign srcResult = visuel.href + "?" + profilImage />
    <#else>
        <#assign srcResult = visuel.href />
    </#if>

    <#if visuel??>
        <#if visuel.extension??>
            <#if visuel.extension != "svg">
                <img src="${srcResult!}" alt="${alt!}" title="${alt!}" class="${class!}">
            <#else>
                <#if visuel.content??>
                    ${visuel.content}
                </#if>
            </#if>
        <#else>
            <img src="${srcResult!}" alt="${alt!}" title="${alt!}" class="${class!}">
        </#if>
    </#if>
</#macro>

<#--
Permet d'injecter l'attribut cerberus dans les balises
@param attributeValue: string
-->
<#macro cerberus attributeValue = "">
    <#assign dataCerberus = true>
    <#if dataCerberus && attributeValue != "">
        data-cerberus="${attributeValue!}"
    </#if>
</#macro>


<#--
Permet d'injecter une popin dans le DOM
@param options : object
    * title : String                    (required)
    * subTitle : String                 (optionnal)
    * headerHTML : String // Override title/subtile
    * footerHTML : String
    * cssClass : Object                 (optionnal)
    * desktopSize : String (s, m, l)    (default m)
    * fullscreen : Boolean              (default false)
    * blocked : Boolean                 (default false)
    * role : String                     (optionnal)
-->
<#assign popin_id = 999>
<#macro popin  options = {}>

    <#if options.desktopSize! == "s">
        <#assign colClass = "col-12 col-l-6 col-start-l-4 col-xl-4 col-start-xl-5 col-xxl-4 col-start-xxl-5">
    <#elseif options.desktopSize! == "l">
        <#assign colClass = "col-12 col-l-10 col-start-l-2 col-xl-8 col-start-xl-3 col-xxl-8 col-start-xxl-3">
    <#else>
        <#assign colClass = "col-12 col-l-10 col-start-l-2 col-xl-6 col-start-xl-4 col-xxl-6 col-start-xxl-4">
    </#if>

    <#if options.mobileFullscreen??> <#assign fullscreen = options.mobileFullscreen> </#if>
    <#if options.fullscreen??> <#assign fullscreen = options.fullscreen> </#if>

    <article class="kl-popin kl-hidden ${options.cssClass.popin!} <#if fullscreen??>kl-popin--fullscreen</#if> js-popin" data-name="js-popin-${popin_id}" tabindex="-1" <#if options.role??>role="${options.role}"</#if> aria-labelledby="js-popin-${popin_id}-title">

        <div class="kl-popin__inner ${colClass!} ${options.cssClass.inner!} js-popin-inner">
            <header class="kl-popin__header js-popin-header ${options.cssClass.header!}">

                <#if options.headerHTML! != "">
                    ${options.headerHTML!}
                <#else>
                    <#if !options.blocked!false >
                        <button class="kl-popin__close js-close-popin" aria-label="Fermer">
                            <@i.icon iconPath="Navigation_Control_Cross_24px" />
                        </button>
                    </#if>

                    <h1 class="kl-popin__title ka-title-bold-l" id="js-popin-${popin_id}-title">
                        ${options.title}
                    </h1>
                    <#if options.subTitle! != "">
                        <h2 class="kl-popin__subtitle">
                            ${options.subTitle}
                        </h2>
                    </#if>
            </#if>

            </header>
            <div class="kl-popin__body js-popin-body ${options.cssClass.content!}">
                <#nested>
            </div>

            <#if options.footerHTML! != "">
            <footer class="kl-popin__footer js-popin-footer ${options.cssClass.footer!}">
                ${options.footerHTML!}
            </footer>
            </#if>
        </div>
    </article>

    <#assign popin_id = popin_id - 1>
</#macro>

<#--
Supprime tout les caractères spéciaux
@param str : Chaine de caractère
@param opt : option
-->

<#assign defaultOpt = {
    "spaces": false,
    "punctuation": false,
    "accents": false,
    "lowercase": true
}>
<#function normalize str options = defaultOpt>

    <#-- ASSIGN VARS -->
    <#assign formatedStr = str>
    <#assign
        spaces = defaultOpt.spaces
        punctuation = defaultOpt.punctuation
        accents = defaultOpt.accents
        lowercase = defaultOpt.lowercase
    >

    <#list options as key, value>
        <#if key = "spaces"> <#assign spaces = options.spaces > </#if>
        <#if key = "punctuation"> <#assign punctuation = options.punctuation > </#if>
        <#if key = "accents"> <#assign accents = options.accents > </#if>
        <#if key = "lowercase"> <#assign lowercase = options.lowercase > </#if>
    </#list>

    <#-- PROCESS NORMALIZATION -->

    <#assign formatedStr = formatedStr?replace("'", "’", "r")>

    <#if punctuation?is_string>
        <#if punctuation == "remove">
            <#assign formatedStr = formatedStr?replace(r'\p{Punct}', '', 'r')>
            <#assign formatedStr = formatedStr?replace("’", "", "r")>
        </#if>
    </#if>

    <#if punctuation?is_boolean>
        <#if !punctuation>
            <#assign formatedStr = formatedStr?replace(r'\p{Punct}', '_', 'r')>
            <#assign formatedStr = formatedStr?replace("’", "_", "r")>
        </#if>
    </#if>

    <#if !spaces>
        <#assign formatedStr = formatedStr?replace(r'\s', '_', 'r')>
    </#if>

    <#if !accents>
        <#assign formatedStr = formatedStr?replace(r'[éèêë]', 'e', 'r')>
        <#assign formatedStr = formatedStr?replace(r'[ïîì]', 'i', 'r')>
        <#assign formatedStr = formatedStr?replace(r'[àäâ]', 'a', 'r')>
        <#assign formatedStr = formatedStr?replace(r'[ôöò]', 'o', 'r')>
        <#assign formatedStr = formatedStr?replace(r'[ùûü]', 'u', 'r')>
        <#assign formatedStr = formatedStr?replace(r'(_)+', '_', 'r')>
    </#if>
    <#if lowercase>
        <#assign formatedStr = formatedStr?lower_case>
    </#if>

    <#-- Replace multiple _ with simple _ -->
    <#assign formatedStr = formatedStr?replace(r'(_)+', '_', 'r')>
    <#-- Remove _ at begin -->
    <#assign formatedStr = formatedStr?replace(r'^(_)+', '', 'r')>
    <#-- Remove _ at end -->
    <#assign formatedStr = formatedStr?replace(r'(_)+$', '', 'r')>

    <#-- RETURN NORMALIZED STRING -->
    <#return formatedStr>
</#function>
