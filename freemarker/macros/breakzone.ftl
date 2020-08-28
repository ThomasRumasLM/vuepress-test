<#import "common-macro.ftl" as macros>
<#import "image.ftl" as image>
<#--  Macro breakzone

    @param {String} type          : Type to generate the link, example [PRODUCT::ID_PRODUCT]
    @param {String} code          : code of the product (for example)
    @param {String} designation   : Designation of the product (for example)
    @param {String} imageUrl      : url of the media image
    @param {String} widthImg      : width of the image
    @param {String} textLink      : Text of link "En savoir plus" by default
    @param {String} cerberus      : data cerberus

    How to use :

    <#assign breakzoneOptions = {
        "type": "PRODUCT",
        "code": product.getCode(),
        "designation": product.getDesignation(),
        "imageUrl": product.getMedia()[0].getUrl(),
        "widthImg":500,
        "textLink": "En savoir plus",
        "cerberus": "ELEM_breakzone",
        "dataTagco"   : "{'titi' : 'tata', 'tutu' : 'toto'}",
        "dataTcevent" : "tc-event-example"
    }/>

    <@breakzone.breakzone options = breakzoneOptions />

  -->

<#macro breakzone config ={}>

    <#assign defaultOptions = {
        "type": "PRODUCT",
        "code": "",
        "designation": "",
        "imageUrl": "",
        "widthImg": 670,
        "textLink": "En savoir plus",
        "cerberus": "",
        "dataTagco"   : "",
        "dataTcevent" : "",
        "dataMerchPos" : "",
        "dataMerchName" : ""
    } />

    <#assign options = {
        "type" : (config.type)!defaultOptions.type,
        "code": (config.code)!defaultOptions.code,
        "designation": (config.designation)!defaultOptions.designation,
        "imageUrl": (config.imageUrl)!defaultOptions.imageUrl,
        "widthImg": (config.widthImg)!defaultOptions.widthImg,
        "textLink" : (config.textLink)!defaultOptions.textLink,
        "cerberus": (config.cerberus)!defaultOptions.cerberus,
        "dataTagco": (config.dataTagco)!defaultOptions.dataTagco,
        "dataTcevent": (config.dataTcevent)!defaultOptions.dataTcevent,
        "dataMerchPos": (config.dataMerchPos)!defaultOptions.dataMerchPos,
        "dataMerchName": (config.dataMerchName)!defaultOptions.dataMerchName
    } />

    <div class="km-breakzone" <#if (options.dataTagco)??> data-tagco="${options.dataTagco}" </#if> <#if (options.dataTcevent)??> data-tcevent="${options.dataTcevent}" </#if>  <#if (options.cerberus)??> <@macros.cerberus "${options.cerberus}" /> </#if> <#if (options.dataMerchPos)??> data-merch-pos="${options.dataMerchPos}" </#if> <#if (options.dataMerchName)??> data-merch-name="${options.dataMerchName}" </#if> >
        <#if (options.code)??> <a href="[${options.type}::${options.code}]" class="km-breakzone__link"> </#if>
            <div class="km-breakzone__wrap-image">
                <picture>
                    <source media="(max-width: 390px)" srcset="${options.imageUrl}?width=360">
                    <source media="(max-width: 500px)" srcset="${options.imageUrl}?width=470">
                    <source media="(max-width: 1024px)" srcset="${options.imageUrl}?width=651">
                    <source media="(max-width: 1680px)" srcset="${options.imageUrl}?width=444">
                    <img src="${options.imageUrl}?width=${options.widthImg}" alt="${options.designation}" class="km-breakzone__image" loading="lazy">
                </picture>
            </div>
            <p class="km-breakzone__designation" aria-hidden="true">
                ${options.designation}
            </p>
        <#if (options.code)??>
            <span class="km-breakzone__cta">${options.textLink}</span>
            </a>
        </#if>
    </div>
</#macro>
