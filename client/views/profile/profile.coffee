Template.profile.rendered = ->
  $('#bio').keydown( (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  )

Template.profile.helpers
  email: ->
    if Meteor.user().emails?
      Meteor.user().emails[0].address

  firstName: ->
    Meteor.user().profile.firstName

  lastName: ->
    Meteor.user().profile.lastName

  typeIsStudent: ->
    Meteor.user().profile.type is 'student'

  typeIsParent: ->
    Meteor.user().profile.type is 'parent'

Template.profile.events
  'click #parent': (event)->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.type': 'parent'
      }
    })

  'click #student': (event)->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.type': 'student'
      }
    })

  'change #email': (event) ->
    Meteor.call('changeEmail', Meteor.userId(), $(event.target).val())

  'change #firstName': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.firstName': $(event.target).val()
      }
    })

  'change #lastName': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.lastName': $(event.target).val()
      }
    })


  'click .done': ->
    if Meteor.user().profile.type
      Router.go('/')
    else
      $('.alert-danger').removeClass('hidden')
      $('.alert-danger').text('You must choose a type.')
