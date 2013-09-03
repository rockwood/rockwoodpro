Rockcloud.RecordingsRoute = Ember.Route.extend
  events:
    goTo: (recording) ->
      @transitionTo('recording', recording)

  model: ->
    Rockcloud.Recording.find()
