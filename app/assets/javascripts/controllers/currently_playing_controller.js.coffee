Rockcloud.CurrentlyPlayingController = Ember.ObjectController.extend
  next: ->
    @set('model', @get('model.next'))

  previous: ->
    @set('model', @get('model.previous'))