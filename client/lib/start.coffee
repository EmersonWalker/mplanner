Meteor.startup ->
  Accounts.ui.config
    passwordSignupFields: 'USERNAME_AND_EMAIL'
  AccountsEntry.config
    showSignupCode: true