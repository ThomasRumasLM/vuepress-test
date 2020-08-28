<#import "common-macro.ftl" as macros>
<#import "icons.ftl" as icons>
<#import "./tokens/tags.ftl" as tagsJson>

<#assign tagIdNumber = 999>

<#macro tagMozaic configTag = {} dataSup...>

	<@compress single_line=true>
		<#--  Set default type  -->
		<#local type = "text"/>

		<#--  Set type  -->
		<#if tagsJson.json.types?seq_contains('${configTag.type!}')>
			<#local type = "${configTag.type!}"/>
		</#if>

		<#--  Set mainClass prefixClass with type -->
		<#local mainClass = "${tagsJson.json.class}-${type}"/>
		<#if configTag.type?has_content && configTag.type == "list">
			<#local mainClass = "${tagsJson.json.class}-selectable"/>
		</#if>

		<#local listClass = "${tagsJson.json.class}-${type}"/>
		<#local listItem = "${listClass}${tagsJson.json.item}"/>
        <#local htmlTag = "span" />
		<#local customClasses ="" />
		<#local disabledState ="" />
		<#local dataAttributes=""/>

		<#if dataSup?is_hash>
			<#list dataSup as key, value>
				<#if key != 'class'>
					<#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
				</#if>
				<#if key == 'class'>
					<#local customClasses = customClasses + "${value}"/>
				</#if>
				<#if configTag.type?has_content && configTag.type == "list" && key == 'disabled'>
					<#local disabledState = disabledState + " ${key}=\"${value}\""/>
				</#if>
			</#list>
		</#if>
		<#--  Change HTML tag to "a" if link is set  -->

		<#if configTag.type?has_content && configTag.type == "link">
        	<#local htmlTag = "a" />
		</#if>
        <#--  Set theme -->
		<#if tagsJson.json.themes?seq_contains('${configTag.theme!}')>
			<#local theme = "${configTag.theme!}"/>
		</#if>
		<#--  Set size -->
		<#if configTag.size?has_content && configTag.size == "s">
			<#local size = "${mainClass}-${tagsJson.json.size}" />
		</#if>

        <#--  Component tag  -->
		<#if configTag.type?has_content && configTag.type == "list">
			<li class= "${listItem}">
		</#if>
         <${htmlTag} class="${mainClass} ${customClasses!}<#if configTag.theme?has_content> ${mainClass}--${theme}</#if>
		 <#if configTag.size?has_content && configTag.size == "s"> ${mainClass}--${tagsJson.json.size}</#if>" ${dataAttributes} >
			<#if configTag.type?has_content && configTag.type == "selectable" || configTag.type?has_content && configTag.type == "list" >
				<#local tagId = data.name + tagIdNumber?c >
				<input
					class="${mainClass}${tagsJson.json.input}"
					type="checkbox"
					name="${tagId}-input"
					id="${tagId}"

					<#if configTag.button?has_content && configTag.button == "disabled">
						disabled
					</#if>${disabledState!}
				/>
				<label class="${mainClass}${tagsJson.json.labelSelectable}" for="${tagId}">
			</#if>
            <span class="${mainClass}${tagsJson.json.label}">
                <#nested/>
            </span>
			<#if configTag.type?has_content && configTag.type == "removable">
      			<button class="${mainClass}${tagsJson.json.buttonRemovable}" aria-label="delete tag <#nested/>" ></button>
			</#if>
			<#if configTag.type?has_content && configTag.type == "selectable"></label></#if>
        </${htmlTag}>
		<#if configTag.type?has_content && configTag.type == "list">
			</li>
		</#if>
		<#assign tagIdNumber = tagIdNumber - 1>
	</@compress>
</#macro>



<#macro tagMozaicList configTag = {} dataSup...>

	<@compress single_line=true>
		<#local dataAttributes=""/>
		<#local customClasses = ""/>
		<#if dataSup?is_hash>
			<#list dataSup as key, value>
				<#if key != 'class'>
					<#local dataAttributes = dataAttributes + " ${key}=\"${value}\""/>
				</#if>
				<#if key == 'class'>
					<#local customClasses = customClasses + "${value}"/>
				</#if>
			</#list>
		</#if>
		<#local listClass = "${tagsJson.json.class}-list"/>
			<ul class="${listClass} ${customClasses!}" ${dataAttributes!}>
				<#nested>
			</ul>
	</@compress>
</#macro>
