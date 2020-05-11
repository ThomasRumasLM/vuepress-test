<#import "icons.ftl" as icons>

<#--
@param options : object
    * id : String
    * showOnHoverNav : boolean
    * navSize : String
    * bevel : String
    * cssClass : object
    * arrowPosition : String

    exemple  :
    <#import "../../macros/common/carousel.ftl" as image>
    <#import "../../macros/common/icons.ftl" as icons>

    <#assign carouselOptions = {
        "id":"js-my-carousel",
        "showOnHoverNav":true,
        "navSize":"l",
        "bevel":"right-l",
        "cerberusBtnPrev": "",
        "cerberusBtnNext" : "",
        "cssClass" : {
            "container" : "col-12 col-l-4 col-start-l-5 demo"
        },
        "arrowPosition" : "inside"
    }/>

    <@image.carousel options = carouselOptions >
        <li>
            <img class="km-carousel__img tns-lazy-img" src="/app/lmfr-site/static/images/common/loader.svg" data-src="https://source.unsplash.com/collection/1891993" />
        </li>
        <li>
            <img class="km-carousel__img tns-lazy-img" src="/app/lmfr-site/static/images/common/loader.svg" data-src="https://source.unsplash.com/collection/993239" />
        </li>
        <li>
            <img class="km-carousel__img tns-lazy-img" src="/app/lmfr-site/static/images/common/loader.svg" data-src="https://source.unsplash.com/collection/1673600" />
        </li>
        <li>
            <img class="km-carousel__img tns-lazy-img" src="/app/lmfr-site/static/images/common/loader.svg" data-src="https://source.unsplash.com/collection/1513994" />
        </li>
        <li>
            <img class="km-carousel__img tns-lazy-img" src="/app/lmfr-site/static/images/common/loader.svg" data-src="https://source.unsplash.com/collection/502925" />
        </li>
    </@image.carousel>
-->

<#macro carousel options ={}>
    <div  class="km-carousel ${(options.showOnHoverNav?? && options.showOnHoverNav )?then('km-carousel--controls-hidden','')}  <#if options.bevel??>km-carousel--bevel-${options.bevel}</#if> <#if options.cssClass?? && options.cssClass.container??> ${options.cssClass.container}</#if> <#if options.arrowPosition?? && options.arrowPosition == 'outside'>km-carousel--items-carousel</#if>">
        <nav class="km-carousel__controls <#if options.showOnHoverNav?? && options.showOnHoverNav>kl-hidden-accessibility</#if>" id="${options.id}-controls" aria-label="Carousel Navigation" tabindex="0">
            <button data-controls="prev" aria-controls="customize" tabindex="-1" class="ka-nav-button <#if options.navSize?? && options.navSize == 'l'>ka-nav-button--l</#if> <#if options.cssClass?? && options.cssClass.navButtons??>${options.cssClass.navButtons}</#if>" type="button" <#if (options.cerberusBtnPrev)??> <@macros.cerberus "${options.cerberusBtnPrev}" /> </#if> aria-label="Précédent"><@icons.icon iconPath="Navigation_Arrow_Arrow--Left_16px"  /></button>
            <button data-controls="next" aria-controls="customize" tabindex="-1" class="ka-nav-button <#if options.navSize?? && options.navSize == 'l'>ka-nav-button--l</#if> <#if options.cssClass?? && options.cssClass.navButtons??>${options.cssClass.navButtons}</#if>" type="button" <#if (options.cerberusBtnNext)??> <@macros.cerberus "${options.cerberusBtnNext}" /> </#if> aria-label="Suivant"><@icons.icon iconPath="Navigation_Arrow_Arrow--Right_16px" /></button>
        </nav>
        <ul id="${options.id}" data-carousel-id="${options.id}">
            <#nested>
        </ul>
    </div>
</#macro>
