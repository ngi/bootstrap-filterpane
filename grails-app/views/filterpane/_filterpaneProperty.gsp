<tr>
	<td>
		${fieldLabel}
	</td>
	<td><g:select class="span3" id="${opName}" name="${opName}" from="${opKeys}"
			keys="${opKeys}" value="${opValue}" valueMessagePrefix="fp.op"
			onChange="grailsFilterPane.filterOpChange('${opName}', '${ctrlAttrs.id}');" />
	</td>
	<td><bfp:input ctrlType="${ctrlType}" ctrlAttrs="${ctrlAttrs}" />

		<g:if test="${toCtrlAttrs != null}">
			<span style="${toCtrlSpanStyle}" id="between-span-${toCtrlAttrs.id}">
				&nbsp;<g:message
					code="fp.tag.filterPane.property.betweenValueSeparatorText"
					default="and" />&nbsp; <bfp:input ctrlType="${ctrlType}"
					ctrlAttrs="${toCtrlAttrs}" />
			</span>
		</g:if></td>
</tr>