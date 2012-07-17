<div id="${fp.containerId}" 
	class="filterpane${fp.containerIsDialog} ${fp.containerClass}"
	style="${fp.containerVisibleStyle}${fp.containerStyle}">
<g:if test="${fp.showTitle}">
	<h2>${fp.title}</h2>
</g:if>
<g:set var="renderForm" value="${fp.customForm == false}" />
<g:if test="${renderForm}">
	<form name="${fp.formName}" id="${fp.formName}" method="post" action="${createLink(action:fp.formAction)}">
</g:if>
<!-- Do we still need this hidden prop? -->
<input type="hidden" name="filterProperties" value="${fp.filterProperties}" />
<table class="table table-bordered table-condensed">
	<g:each in="${fp.properties}" var="propMap">
		<g:render template="/filterpane/filterpaneProperty" plugin="bootstrap-filterpane" model="${propMap}" />
	</g:each>
</table>

<g:if test="${fp.showSortPanel == true}">
	<g:render template="/filterpane/filterpaneSort" plugin="bootstrap-filterpane" model="${fp.sortModel}" />
</g:if>
<g:else>
	<input type="hidden" name="sort" value="${params.sort}" />
	<input type="hidden" name="order" value="${params.order}" />
</g:else>

<g:if test="${fp.showButtons == true}">
	<g:render template="/filterpane/filterpaneButtons" plugin="bootstrap-filterpane" model="${fp.buttonModel}" />
</g:if>

<g:if test="${renderForm}">
	</form>
</g:if>
</div>