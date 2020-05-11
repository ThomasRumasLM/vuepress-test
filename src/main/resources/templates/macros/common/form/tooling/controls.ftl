<#import "config.ftl" as default >

<#function inputType config = {}>
    <#assign type = config.type />
    <#assign supportedValue = "" >
    <#if (default.defaultPatterns.input[type])??>
        <#return true >
    <#else>
        <#list default.defaultPatterns.input as key, value >
            <#assign supportedValue = supportedValue + "<li class='ka-text--micro ka-text--error'><mark> ${key} </mark></li>" >
        </#list>
        <#return "<p class='ka-text--micro ka-text--error'>Le type <mark>" + type + "</mark> n'est pas supporté par la macro. <br> Valeurs supportées : <ul> " + supportedValue + "</ul> </p>" >
    </#if>
</#function>

<#function inputConfig config = {} >
    <#assign requiredKeys = ["name", "label", "type"] >
    <#assign invadidError = "" >

    <#list requiredKeys as key>
        <#if !(config[key])?? >
            <#assign invadidError = invadidError + " <mark>${key}</mark>" >
        </#if>
    </#list>

    <#if invadidError != "">
        <#assign invadidError = "<p class='ka-text--micro ka-text--error'>Les valeurs suivantes ne sont pas renseignées : " + invadidError + "</p>">
    </#if>

    <#return invadidError >
</#function>

<#function choiceConfig config = {} >
    <#assign requiredKeys = ["name", "label", "values"] >
    <#assign invadidError = "" >

    <#list requiredKeys as key>
        <#if !(config[key])?? >
            <#assign invadidError = invadidError + " <mark>${key}</mark>" >
        </#if>
    </#list>

    <#if invadidError != "">
        <#assign invadidError = "<p class='km-field__message ka-text--micro ka-text--error'>Les valeurs suivantes ne sont pas renseignées : " + invadidError + "</p>">
    </#if>
    
    <#return invadidError >
</#function>