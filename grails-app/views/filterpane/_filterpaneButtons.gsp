<div class="form-actions">
	<a href="#" class="btn"
		onclick="return grailsFilterPane.hideElement('${containerId}');">
		${cancelText}
	</a> <a class="btn"
		onclick="return grailsFilterPane.clearFilterPane('${formName}');">
		${clearText}
	</a>
	<g:actionSubmit class="btn btn-primary" value="${applyText}" action="${action}" />
</div>