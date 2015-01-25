Rockcloud.RecordingsShowRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controller.set('model', model)
    @controllerFor('currentlyPlaying').set('model', model.get('firstPiece'))
