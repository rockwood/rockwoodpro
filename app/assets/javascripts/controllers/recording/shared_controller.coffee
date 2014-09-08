Rockcloud.RecordingSharedController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  sharedPieces: (->
    @get('pieces').filterBy('shared', true)
  ).property('pieces')

