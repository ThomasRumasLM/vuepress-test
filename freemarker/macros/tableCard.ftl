<#import "./tokens/tableCard.ftl" as tableCardJson>
<#import "./tools/_random.function.ftl" as random>

<#--  
    config:{
        title: {
            text: "",
            semantic: ""
        },
        steps: [
            { 
                pictogram:{ url:"", alt:"" },
                title:"", 
                description:""
            }
        ],
        subtitle : "",
        theme : ""
    }
 -->
<#macro tableCard config dataSup...>
    <#local mainClass = tableCardJson.json.base/>
    <#local titleClass = mainClass + tableCardJson.json.title/>
    <#local detailClass = mainClass + tableCardJson.json.detail/>
    <#local detailTitleClass = mainClass + tableCardJson.json.detailTitle/>
    <#local triggerClass = mainClass + tableCardJson.json.trigger/>
    <#local triggerLabelClass = mainClass + tableCardJson.json.triggerLabel/>

    <#local dataAttributes=""/>
    <#if dataSup?is_hash>
        <#list dataSup as key, value>
            <#if key != 'class'>
                <#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
            </#if>
        </#list>
    </#if>

    <#local classes = "${mainClass}"/>
    <#if dataSup.class?has_content>
        <#local classes = classes + " ${dataSup.class}"/>
    </#if>

    <#local heading ="h3" />
    <#if config.title.semantic??>
        <#local heading ="h${config.title.semantic}" />
    </#if>

    <#if config.theme??>
        <#local classes = classes + " ${mainClass}--${config.theme}"/>
    <#else>
        <#local classes = classes + " ${mainClass}--white"/>
    </#if>

    <#local id = "tableCard-" + random.rand(0,999) + "-" + random.rand(0,999) + "-" + random.rand(0,999)/>

    <div class="${classes}" ${dataAttributes}>
        <${heading} class="${titleClass}">${config.title.text}</${heading}>
        <#list config.steps as step>
            <@stepGenerator step/>
        </#list>
        <input type="checkbox" id="${id}" class="${triggerClass}">
        <div class="${detailClass}">
            <#if config.subtitle??>
                <p class="${detailTitleClass}">${config.subtitle}</p>
            </#if>
            <#nested>
        </div>
        <label for="${id}" class="${triggerLabelClass}">
            En savoir plus        
        </label>
    </div>
</#macro>

<#--  
    config:{
        pictogram:{ url:"", alt:"" },
        title:"", 
        description:""
    }
 -->
<#macro stepGenerator config>
    <#local mainClass = tableCardJson.json.base + tableCardJson.json.step.base/>
    <#local containerClass = mainClass + tableCardJson.json.step.container/>
    <#local iconClass = mainClass + tableCardJson.json.step.icon/>
    <#local titleClass = mainClass + tableCardJson.json.step.title/>
    <#local detailClass = mainClass + tableCardJson.json.step.detail/>
    
    <div class="${mainClass}">
        <#if config.pictogram?? && config.pictogram.url?? && config.pictogram.alt?? >
            <img alt="${config.pictogram.alt}" class="${iconClass}" src="${config.pictogram.url}">
        </#if>
        <div class="${containerClass}">
            <#if config.title??>            
                <p class="${titleClass}">${config.title}</p>
            </#if>
            <#if config.description??>        
                <p class="${detailClass}">${config.description}</p>
            </#if>
        </div>
    </div>
</#macro>