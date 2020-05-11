<#import "../image.ftl" as image>
<#import "../icons.ftl" as icons>

<#assign altImg="${item.designation!}">

<#if (lazyload)>
  <#assign classImg="lazy kl-tile__figure">
<#else>
  <#assign classImg="kl-tile__figure">
</#if>

<#if (item.image)?? && (item.image != "")>
  <#if (item.paramsImage)??>
    <#assign srcImg="${item.image}?${item.paramsImage}">
  <#else>
    <#assign srcImg="${item.image}?width=300&format=jpg">
  </#if>
  <div class="kl-blade kl-blade--figure">
    <@image.image alt="Image : ${altImg}" class="${classImg}" src="${srcImg}" />
  </div>
<#else>
  <div class="kl-blade kl-blade--figure kl-blade--figure-default">
    <@icons.icon iconPath="Media_NoPicture_48px" class="${classImg} ${classImg}--no-picture" />
  </div>
</#if>
