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

  shareLink: (->
    hash = @container.lookup("router:main").generate('recording.shared', @get('model'))
    window.location.host + window.location.pathname + hash
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


