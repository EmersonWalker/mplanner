Meteor.startup ->
  AccountsEntry.config
    wrapLinks: true
    homeRoute: 'home'
    dashboardRoute: 'dashboard'
    profileRoute: 'profile'
    signupCode: 'emersoniscool'
