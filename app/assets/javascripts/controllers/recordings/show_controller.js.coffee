Rockcloud.RecordingsShowController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']
  actions:
    play: (piece) ->
      return unless piece.get('isPlayable')
      @set('controllers.currentlyPlaying.model', piece)

    videoDidEnd: ->
      @get('controllers.currentlyPlaying').playNext()

  labelClass: (->
    switch @get('state')
      when 'requested'
        return 'label-default'
      when 'confirmed'
        return 'label-primary'
      when 'finished'
        return 'label-success'
  ).property('state')
