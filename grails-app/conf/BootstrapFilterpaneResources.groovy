modules = {
	'bootstrap-filterpanel' {
		defaultBundle 'filterpanel'
		dependsOn 'bootstrap-filterpanel-js, bootstrap-filterpanel-css'
	}
	'bootstrap-filterpanel-js' {
		defaultBundle 'filterpanel'
		resource url:[plugin: 'twitter-bootstrap-filterpanel', dir: 'js', file: 'fp.js']
	}

	'bootstrap-filterpanel-css' {
		defaultBundle 'filterpanel'
		resource url:[plugin: 'twitter-bootstrap-filterpanel', dir: 'css', file: 'fp.css']
	}
}