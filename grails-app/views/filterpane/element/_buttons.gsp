<a href="#" class="btn" onclick="return toggle${containerId}();"> ${cancelText}
</a>
<a class="btn"
	onclick="return grailsFilterPane.clearFilterPane('${formName}');">
	${clearText}
</a>
<g:actionSubmit class="btn btn-primary" value="${applyText}"
	action="${action}" />
