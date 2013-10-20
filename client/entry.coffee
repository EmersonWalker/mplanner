Meteor.startup ->
  Accounts.ui.config(
    passwordSignupFields: 'EMAIL_ONLY'
  )
