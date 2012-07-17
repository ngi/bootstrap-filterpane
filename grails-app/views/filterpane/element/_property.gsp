<tr>
	<td>
		${fieldLabel}
	</td>
	<td><g:select class="span3" id="${opName}" name="${opName}" from="${opKeys}"
			keys="${opKeys}" value="${opValue}" valueMessagePrefix="grails.plugins.bootstrapfilterpane.op"
			onChange="grailsFilterPane.filterOpChange('${opName}', '${ctrlAttrs.id}');" />
	</td>
	<td><bfp:input ctrlType="${ctrlType}" ctrlAttrs="${ctrlAttrs}" />
	
		<g:if test="${toCtrlAttrs != null}">
			<span style="${toCtrlSpanStyle}" id="between-span-${toCtrlAttrs.id}">
				<g:message
					code="grails.plugins.bootstrapfilterpane.property.betweenValueSeparatorText"/>
					<bfp:input ctrlType="${ctrlType}"
					ctrlAttrs="${toCtrlAttrs}" />
			</span>
		</g:if></td>
</tr>
<r:script>grailsFilterPane.filterOpChange('${opName}', '${ctrlAttrs.id}');</r:script>