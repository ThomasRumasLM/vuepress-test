<#-- Liste des variable TC ajouté au module -->
<#assign tc_vars = []>

<#--
Ajout d'un élément dans le tc_vars du module
@param name (string) : "env_type_page"
@param value (string|Number) : "homepage"
@param mergeable (bool) : false
-->
<#macro addVar name value mergeable = true>

    <#if value?trim?starts_with('[') || value?trim?starts_with('{')>
	    <#if mergeable>
	    	<#assign var = "{'name': '" + name + "', 'value': " + value + "}">
	    <#else>
	    	<#assign var = "{'name': '" + name + "', 'value': " + value + ", 'mergeable': '" + mergeable?c + "'}">
		</#if>
	<#else>
		<#if mergeable>
	    	<#assign var = "{'name': '" + name + "', 'value': '" + value + "'}">
	    <#else>
	    	<#assign var = "{'name': '" + name + "', 'value': '" + value + "', 'mergeable': '" + mergeable?c + "'}">
		</#if>
	</#if>

    <#assign tc_vars = tc_vars + [var]>
</#macro>

<#--
Print du tcVars complet
-->
<#macro tcVars>
	data-tcvars="[${tc_vars?join(', ')}]"
</#macro>
