Rockcloud.RecordingRoute = Ember.Route.extend
  actions:
    download: (url) ->
      window.open(url)

  setupController: (controller, model) ->
    @controller.set('model', model)
    @controllerFor('currentlyPlaying').set('model', model.get('firstPiece'))