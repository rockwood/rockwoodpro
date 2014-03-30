Rockcloud.RecordingNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recording')
