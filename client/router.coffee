Router.configure
	layout: "layout"

Router.map ->
  @route 'home',
    path: '/'

  @route 'dashboard',
    path: '/dashboard'

    @route 'profile',
    path: '/profile'



Template.profile.rendered = ->
  $('#bio').keydown( (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  )

Template.profile.helpers
  name: ->
    Meteor.user().profile.name

  organization: ->
    Meteor.user().profile.organization

  location: ->
    Meteor.user().profile.location

  bio: ->
    Meteor.user().profile.bio

  url: ->
    Meteor.user().profile.url

Template.profile.events
  'change #name': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.name': $(event.target).val()
      }
    })

  'change #organization': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.organization': $(event.target).val()
      }
    })

  'change #location': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.location': $(event.target).val()
      }
    })

  'change #bio': (event) ->
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.bio': $(event.target).val()
      }
    })

  'change #url': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update(Meteor.userId(), {
      $set: {
        'profile.url': url
      }
    })

  'click .done': ->
    if Meteor.user().profile.name
      Router.go('/')
    else
      $('.errors').text('Name is required.')