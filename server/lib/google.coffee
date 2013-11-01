Meteor.startup ->
  Meteor.methods

    importGoogleEvents: (userId)->
      url = 'https://www.googleapis.com/calendar/v3/calendars/' +
        Meteor.user().services.google.email +
        '/events?timeMin=' +
        (new Date()).toISOString() +
        '&access_token=' +
        Meteor.user().services.google.accessToken

      Meteor.http.get url, (err, res) ->
        params = {}
        if err
          console.log err
        else
          console.log 'imported events for ' + userId
          Events.remove userId: userId
          _.each res.data.items, (element, index, events) ->
            params.googleId = element.id
            params.status = element.status
            params.location = element.location
            params.start = element.start.dateTime
            params.end = element.end.dateTime
            params.url = element.htmlLink
            params.title = element.summary
            params.attendees = element.attendees
            params.allDay = false
            params.userId = userId
            Events.insert params
