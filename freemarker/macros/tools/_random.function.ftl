<#function rand min max>
  <#local now = .now?long?c />
  <#local randomNum = _rand +
    ("0." + now?substring(now?length-1) + now?substring(now?length-2))?number />
  <#if (randomNum > 1)>
    <#assign _rand = randomNum % 1 />
  <#else>
    <#assign _rand = randomNum />
  </#if>
  <#--  Pour empecher la remonté du même nombre en cas d'éxecution parallele a la même seconde  -->
  <#list 1..100000  as x></#list>
  <#return (min + ((max - min) * _rand))?round />
</#function>
<#assign _rand = 0.76 />