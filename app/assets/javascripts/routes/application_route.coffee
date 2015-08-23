Rockcloud.ApplicationRoute = Ember.Route.extend
  actions:
    error: (response, transition) ->
      if response.status == 401
        window.location = encodeURI("/?error=Please sign in")

    play: (piece) ->
      return unless piece.get('isPlayable')
      @controllerFor('currentlyPlaying').play(piece)

    videoDidEnd: ->
      @controllerFor('currentlyPlaying').playNext()

    download: (url) ->
      window.open(url)

    openModal: (modalName) ->
      @render("modals/#{modalName}", { into: 'application', outlet: 'modal' })

    closeModal: ->
      @disconnectOutlet({ outlet: 'modal', parentView: 'application' })

    willTransition: ->
      @send('closeModal')
