Meteor.startup ->
  Accounts.ui.config
    passwordSignupFields: 'USERNAME_AND_EMAIL'
    requestPermissions:
      google: ['openid email https://www.googleapis.com/auth/calendar']
    requestOfflineToken:
      google: true

  AccountsEntry.config
    showSignupCode: true
    profileRoute: 'profile'

  if Meteor.user() && Meteor.user().profile.google
    Meteor.call('importGoogleEvents', Meteor.userId())
    Meteor.setInterval ->
      Meteor.call('importGoogleEvents', Meteor.userId())
    , 10*60*1000 #every 10 minutes

