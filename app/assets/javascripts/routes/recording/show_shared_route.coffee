Rockcloud.RecordingShowSharedRoute = Ember.Route.extend
  renderTemplate: ->
    @render('recordings/show', controller: 'recordingsShow')

  setupController: (controller, model) ->
    @controllerFor('recordingsShow').set('model', model)
    @controllerFor('currentlyPlaying').set('model', model.get('firstPiece'))
