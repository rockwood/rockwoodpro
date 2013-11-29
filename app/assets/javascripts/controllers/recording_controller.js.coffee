Rockcloud.RecordingController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  badgeClass: (->
    switch @get('state')
      when 'confirmed'
        return 'badge--normal'
      when 'finished'
        return 'badge--success'
  ).property('state')