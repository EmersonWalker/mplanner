Accounts.ui.config
  requestPermissions:
    google: ['openid email https://www.googleapis.com/auth/calendar']
  requestOfflineToken:
    google: true

Meteor.startup ->
  if Meteor.user() && Meteor.user().profile.google
    Meteor.call('importGoogleEvents', Meteor.userId())
    Meteor.setInterval ->
      Meteor.call('importGoogleEvents', Meteor.userId())
    , 10*60*1000 #every 10 minutes
