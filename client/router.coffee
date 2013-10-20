Router.configure
	layout: "layout"
	
Router.map ->
  @route 'home',
    path: '/'

  @route 'dashboard',
    path: '/dashboard'

