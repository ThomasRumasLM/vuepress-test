<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>

<#macro swiper options={}>
    <div class="kl-swiper kl-container ${options.cssClass}">
        <div class="col-container kl-swiper__override-grid">
            <#nested>
        </div>
    </div>
</#macro>

<#--
@param options : object
    * navSize : String
    * cssClass : object
    * cerberusBtnPrev : String
    * cerberusBtnNext : String

    exemple  :
    <#import "../../macros/common/swiper.ftl" as swiper>

    <#assign swiperOptions = {
        "navSize":"l",
        "cerberusBtnPrev": "",
        "cerberusBtnNext" : "",
        "cssClass" : {
            "container" : "mySwiperSlider"
        }
    }/>

    <@swiper.swiperSlider options = swiperOptions >
        <li>
            <div class="kl-swiper__slider-item"></div>
        </li>
        <li>
            <div class="kl-swiper__slider-item"></div>
        </li>
        <li>
            <div class="kl-swiper__slider-item"></div>
        </li>
        <li>
            <div class="kl-swiper__slider-item"></div>
        </li>
        <li>
            <div class="kl-swiper__slider-item"></div>
        </li>
    </@swiper.swiperSlider>
-->

<#macro swiperSlider options={}>
    <#if (options.cssClass.swiperContainer)??>
        <#assign classSwiperContainer>${options.cssClass.swiperContainer}</#assign>
    <#else>
        <#assign classSwiperContainer>kl-container</#assign>
    </#if>
    <div class="kl-swiper__slider-container ${options.cssClass.container}">
        <nav class="kl-swiper__controls kl-swiper__controls--hidden" aria-label="Carousel Navigation">
            <button data-controls="prev" aria-controls="customize" class="ka-nav-button ka-nav-button--hidden  <#if options.navSize?? && options.navSize == 'l'>ka-nav-button--l</#if> <#if options.cssClass?? && options.cssClass.navButtons??>${options.cssClass.navButtons}</#if>" type="button" <#if (options.cerberusBtnPrev)??> <@macros.cerberus "${options.cerberusBtnPrev}" /> </#if> aria-label="Précédent"><@icons.icon iconPath="Navigation_Arrow_Arrow--Left_16px"  /></button>
            <button data-controls="next" aria-controls="customize" class="ka-nav-button <#if options.navSize?? && options.navSize == 'l'>ka-nav-button--l</#if> <#if options.cssClass?? && options.cssClass.navButtons??>${options.cssClass.navButtons}</#if>" type="button" <#if (options.cerberusBtnNext)??> <@macros.cerberus "${options.cerberusBtnNext}" /> </#if> aria-label="Suivant"><@icons.icon iconPath="Navigation_Arrow_Arrow--Right_16px" /></button>
        </nav>
        <div class="kl-swiper ${classSwiperContainer}">
            <ul class="kl-swiper__slider  kl-swiper__slider--center">
                <#nested>
            </ul>
        </div>
    </div>
</#macro>
