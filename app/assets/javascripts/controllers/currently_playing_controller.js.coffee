Rockcloud.CurrentlyPlayingController = Ember.ObjectController.extend
  playNext: ->
    nextPiece = @get('next')
    return unless nextPiece.get('isPlayable')
    @set('model', nextPiece)

  playPrevious: ->
    previousPiece = @get('previous')
    return unless previousPiece.get('isPlayable')
    @set('model', previousPiece)