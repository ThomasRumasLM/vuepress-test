<#import "icons.ftl" as icons>

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
