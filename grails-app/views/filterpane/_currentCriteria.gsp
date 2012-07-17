<g:if test="${isFiltered == true}">
	<ul id="${id}" class="${styleClass}" style="${style}" title="${title}">
		<g:each in="${criteria}" var="c">
			<li>
				${c.fieldName} 
				<g:message code="grails.plugins.bootstrapfilterpane.op.${c.filterOp}" />
				<g:if test="${quoteValues == true}">
					"${c.filterValue}"
				</g:if>
				<g:else>
					${c.filterValue}
				</g:else>
				<g:if test="${'between'.equalsIgnoreCase(c.filterOp)}">
					<g:if test="${quoteValues == true}">
						and "${c.filterValueTo}"
					</g:if>
					<g:else>
						and ${c.filterValueTo}
					</g:else>
				</g:if>
				<a href="${g.createLink(action:action, params:c.params)}" class="remove">
					<i class="icon-minus-sign"></i>
				</a>
			</li>
		</g:each>
	</ul>
</g:if>