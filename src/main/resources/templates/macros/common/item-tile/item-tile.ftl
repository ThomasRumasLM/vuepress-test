
  <#--  Item tile macro configuration  -->
  <#--
    bladesOrder contains every blades that should be displayed

    In portrait mode, it is useless
    In landscape mode, it allows us to set groups of consistent blades

    If you do not want a blade to be displayed, remove it from your array
    If you need a blade to be displayed in desktop and hidden in mobile, you should use responsive helper classes
  -->
  <#assign defaultConfig = {
    "bladesOrder" : {
      "0": [ "IMAGE__DEFAULT" ],
      "1": [ "BRAND", "FLAG"],
      "2": [ "DESIGNATION", "REVIEWS-SUMMARY", "DURATION", "REVIEWS-CONTENT" ],
      "3": [ "DISCOUNT-PRICE-FLAG", "PRICE", "REFUND-WLL", "DELIVRANCE","VENDOR" ],
      "4": [ "ADD-TO-CART" ]
    },
    "bladesConfig" : {
        "1": {
          "display" : "inline"
        }
    },
    "orientation" : "v",
    "quantity"    : false,
    "crossSell"   : false,
    "location"    : false,
    "hasBottomButton": false,
    "twoLineClamp"   : false,
    "lazyload" : true
  }>

  <#macro itemtileMacro item config>
    <#--  CONFIG VARIABLES UPDATE WITH `config` -->
    <#assign
    bladesOrder = (config.bladesOrder)!defaultConfig.bladesOrder
    bladesConfig = (config.bladesConfig)!defaultConfig.bladesConfig
    orientation = (config.orientation)!defaultConfig.orientation
    quantity = (config.quantity)!defaultConfig.quantity
    crossSell = (config.crossSell)!defaultConfig.crossSell
    location = (config.location)!defaultConfig.location
    hasBottomButton = (config.hasBottomButton)!defaultConfig.hasBottomButton
    twoLineClamp = (config.twoLineClamp)!defaultConfig.twoLineClamp,
    lazyload = (config.lazyload)!(defaultConfig.lazyload)
    >

    <article class="kl-tile kl-tile--${orientation}<#if hasBottomButton> kl-tile--button-bottom</#if>">

        <#list bladesOrder as key, blades>

          <#if key=="0" || key=="1" > <div class="kl-tile__group<#if key=='1'> kl-tile__group--second</#if>"> </#if>
          <#if (bladesConfig[key]??)>
            <#assign groupClass = "kl-group-blades--"+bladesConfig[key].display>
          <#else>
            <#assign groupClass = "kl-group-blades--block">
          </#if>

          <div class="kl-group-blades ${groupClass!}">
            <#list blades as blade>

              <#assign filename = "item-tile--${blade?lower_case}.ftl">
              <#if templateExists(filename) == "true">
                <#include filename>
              </#if>

            </#list>
          </div>

          <#if key=="0" || key==(bladesOrder?size - 1)?string > </div> </#if>
        </#list>

    </article>
  </#macro>

<#function templateExists filename>
  <#assign optTemp = .get_optional_template(filename)>
  <#if optTemp.exists>
    <#--  <@optTemp.include />  -->
    <#return true?c>
  <#else>
    <#return false?c>
  </#if>
</#function>
