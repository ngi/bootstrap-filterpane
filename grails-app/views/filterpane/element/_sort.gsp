<div class="controls form-inline">
<label for="sort">
<g:message code="grails.plugins.bootstrapfilterpane.sort.orderByText" />
<g:if test="${sortValueMessagePrefix == null}">
	<!-- g:if test="${g.message(code:sortValueMessagePrefix) == 'false'}"-->
	<g:select name="sort" from="${sortedProperties}" keys="${sortKeys}"
		optionValue="filterPaneFieldName" value="${sortValue}"
		noSelection="${noSelection}" />
</g:if>
<g:else>
	<g:select name="sort" from="${sortedProperties}" keys="${sortKeys}"
		valueMessagePrefix="${sortValueMessagePrefix}"
		noSelection="${noSelection}" value="${sortValue}" />
</g:else>
</label>
<label class="radio" for="order.asc">
<g:radio name="order" value="asc" checked="${orderAsc}" />
<g:message code="grails.plugins.bootstrapfilterpane.sort.ascending"/>
</label>
<label class="radio" for="order.desc">
<g:radio name="order" value="desc" checked="${orderDesc}" />
<g:message code="grails.plugins.bootstrapfilterpane.sort.descending" />
</label>
</div>