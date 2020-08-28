<#macro stepsList value heading="h4">
    <#assign size = value?size>

    <#if size lt 2 || size gt 4>
        <p class='ka-text--micro ka-text--error'>
            Nombre d'étapes supportées entre <mark>2</mark> et <mark>4</mark>, nombre d'étapes actuelles : <mark>${ value?size }</mark>
        </p>
    <#else>

        <#--  assign pad size  -->
        <#assign padSize = "col-s-12 col-m-6 col-xl-5 col-xxl-3">
        <#switch size>
            <#case 3>
                <#assign padSize = "col-s-12 col-m-4 col-xxl-2">
                <#break>
            <#case 4>
                <#assign padSize = "col-s-12 col-m-6 col-l-3">
                <#break>
        </#switch>

        <ul class="col-container">
            <#assign currentStep = 1>
            <#list value as step>

                <#--  assign pad start  -->
                <#assign padStart = "">
                <#if currentStep == 1>
                    <#switch size>
                        <#case 2>
                            <#assign padStart = "col-start-xl-2 col-start-xxl-4">
                            <#break>
                        <#case 3>
                            <#assign padStart = "col-start-xxl-4">
                            <#break>
                    </#switch>
                </#if>

                <li class="km-step-pad ${padSize} ${padStart}">
                    <div class="km-step-pad__number">
                        ${currentStep}
                    </div>

                    <#if (step.title)??>
                        <${heading} class="km-step-pad__title">${step.title}</${heading}>
                    </#if>

                    <p class="km-step-pad__description">${step.text}</p>

                    <#assign currentStep = currentStep + 1>
                </li>

            </#list>
        </ul>

    </#if>
</#macro>