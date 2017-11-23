<@spring.message "operation.is.failure"/>
<#if errors??>
	<#list errors as error>
	     <#if error_index != 0>
	       ,
	     </#if>
		 <@spring.message error />
	</#list>

</#if>