Rockcloud.RecordingsShowController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  labelClass: (->
    switch @get('state')
      when 'requested'
        return 'label-default'
      when 'confirmed'
        return 'label-primary'
      when 'finished'
        return 'label-success'
  ).property('state')
