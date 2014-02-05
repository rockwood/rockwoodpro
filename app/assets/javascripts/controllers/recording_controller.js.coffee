Rockcloud.RecordingController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']
  actions:
    play: (piece) ->
      return unless piece.get('isPlayable')
      @set('controllers.currentlyPlaying.model', piece)

    videoDidEnd: ->
      return unless piece.get('isPlayable')
      @get('controllers.currentlyPlaying').next()

  badgeClass: (->
    switch @get('state')
      when 'confirmed'
        return 'badge--normal'
      when 'finished'
        return 'badge--success'
  ).property('state')