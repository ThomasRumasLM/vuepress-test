<#import "../image.ftl" as image>
<#import "../carousel.ftl" as genericalCarousel>
<#import "../icons.ftl" as icons>
<#assign altImg="${item.designation!}">
<#assign classImg="lazy kl-tile__figure">
<#assign carouselOptions = {
    "id": "js-slider-${item.id}",
    "navSize": "s",
    "showOnHoverNav": true,
    "arrowPosition" : "inside",
    "cssClass" : {
            "container" : "m-carousel--nav-hover"
    }
}/>

<#if (item.images)?? && (item.images?size gt 0 )>
    <@genericalCarousel.carousel options = carouselOptions>
        <#list item.images as picture>
            <li class="km-carousel__item">
                <#if (picture.url)?? && (picture.url != "")>
                    <#assign srcImg="${picture.url}?width=220&format=jpg">
                    <div class="kl-blade kl-blade--figure">
                        <#if (item.url)??><a href="${item.url}"></#if>
                            <@image.image alt="${altImg}" class="${classImg}" src="${srcImg}" />
                        <#if (item.url)??></a></#if>
                    </div>
                </#if>
            </li>
        </#list>
    </@genericalCarousel.carousel>
<#else>
  <div class="kl-blade kl-blade--figure kl-blade--figure-default">
    <@icons.icon iconPath="Media_NoPicture_48px" class="${classImg} ${classImg}--no-picture" />
  </div>
</#if>
