<#import "icons.ftl" as icons>
<#import "./tokens/ratingStars.ftl" as ratingStarsJson>

<#macro ratingStarsDisplay config={} dataSup...>
    <#local modifierList = ratingStarsJson.json.modifier>
    <#local classnames = ''/>
    <#local score = config.score>
 <#--  targeting the decimal of this score  -->
    <#local decimalScore = score?string["0.#"]?keep_after(",") />
     <#if decimalScore?has_content>
        <#--  set lists of decimal moves  -->
        <#local halfUp = ["6", "7", "8", "9"] />
        <#local halfDown = ["1", "2", "3", "4"] />
            <#--  replace decimals up -->
            <#if halfUp?seq_contains("${decimalScore}")>
                <#local score = score?int + 0.5>
            </#if>
            <#--  replace decimals down -->
            <#if halfDown?seq_contains("${decimalScore!}")>
                <#local score = score?int>
            </#if>
        <#--  New calcul percent  -->
        <#local purcent =  score*20>
     <#else>
        <#local purcent =  config.score*20>
    </#if>

    <#list modifierList as modifier>
        <#if modifier.value == purcent>
            <#local classnames = classnames + " ${ratingStarsJson.json.result}--${modifier.class}"/>
        </#if>
    </#list>
    <#if ratingStarsJson.json.sizes?seq_contains("${config.size!}")>
        <#local classnames = classnames + " ${ratingStarsJson.json.result}--${config.size!}"/>
    </#if>
    <#local dataAttributes=""/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != "class">
                <#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>
    <div class="${ratingStarsJson.json.result} ${classnames}" ${dataAttributes} >
        <span class="${ratingStarsJson.json.result}__${ratingStarsJson.json.visual}"></span>
        <span class="${ratingStarsJson.json.result}__${ratingStarsJson.json.text}">Global score: ${config.score!}/5</span>
    </div>
</#macro>

<#macro ratingStarsInput config={} dataSup...>
    <#local labels = ["Very bad","Bad","Medium", "Good","Excellent"] />
    <#local classnames = ''/>
    <#if ratingStarsJson.json.sizes?seq_contains("${config.size!}")>
        <#local classnames = classnames + "${ratingStarsJson.json.input}--${config.size!}"/>
    </#if>
    <#local dataAttributes=""/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != "class">
                <#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>
    <div class="${ratingStarsJson.json.input} ${classnames}" ${dataAttributes} >
        <input type="radio" name="${config.id!}" value="0" id="${config.id!}no-rate" class="${ratingStarsJson.json.input}__${ratingStarsJson.json.radio}" checked aria-label="No opinion given" />
        <#list labels as label>
            <input
                type="radio"
                name="${config.id!}"
                value="${label?index + 1}"
                id="${config.id!}${label?index + 1}"
                class="${ratingStarsJson.json.input}__${ratingStarsJson.json.radio}"
            >
            <label for="${config.id!}${label?index + 1}" class="${ratingStarsJson.json.input}__${ratingStarsJson.json.label}">
                <span class="${ratingStarsJson.json.input}__${ratingStarsJson.json.text}">${label}</span>
            </label>
        </#list>
    </div>
</#macro>

<#macro ratingstars count size="24px">
    <fieldset class="ka-ratingstars">
        <#list 1..5 as i>
            <#if i <= count>
                <span class="ka-ratingstars__wrapper">
                    <@icons.icon iconPath="Social_View_Star--Full_${size}" class="ka-ratingstars__star ka-ratingstars__star--full"/>
                </span>
            <#elseif  (count < i+0.5) && (i-0.5 <= count)>
                <span class="ka-ratingstars__wrapper">
                    <@icons.icon iconPath="Social_View_Star--Half_${size}" class="ka-ratingstars__star ka-ratingstars__star--half"/>
                    <@icons.icon iconPath="Social_View_Star--Full_${size}" class="ka-ratingstars__star"/>
                </span>
            <#else>
                <span class="ka-ratingstars__wrapper">
                    <@icons.icon iconPath="Social_View_Star--Full_${size}" class="ka-ratingstars__star"/>
                </span>
            </#if>
        </#list>
    </fieldset>
</#macro>
