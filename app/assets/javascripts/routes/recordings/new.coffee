Rockcloud.RecordingsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recording')
