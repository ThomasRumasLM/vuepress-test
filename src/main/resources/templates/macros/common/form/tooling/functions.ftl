<#import "config.ftl" as default >

<#function id name = "" id = "" >
    <#return "${name}--${id}" >
</#function>

<#function getErrorMessages hasPattern config = {}  >
    <#if !(config.validation.mismatch)??>
        <#assign overrideMismatchMessage=default.defaultMismatchMessage >
    <#else>
        <#assign overrideMismatchMessage=config.validation.mismatch >
    </#if>
    <#if !(config.validation.missing)??>
        <#assign overrideMissingMessage=default.defaultMissingMessage >
    <#else>
        <#assign overrideMissingMessage=config.validation.missing >
    </#if>
    <#if isRequired(config) && hasPattern>
        <#return "data-missing='${overrideMissingMessage}' data-mismatch='${overrideMismatchMessage}'" >
    <#elseif isRequired(config) >
        <#return "data-missing='${overrideMissingMessage}'" >
    <#elseif hasPattern>
        <#return "data-mismatch='${overrideMismatchMessage}'" >
    <#else>
        <#return "" />
    </#if>
</#function>

<#--  Attributs required  -->
<#function isRequired config = {}>
    <#if (config.required)?? && config.required>
        <#return true >
    <#else>
        <#return false >
    </#if>
</#function>

<#--  Attributs pattern  -->
<#function getPatternAttr config = {} pattern = "" >
    <#assign patternType = getPatternType(config pattern) />

    <#assign patternMinMaxString = "" />
    <#assign minlength = (config.validation.minlength?c)!"0" />
    <#assign maxlength = (config.validation.maxlength?c)! />
    <#if (config.validation.minlength)?? || (config.validation.maxlength)?? >
        <#assign patternMinMaxString = '(?=^(.{'+ minlength +','+ maxlength + '})$)'/>
    </#if>

    <#if (config.validation.pattern)?? >
        <#return 'pattern="' + patternMinMaxString + config.validation.pattern + '"'  >
    <#elseif (default.defaultPatterns.input[patternType].pattern)?? >
        <#return 'pattern="' + patternMinMaxString + default.defaultPatterns.input[patternType].pattern + '"'  >
    <#elseif (default.defaultPatterns[patternType])?? && (default.defaultPatterns[patternType].pattern)?? >
        <#return 'pattern="' + patternMinMaxString + default.defaultPatterns[patternType].pattern + '"'  >
    </#if>

</#function>

<#function hasPattern config = {} pattern = "">
    <#assign patternType = getPatternType(config pattern) />

    <#if (config.validation.pattern)?? || (default.defaultPatterns.input[patternType])?? || (default.defaultPatterns[patternType])?? >
        <#return true />
    <#else>
        <#return false />
    </#if>

</#function>

<#function getPatternType config = {} pattern = "">

    <#if (config.type)?? && pattern == "" >
        <#return config.type />
    <#elseif pattern != "" && ((default.defaultPatterns[pattern])?? || (default.defaultPatterns.input[pattern])??) >
        <#return pattern />
    <#else>
        <#return "none" />
    </#if>

</#function>

<#--  Attributs minlenght & maxlenght  -->
<#function minMaxLengthAttr config = {}>
    <#if (config.type)?? >
        <#assign type = config.type />
    <#else>
        <#assign type = "none" />
    </#if>
    <#assign maxlength = 0 />
    <#assign minlength = 0 />

    <#if (config.validation.maxlength)??>
        <#assign maxlength=config.validation.maxlength >
    <#elseif (default.defaultPatterns[type])?? && (default.defaultPatterns[type].maxlength)?? >
        <#assign maxlength=default.defaultPatterns[type].maxlength >
    </#if>

    <#if (config.validation.minlength)??>
        <#assign minlength=config.validation.minlength >
    <#elseif (default.defaultPatterns[type])?? && (default.defaultPatterns[type].minlength)?? >
        <#assign minlength=default.defaultPatterns[type].minlength>
    </#if>

    <#if (minlength gt 0 && maxlength gt 0) >
        <#return 'minlength="' + minlength?c + '" maxlength="' + maxlength?c + '"' >
    <#elseif (minlength gt 0) >
        <#return 'minlength="' + minlength?c + '"' >
    <#elseif (maxlength gt 0) >
        <#return 'maxlength="' + maxlength?c + '"' >
    <#else>
        <#return "" >
    </#if>
</#function>

<#--  Attributs min & max  -->
<#function minMaxAttr config = {}>
    <#assign type = config.type />
    <#assign max = "" />
    <#assign min = "" />
    <#assign datamax = "" />
    <#assign datamin = "" />

    <#if (config.validation.max)??>
        <#assign max=config.validation.max >
    <#elseif (default.defaultPatterns[type])?? && (default.defaultPatterns[type].max)?? >
        <#assign max=default.defaultPatterns[type].max >
    </#if>

    <#if (config.validation.min)??>
        <#assign min=config.validation.min >
    <#elseif (default.defaultPatterns[type])?? && (default.defaultPatterns[type].min)?? >
        <#assign min=default.defaultPatterns[type].min >
    </#if>

    <#if (config.validation.datamax)??>
        <#assign datamax=config.validation.datamax >
    </#if>

    <#if (config.validation.datamin)??>
        <#assign datamin=config.validation.datamin >
    </#if>

    <#if (min != "") && (max != "") >
        <#return 'min="' + min + '" max="' + max + '"' >
    <#elseif (min != "") >
        <#return 'min="' + min + '"' >
    <#elseif (max != "") >
        <#return 'max="' + max + '"' >
    </#if>

    <#if (datamin != "") && (datamax != "") >
        <#return 'data-min="' + datamin + '" data-max="' + datamax + '"' >
    <#elseif (datamin != "") >
        <#return 'data-min="' + datamin + '"' >
    <#elseif (datamax != "") >
        <#return 'data-max="' + datamax + '"' >
    </#if>

    <#return "" >
</#function>

<#--  Radio type buttons  -->
<#function isButtonsRadio config = {}>
    <#if (config.type)?? && config.type == "buttons">
        <#return true >
    <#else>
        <#return false >
    </#if>
</#function>