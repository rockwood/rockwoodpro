Rockcloud.RecordingsShowController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  actions:
    helpShare: ->
      @toggleProperty('isHelpingShare')
      false

  labelClass: (->
    switch @get('state')
      when 'requested'
        return 'label-default'
      when 'confirmed'
        return 'label-primary'
      when 'finished'
        return 'label-success'
  ).property('state')

  shareLink: (->
    path = @container.lookup("router:main").generate('recording.shared', @get('model'))
    window.location.origin + path
  ).property('id')

  encodedShareLink: (->
    encodeURIComponent(@get('shareLink'))
  ).property('shareLink')

  encodedShareCaption: (->
    encodeURIComponent("Checkout my performance: ")
  ).property()

  facebookLink: (->
    "https://www.facebook.com/sharer/sharer.php?u=#{@get('encodedShareLink')}&t=#{@get('encodedShareCaption')}"
  ).property('shareLink')

  twitterLink: (->
    "https://twitter.com/home?status=#{@get('encodedShareCaption')}#{@get('encodedShareLink')}"
  ).property('shareLink')


