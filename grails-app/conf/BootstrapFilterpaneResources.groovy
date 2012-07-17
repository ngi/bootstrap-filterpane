modules = {
	'bootstrap-filterpane' {
		defaultBundle 'filterpane'
		dependsOn 'bootstrap-filterpane-js, bootstrap-filterpane-css'
	}
	'bootstrap-filterpane-js' {
		defaultBundle 'filterpane'
		resource url:[plugin: 'bootstrap-filterpane', dir: 'js', file: 'fp.js']
	}

	'bootstrap-filterpane-css' {
		defaultBundle 'filterpane'
		resource url:[plugin: 'bootstrap-filterpane', dir: 'css', file: 'fp.css']
	}
}