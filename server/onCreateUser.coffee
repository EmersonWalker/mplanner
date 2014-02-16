Accounts.onCreateUser (options, user)->
  if options.profile
    user.profile = options.profile
  else
    user.profile = {}
  if user.services.google
    user.emails = [{address: user.services.google.email, verified: true}]
    user.profile.firstName = user.services.google.given_name
    user.profile.lastName = user.services.google.family_name
    user.profile.photo = user.services.google.picture
  user
