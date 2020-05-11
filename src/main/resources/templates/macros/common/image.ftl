<#--
Generate :
<img alt="" class="" src="" />

Or if lazy class is present :
<img alt="" class="" data-src="" />

@param alt      : string :: image description
@param class    : string :: class for img element
@param src      : string :: url of image resource
@param loading  : string :: loading behavior : auto, lazy, eager (optional)
How to use it :

1) Call the helper :
<#import "PATH/macros/image.ftl" as image>

2) Set your informations :
<#assign altImg="My description">
<#assign classImg="my-class my-class__another-class">
<#assign srcImg="${itemShowcase.mainImage.href}?width=640&crop=11:6,smart">
<#assign loading="lazy">

3) Call the macro :
<@image.image alt="${altImg}" class="${classImg}" src="${srcImg}" loading="${loading}" />
-->
<#macro image alt class src prmLoad="" ratio="">

    <#-- We assign a new variable because its impossible to overwrite a parameter
        and we need to, to assure retrocompatibility -->
    <#assign loading = prmLoad>

    <#-- We assign a new variable because its impossible to overwrite a parameter
      and we need to append class for ratio -->
    <#assign classes = class>

    <#-- Retrocompatibily: set the loading param if the macro is used the old way (with lazy class) -->
    <#if class?contains("lazy") && loading == ''>
       <#assign loading = 'lazy'>
    </#if>

    <#if (src)?? && src != "">
        <#if ratio != "">
          <#assign classes += " ku-ratio__content">
          <div class="ku-ratio ku-ratio--${ratio}">
        </#if>

        <#assign imageDefault = '<img alt="${alt!}" class="${classes!}" src="${src!}" />'>
        <#if loading != "">
            <img alt="${alt!}" class="${classes!}" src="/app/lmfr-site/static/images/common/loader.svg" data-src="${src!}" />
        <#else>
            ${imageDefault}
        </#if>

         <#if ratio != "">
          </div>
         </#if>
    </#if>
</#macro>

<#--
Generate :

<picture class="maclasse">
    <source srcset="you-pict.xxx?width=320" media="(max-width: 320px)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 640px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 960px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 960px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 1280px)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 1920px)">
    <source srcset="you-pict.xxx?width=1921" media="(min-width: 1921px)">
    <img src="you-pict.xxx?width=640" alt="Alternative text">
</picture>

Or with lazy load :
<picture class="maclasse lazy-loaded" data-iesrc="you-pict.xxx" data-alt="Alternatve text" data-class="coincoin">
    <source srcset="you-pict.xxx?width=320" media="(max-width: 320px)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 320px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=640" media="(max-width: 640px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 640px) and (-webkit-min-device-pixel-ratio: 3)">
    <source srcset="you-pict.xxx?width=960" media="(max-width: 960px)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 960px) and (-webkit-min-device-pixel-ratio: 2)">
    <source srcset="you-pict.xxx?width=1280" media="(max-width: 1280px)">
    <source srcset="you-pict.xxx?width=1920" media="(max-width: 1920px)">
    <source srcset="you-pict.xxx?width=1921" media="(min-width: 1921px)">
    <img alt="Alternatve text" class="coincoin">
</picture>

@param alt      : string :: image description
@param class    : string :: class for img element
@param src      : string :: url of image resource

How to use it :

1) Call the helper :
<#import "PATH/macros/image.ftl" as image>

2) Set your informations :
<#assign altImg="My description">
<#assign pictureClass="lazy my-class my-class__another-class">
<#assign imageClass="my-class-for-my-img">
<#assign srcImg="${itemShowcase.mainImage.href}">

3) Call the macro :
<@image.picture alt="${altImg}" class="${pictureClass}" src="${srcImg}" imgClass="${imageClass}"/>
-->

<#macro picture alt class src imgClass prmLoad="">

  <#assign ratio1 = 320>
  <#assign ratio2 = ratio1*2> <#--  640  -->
  <#assign ratio3 = ratio1*3> <#--  960  -->
  <#assign ratio4 = ratio1*4> <#--  1280  -->
  <#assign ratio5 = ratio1*6> <#--  1920  -->
  <#assign ratio6 = ratio1*6 + 1> <#-- 1921 -->

  <#assign pictureConfig = {
    "${ratio1?c}": "(max-width: ${ratio1?c}px)",
    "${ratio2?c}": "(max-width: ${ratio1?c}px) and (-webkit-min-device-pixel-ratio: 2)",
    "${ratio3?c}": "(max-width: ${ratio1?c}px) and (-webkit-min-device-pixel-ratio: 3)",
    "${ratio2?c}": "(max-width: ${ratio2?c}px)",
    "${ratio4?c}": "(max-width: ${ratio2?c}px) and (-webkit-min-device-pixel-ratio: 2)",
    "${ratio5?c}": "(max-width: ${ratio2?c}px) and (-webkit-min-device-pixel-ratio: 3)",
    "${ratio3?c}": "(max-width: ${ratio3?c}px)",
    "${ratio4?c}": "(max-width: ${ratio3?c}px) and (-webkit-min-device-pixel-ratio: 2)",
    "${ratio4?c}": "(max-width: ${ratio4?c}px)",
    "${ratio5?c}": "(max-width: ${ratio5?c}px)",
    "${ratio6?c}": "(min-width: ${ratio6?c}px)"
  }>

  <#-- We assign a new variable because its impossible to overwrite a parameter
      and we need to, to assure retrocompatibility -->
  <#assign loading = prmLoad>

  <#-- Retrocompatibily: set the loading param if the macro is used the old way (with lazy class) -->
  <#if class?contains("lazy") && loading == ''>
     <#assign loading = 'lazy'>
  </#if>

  <picture class="${class!}" <#if loading != "">loading="${loading}" data-class="${imgClass!}" data-iesrc="${src!}" data-alt="${alt!}"</#if>>
  <#list pictureConfig as key, value>
    <source srcset="${src!}?width=${key!}" media="${value}">
  </#list>
  <#if loading == "">
    <img src="${src!}?width=${ratio2}" alt="${alt!}" class="${imgClass!}" />
  </#if>
  </picture>

</#macro>
