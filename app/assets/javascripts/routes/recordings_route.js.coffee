Rockcloud.RecordingsRoute = Ember.Route.extend
  model: ->
    @store.findAll('recording')
