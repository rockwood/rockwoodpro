Rockcloud.RecordingsRoute = Ember.Route.extend
  model: ->
    Rockcloud.Recording.find()
