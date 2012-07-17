<div class="controls form-inline">
	<a href="#" class="btn btn-mini btn-primary pull-right" onclick="reset${name.replaceAll('\\.','_')}();">
		<i class="icon-remove-circle icon-white"></i>
	</a>
	<label class="radio" for="${name}.yes"> <g:message
			code="grails.plugins.bootstrapfilterpane.property.boolean.true" /> <g:radio
			id="${name}.yes" name="${name}" value="true"
			checked="${value == 'true'}"
			onClick="grailsFilterPane.selectDefaultOperator('${opName}')" />
	</label> <label class="radio" for="${name}.no"> <g:message
			code="grails.plugins.bootstrapfilterpane.property.boolean.false" /> <g:radio
			id="${name}.no" name="${name}" value="false"
			checked="${value == 'false'}"
			onClick="grailsFilterPane.selectDefaultOperator('${opName}')" />
	</label>
	
	<r:script>
		function reset${name.replaceAll('\\.','_')}() {
			$("input[type=radio][id^='${name.replaceAll('\\.','\\\\\\.')}']").prop('checked', false);
			return false;
		}
	</r:script>
</div>
