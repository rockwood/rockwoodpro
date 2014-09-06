Rockcloud.RecordingsRoute = Ember.Route.extend
  actions:
    error: (response, transition) ->
      if response.status == 401
        window.location = encodeURI("/?error=Please sign in")

  model: ->
    @store.findAll('recording')
