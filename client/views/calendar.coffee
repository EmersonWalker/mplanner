Template.calendar.rendered = ->
  options =
    defaultView: "agendaWeek"
    height: 600
    allDaySlot: false
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"
    eventClick: (event) ->
      if event.url
        window.open event.url
        false

  $('#calendar').show()
  $('#calendar').fullCalendar(options)
  $('#calendar').fullCalendar('addEventSource', Events.find().fetch())
