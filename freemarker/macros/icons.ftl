<#-- Liste des icones déjà utilisé -->
<#assign usedIconList = ["Navigation_Arrow_Arrow--Bottom_16px","Navigation_Arrow_Arrow--Left_16px","Navigation_Arrow_Arrow--Right_16px","Navigation_Arrow_Arrow--Top_16px","Navigation_Control_Cross_16px","Social_View_Star--Full_16px","Navigation_Arrow_Arrow--Bottom_24px","Navigation_Arrow_Arrow--Left_24px","Navigation_Arrow_Arrow--Right_24px","Navigation_Arrow_Arrow--Top_24px","Navigation_Control_Cross_24px","Navigation_Notification_Circle--Available_24px","Product_Basket_Standard_24px","Social_View_Star--Full_24px","Navigation_Arrow_Arrow--Bottom_48px","Navigation_Arrow_Arrow--Left_48px","Navigation_Arrow_Arrow--Right_48px","Navigation_Arrow_Arrow--Top_48px","Navigation_Control_Cross_48px","Navigation_Notification_Circle--Available_48px","Product_Basket_Standard_48px","Social_View_Star--Full_48px","Navigation_Arrow_Arrow--Bottom_32px","Navigation_Arrow_Arrow--Left_32px","Navigation_Arrow_Arrow--Right_32px","Navigation_Arrow_Arrow--Top_32px","Navigation_Control_Cross_32px","Navigation_Notification_Circle--Available_32px","Product_Basket_Standard_32px","Social_View_Star--Full_32px"]>
<#assign breakpoints = ["S", "M", "L", "XL", "XXL"]>

<#--
Macro d'ajout d'un icone unique
Exemple
    <@icons.icon iconPath="Navigation_Display_Setting_48px" />
    <@icons.icon iconPath="Navigation_Publish_Circle--Delete_48px" />
    <@icons.icon iconPath="Navigation_Publish_Edit_48px" />
-->
<#macro icon iconPath = "" class = "" symbolOnly = false>
    <#if iconPath != "">
        <#assign id = iconPath?split("/")>
        <#assign id = id[id?size-1]>

        <#if isInArray( usedIconList, id ) == "false" >
            <#include "/icon-kit/${iconPath}.svg" ignore_missing=true>
            <#assign usedIconList = usedIconList + [id]>
        </#if>

        <#if !symbolOnly >
            <svg class="ku-icon-${getIconSize(id)} ${class}"><use href="#${id}"></use></svg>
        </#if>
    </#if>
</#macro>

<#--
Macro d'ajout d'un jeu d'icone responsive
TODO : Permettre de passer les breakpoint dans le désordre
Exemple
    <@icons.iconset iconsMap={"S": "Device_Mobile_48px", "M": "Device_Tablet_48px"} />
    <@icons.iconset iconsMap={"M": "Device_Tablet_48px", "XL": "Device_Laptop_48px", "XXL": "Device_Desktop_48px"} />
    <@icons.iconset iconsMap={"S": "Device_Mobile_48px", "M": "Device_Tablet_48px"} />

Ne pas oublier d'inclure le fichier :
<#import "[path]/macros/common/icons.ftl" as icons>
 -->

<#macro iconset iconsMap class = "">
    <#assign useClassByBP = "">
    <#assign svgClassByBP = "">
    <#assign ignoreBefore = 0>
    <#assign useTagList = []>

    <#list iconsMap?keys as k>

        <#assign id = iconsMap[k]?split("/")>
        <#assign id = id[id?size-1]>
        <#if isInArray( usedIconList, id ) == "false" >
            <#include "/icon-kit/${iconsMap[k]}.svg">
            <#assign usedIconList = usedIconList + [id]>
        </#if>

        <#list breakpoints as breakpoint>
            <#if (k = breakpoint) || (breakpoint?index gt ignoreBefore && isInHash(iconsMap, breakpoint) == "false" && useClassByBP?has_content)>
                <#assign ignoreBefore = breakpoint?index>
                <#assign useClassByBP = useClassByBP + "ku-show-icon@from-" + breakpoint?lower_case + " ">
                <#if breakpoint == 'S'>
                    <#assign svgClassByBP = svgClassByBP + "ku-icon-" + getIconSize(id) + " ">
                <#else>
                    <#assign svgClassByBP = svgClassByBP + "ku-icon-" + getIconSize(id) + "@from-" + breakpoint?lower_case + " ">
                </#if>
            <#elseif breakpoint?index gt ignoreBefore && isInHash(iconsMap, breakpoint) == "true" >
                <#break>
            </#if>
        </#list>

        <#-- icon-24-m icon-24-l icon-32-xl icon-48-xl -->
        <#assign useTagList = useTagList + ['<use href="#${id}" class="kl-hidden ${useClassByBP}"></use>']>
        <#assign useClassByBP = "">
    </#list>
    <svg class="${svgClassByBP} ${class}">
        ${useTagList?join('')}
    </svg>
</#macro>




<#-- Retourne la taille de l'icone en fonction de son nom -->
<#function getIconSize name>
    <#return name?keep_after_last("_")?remove_ending("px")>
</#function>

<#-- Vérifie si un élément est présent dans un tableau -->
<#function isInArray arr key>
    <#return arr?seq_contains(key)?string("true","false")>
</#function>

<#-- Vérifie si une clé est présente dans l'objet, et vérifie qu'elle posséde une valeur si précisé -->
<#function isInHash hash key value="">
    <#assign response = "false">
    <#list hash?keys as k>
        <#if k = key>
            <#if (value?has_content && value = hash[k]) || !value?has_content>
                <#assign response = "true">
                <#break>
            </#if>
        </#if>
    </#list>
    <#return response>
</#function>
