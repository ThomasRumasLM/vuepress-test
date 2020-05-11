 
<#--
	Inject normalized ${data} in the [data-jsonld] of callee
  *Params :* 
   * data {any}
-->
<#macro show data>
  data-jsonld="${data?html}"
</#macro>