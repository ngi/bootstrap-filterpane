<span id="${ctrlAttrs.id}-container" style="${ctrlAttrs.style}">
	<%= lono.jqDatePicker(ctrlAttrs) %>
	<g:if test="${ctrlAttrs.name?.endsWith('To')}">
	<g:hiddenField name="filter.${ctrlAttrs.domain}.${ctrlAttrs.propertyName}_isDayPrecision" value="${ctrlAttrs.isDayPrecision}"/>
	</g:if>
</span>
