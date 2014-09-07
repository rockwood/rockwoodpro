Rockcloud.ApplicationRoute = Ember.Route.extend
  actions:
    play: (piece) ->
      return unless piece.get('isPlayable')
      @controllerFor('currentlyPlaying').play(piece)

    videoDidEnd: ->
      @controllerFor('currentlyPlaying').playNext()

    download: (url) ->
      window.open(url)
