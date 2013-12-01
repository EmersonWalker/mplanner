Meteor.startup ->
  if Meteor.users.find().count() is 0

    Accounts.createUser
      email: 'demo@demo.com'
      password: 'demo'
      profile: {}

    user = Meteor.users.findOne()
